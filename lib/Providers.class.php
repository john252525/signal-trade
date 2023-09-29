<?php

class Providers
{
	private $db;
	private $table;

	public function __construct($db, $table) {
        $this->db = $db;
        $this->table = $table;
    }

	// public function isExist($provider_id){
	// 	$sql  = 'SELECT COUNT(id) AS cnt FROM ' . $this->table . ' WHERE id=?i';
	// 	$cnt = $this->db->getOne($sql, $provider_id);

	// 	return ($cnt>0) ? true : false;
	// }

	public function GetUrl($provider_id){
		
		$sql  = 'SELECT url FROM ' . $this->table . ' WHERE id=?i';		
    	$url = $this->db->getOne($sql, $provider_id);
		
		return $url;
	}


}
