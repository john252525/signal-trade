<?php

function httprequest($url){

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

	require_once 'config.php';
	require_once 'lib/safemysql.class.php';
	

	$opts = array(
			'user'    => _DB_LOGIN_,
			'pass'    => _DB_PASSWORD_,
			'db'      => _DB_DATABASE_,
			'charset' => 'utf8'
	);
	$db = new SafeMySQL($opts); // with some of the default settings overwritten


	if(isset($_GET['provider_id'])){
		require_once 'lib/Providers.class.php';
		$provider = new Providers($db, _DB_TABLE_PROVIDER_); 

		$provider_id=intval($_GET['provider_id']);		
		$url=$provider->GetUrl($provider_id);

		if ($url==false){
			die ('Error: provider unknown');
		}
	}else{
		die ('Error: need provider id');
	}


	if(isset($_GET['token'])){

		require_once 'lib/Users.class.php';
		$user = new Users($db, _DB_TABLE_USER_); 

		$token=intval($_GET['token']);		
		$user_id=$user->GetUserId($token);

		if ($user_id==false){
			die ('Error: user unknown');
		}
	}else{
		die ('Error: need user token');
	}

	if(isset($_GET['text'])){

		$text_in=$_GET['text'];

		require_once 'lib/Request.class.php';
		$request = new Request($db, _DB_TABLE_REQUEST_, $provider_id, $user_id); 

		echo 'input_data:'.$text_in.'<br>';
		$request->InsertInputData($text_in);

		$text_get=httprequest($url . rawurlencode($text_in));
		
		echo 'get_data:'.$text_get.'<br>';
		$request->SaveRequestData($text_get);
		
	}else{
		die ('Error: text is empty');
	}


?>