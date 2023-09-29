<?php

class Users
{
	private $db;
	private $table;

	public function __construct($db, $table) {
        $this->db = $db;
        $this->table = $table;
    }

	public function GetUserId($token){
		$sql  = 'SELECT id FROM ' . $this->table . ' WHERE token=?s';
    	$id = $this->db->getOne($sql, $token);

		return $id;
	}


}
