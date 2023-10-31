<?php

class Signal
{
	private $db;
	
	public function __construct($db) {
        $this->db = $db;
    }

	//---------------------------------------
	// Сохранить сигнал в БД
	//---------------------------------------
	public function SaveSignal($data, $presignal_id, $rule_id, $table){
		$sql  = 'INSERT INTO ?n SET presignal_id=?i, rule_id=?i, dt_ins=?s, ts_ins=?i, data=?s';

		$this->db->query($sql,
		                        $table,
								$presignal_id, 
								$rule_id, 
								date('Y-m-d H:i:s'), time(), 
								json_encode($data)
						);

		$result=$this->db->insertId();

		return $result;
	}

	//---------------------------------------
	// Расчитать недостающие данные сигнала
	//---------------------------------------
	private function CalcSignal($presignal, $rule_array){

		require_once 'lib/SimpleExpression/SimpleContext.php';
		require_once 'lib/SimpleExpression/SimpleExpression.php';


		try {

			$presignal['stock'] = $rule_array['stock'];
    		$presignal['qty']  = $rule_array['qty'];

			$positionSide=$presignal['positionSide'];
			switch ($positionSide) {
				case 'long':
				case 'short':

					if ( !isset($presignal['stoploss']) ){

						$expression = $rule_array[$positionSide]['stoploss']; 
						$se = new SimpleExpression($expression); 
						$vars = []; foreach ($presignal as $key => $value) $vars[$key]=$value;
						$stoploss = number_format($se->run($vars), 4, '.', '');
						$presignal['stoploss']=$stoploss;
						unset($se);			
					}


					if ( !isset($rule_array[$positionSide]['takeprofit1']) ){

						foreach ($rule_array[$positionSide]['takeprofit'] as $take_num => $take_rule) {
							$expression = $take_rule; 
							$se = new SimpleExpression($expression); 
							$vars = []; foreach ($presignal as $key => $value) $vars[$key]=$value;
							$takeprofit=number_format($se->run($vars), 4, '.', '');
							$presignal['takeprofit'.($take_num+1)] = $takeprofit;
							unset($se);

							$takeprofit_volume=( $rule_array['qty'] / 100 * $rule_array['takeprofit_volume'][$take_num] );
							$presignal['takeprofit'.($take_num+1).'_volume']=$takeprofit_volume;
						}

					}
			
					break;
				
				default:
					die('wrong positionSide');
					break;
			}


		} catch (SimpleExpressionParseError $e) {
			print "Parse error at position {$e->getPosition()}: {$e->getMessage()}" . PHP_EOL;

			print $expression . PHP_EOL;
			print str_repeat(' ', $e->getPosition()) . '^' . PHP_EOL; 
		}
	 	
	  
	  	return $presignal;

	}


	//------------------------------------------------
	// Для каждого правила постащика расчитать сигнал
	//------------------------------------------------
	public function CalculateSignals($text_get, $provider_id, $table){

    	$presignal=json_decode($text_get, true);
    	echo "<hr>presignal<pre>"; print_r($presignal); echo "</pre>"; 

		$sql  = 'SELECT id, rule_text FROM ?n WHERE provider_id=?i';
		$rules = $this->db->getAll($sql, $table, $provider_id);

		$result=array();
		foreach ($rules as $rule) {
	    	$rule_array=json_decode($rule['rule_text'], true);
	    	echo "<hr>rule<pre>"; print_r($rule_array); echo "</pre>";

	    	$result[ $rule['id'] ]=$this->CalcSignal($presignal, $rule_array);
		}

    	return $result;
    }

}
