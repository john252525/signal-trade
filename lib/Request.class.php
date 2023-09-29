<?php

class Request
{
	private $db;
	private $table;

	private $request_id;
	private $provider_id;
	private $user_id;

	public function __construct($db, $table, $provider_id, $user_id) {
        $this->db = $db;
        $this->table = $table;

        $this->provider_id=$provider_id;
		$this->user_id=$user_id;
    }

	public function InsertInputData($text_in){
		$sql  = 'INSERT INTO ' . $this->table . ' SET provider_id=?i, user_id=?i, dt_ins=?s, ts_ins=?i, text_in=?s';

		$this->db->query($sql, $this->provider_id, $this->user_id, date('Y-m-d H:i:s'), time(), $text_in);

		$this->request_id=$this->db->insertId();
	}


	public function SaveRequestData($text_get){

		$sql  = 'UPDATE ' . $this->table . ' SET text_get=?s WHERE id=?i';
		$this->db->query($sql, $text_get, $this->request_id);

	}

}
?>