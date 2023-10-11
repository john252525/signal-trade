<?php

class Presignal
{
	private $db;
	
	public function __construct($db) {
        $this->db = $db;
    }


	//-------------------------------------------------------------
	// Сохранить вводный пресигнал от бота
	//-------------------------------------------------------------
	public function SavePresignal($text_in, $provider_id, $user_id, $table){
		$sql  = 'INSERT INTO ' . $table . ' SET provider_id=?i, user_id=?i, dt_ins=?s, ts_ins=?i, text_in=?s';

		$this->db->query($sql, $provider_id, $user_id, date('Y-m-d H:i:s'), time(), $text_in);

		$result=$this->db->insertId();

		return $result;
	}


	//-------------------------------------------------------------
	// Сохранить расшифровку в БД в строку с пресигналом от бота
	//-------------------------------------------------------------
	public function UpdatePresignal($text_get, $presignal_id, $table){

		$sql  = 'UPDATE ' . $table . ' SET text_get=?s WHERE id=?i';
		$this->db->query($sql, $text_get, $presignal_id);

	}


}
?>