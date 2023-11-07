<?php

class Order
{
	private $db;
	
	public function __construct($db) {
        $this->db = $db;
    }

	//---------------------------------------
	// Сохранить ордер в БД
	//---------------------------------------
	public function SaveOrder($order, $signal_id){
		$sql  = 'INSERT INTO `' . _DB_TABLE_ORDER_ . '` SET signal_id=?i, dt_ins=?s, ts_ins=?i, stock=?s, type=?s, side=?s, positionSide=?s, pair=?s, data=?s';
		
		$this->db->query($sql, 
								$signal_id,
								date('Y-m-d H:i:s'), time(),
								$order['stock'],
								$order['type'],
								$order['side'],
								$order['positionSide'],
								$order['pair'],
								json_encode($order['data'])
						);

	}

	//--------------------------------------------------------
	// Создать готовый ордер на основе вводных данных
	//--------------------------------------------------------
	private function GenOrder($stock, $type, $side, $positionSide, $pair, $qty, $price, $stoploss=NULL){

		$result= array(

						'stock' 		=> $stock, 			//(binance_spot)
						'type' 			=> $type,			//(limit/oco)
						'side' 			=> $side,			//(buy/sell)
						'positionSide' 	=> $positionSide,	//(long/short)
						'pair'			=> $pair,			//(btc_usdt)
						'data' => array(
											'qty' => $qty, 
											'price' => $price
										)
					  );
		
		if 	( $stoploss!==NULL ) $result['data']['stoploss'] = $stoploss;

		return $result;
	}



	//----------------------------------------------------------------------
	// Создать ордера (1 на покупку/продажу и несколько на продажу/покупку)
	//----------------------------------------------------------------------
	public function CalcOrder($signal){

		$order=array();
		$positionSide=$signal['positionSide'];
		switch ($positionSide) {
			case 'long':
				$side='buy';
				break;
			case 'short':
				$side='sell';
				break;
			default:
				die('wrong positionSide');
				break;
		}
			
		// ордер на продажу/покупку
		$order[]=$this->GenOrder(
										$signal['stock'],
										'limit',
										$side,
										$signal['positionSide'],
										$signal['pair'],

										$signal['qty'],
										$signal['price']
								);

		// ордера на продажу
		$inverted_side = ($side == 'buy') ? 'sell' : 'buy';
		$key=1;
		while ( isset($signal['takeprofit'.$key]) ){
			$order[]=$this->GenOrder(
										$signal['stock'],
										'oco',
										$inverted_side,
										$signal['positionSide'],
										$signal['pair'],

										$signal['takeprofit' . $key.'_volume'],
										$signal['takeprofit' . $key],
										$signal['stoploss']	
									);
			$key++;

		}				

	  	return $order;

	}


}
