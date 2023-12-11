<?php

function httprequest($url)
{

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url); // отправляем на
	curl_setopt($ch, CURLOPT_HEADER, 0); // пустые заголовки
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); // возвратить то что вернул сервер
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); // следовать за редиректами
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30); // таймаут4
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36");
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

	if (!$data = curl_exec($ch)) {
		$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
		echo 'Ошибка curl: ' . $httpCode . '' . '<br>';
		flush();
		echo 'Ошибка curl: ' . curl_errno($ch) . '' . '<br>';
		flush();
		echo 'Ошибка curl: ' . curl_error($ch) . '' . '<br>';
		flush();
	}

	curl_close($ch);
	return $data;

}
//=====================================================	
echo '<head><meta charset="UTF-8"><head>';

set_time_limit(60);
mb_internal_encoding("UTF-8");

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once 'config.php';
require_once 'lib/db/safemysql.class.php';


$opts = array(
	'user' => _DB_LOGIN_,
	'pass' => _DB_PASSWORD_,
	'db' => _DB_DATABASE_,
	'charset' => 'utf8mb4'
);
$db = new SafeMySQL($opts); // with some of the default settings overwritten


if (isset($_GET['token'])) {

	require_once 'lib/Users.class.php';
	$user = new Users($db, _DB_TABLE_USER_);

	$token = $_GET['token'];
	$user_id = $user->GetUserId($token);

	if ($user_id == false) {
		die('Error: user unknown');
	}
} else {
	die('Error: need user token');
}


if (isset($_GET['provider'])) {
	require_once 'lib/Providers.class.php';
	$provider = new Providers($db, _DB_TABLE_PROVIDER_);

	$provider_name = $_GET['provider'];
	$provider_data = $provider->GetUrl($provider_name);

	if ($provider_data == false) {
		die('Error: provider unknown');
	}

	$provider_id = $provider_data[0]['id'];
	$provider_url = $provider_data[0]['url'];

} else {
	die('Error: need provider name');
}


if ((isset($_GET['text'])) && (trim($_GET['text']) != '')) {

	$text_in = trim($_GET['text']);

	if ($text_in == 'test')
		$text_in = 'LONG #SOLUSDT from $24.83 stop loss $24.73';

	require_once 'lib/Presignal.class.php';
	$presignal = new Presignal($db);

	echo 'input_data:<br>' . $text_in . '<br>';

	// Сохранить вводный пресигнал от бота
	$presignal_id = $presignal->SavePresignal($text_in, $provider_id, $user_id, _DB_TABLE_PRESIGNAL_);

	// Получить расшифровку из облака
	$text_get = !empty($provider_url) ? httprequest($provider_url . rawurlencode($text_in)) : $text_in;
	echo '<hr>get_data:<br>' . $text_get . '<br>';

	// Сохранить расшифровку в БД в строку с пресигналом от бота
	$presignal->UpdatePresignal($text_get, $presignal_id, _DB_TABLE_PRESIGNAL_);

	require_once 'lib/Signal.class.php';
	$signal = new Signal($db);

	// Добавить в расшифровку недостающие данные (takeprofit, stoploss и пр.)
	// Кол-во готовых сигналов зависит от кол-ва правил постащика
	$fullsignals = $signal->CalculateSignals($text_get, $provider_id, _DB_TABLE_RULE_); //// echo, print_r inside
	echo "<hr>fullsignals:<pre>";
	print_r($fullsignals);
	echo "</pre>";

	require_once 'lib/Order.class.php';
	$order = new Order($db);

	foreach ($fullsignals as $rule_id => $fullsignal) {
		// Сохранить сигнал в БД
		$signal_id = $signal->SaveSignal($fullsignal, $presignal_id, $rule_id, _DB_TABLE_SIGNAL_);

		// Создать ордера (1 на покупку/продажу и несколько на продажу/покупку)
		$orders = $order->CalcOrder($fullsignal);
		$order_ids = [];
		foreach ($orders as $orderdata) {
			// Сохранить ордер в БД
			$order_ids []= $order->SaveOrder($orderdata, $signal_id);
			echo "<hr>order:<pre>";
			print_r($orderdata);
			echo "</pre>";
		}




		//print_r($orders);
		$url = _URL_ . '&action=create&stock=binance_spot&mode=json';
		$params = array(
			'json' => json_encode($orders),
		);
		$result = file_get_contents($url, false, stream_context_create(
			array(
				'http' => array(
					'method' => 'POST',
					'header' => 'Content-type: application/x-www-form-urlencoded',
					'content' => http_build_query($params)
				)
			)
		));
		
		$result_data = json_decode($result, true);
		if (isset($result_data['data'])) {
			if ( ! empty($result_data['data']['deal'])) {
				$signal->AddDealId($signal_id, $result_data['data']['deal'], _DB_TABLE_SIGNAL_);
			}
			if ( ! empty($result_data['data']['preorders'])) {
				for ($i = 0; $i < count($result_data['data']['preorders']); $i++) {
					$order->AddPreorderId($order_ids[$i], $result_data['data']['preorders'][$i]);
				}
				
			}
		}

		echo isset($result_data['error'])
			 ? 'Error: ' . $result_data['error']
			 : $result_data['message'];




	}



} else {
	die('Error: text is empty');
}


?>