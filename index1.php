<?php

function request($url){

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url ); // отправляем на
	curl_setopt($ch, CURLOPT_HEADER, 0); // пустые заголовки
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); // возвратить то что вернул сервер
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1); // следовать за редиректами
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);// таймаут4
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt ($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36"); 
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

	if (!$data = curl_exec($ch)){
      $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
      echo 'Ошибка curl: ' .$httpCode.''.'<br>'; flush();
      echo 'Ошибка curl: ' . curl_errno($ch).''.'<br>'; flush();
      echo 'Ошибка curl: ' . curl_error($ch).''.'<br>'; flush();
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

	define('_DB_LOGIN_',  	"root");
	define('_DB_PASSWORD_', '');
	define('_DB_DATABASE_', 'task');

	define('_DB_TABLE_',	'tab');
	
	require_once 'safemysql.class.php';

	$opts = array(
			'user'    => _DB_LOGIN_,
			'pass'    => _DB_PASSWORD_,
			'db'      => _DB_DATABASE_,
			'charset' => 'utf8'
	);
	$db = new SafeMySQL($opts); // with some of the default settings overwritten

	if(isset($_GET['text_in'])){

		$text_in=$_GET['text_in'];
		$sql  = "INSERT INTO "._DB_TABLE_." SET dt_ins=?s, ts_ins=?i, text_in=?s";
			$db->query($sql, date('Y-m-d H:i:s'), time(), $text_in);

		echo 'input_data:'.$text_in.'<br>';

		$last_id=$db->insertId();

		$text_get=request('https://functions.yandexcloud.net/d4e8sb6mvsuognj3jv94?text='.rawurlencode($text_in));
		$sql  = "UPDATE "._DB_TABLE_." SET text_get=?s WHERE id=?i";
			$db->query($sql,$text_get,$last_id);

		echo 'get_data:'.$text_get.'<br>';
		
	}else{
		echo "no data";
	}


?>