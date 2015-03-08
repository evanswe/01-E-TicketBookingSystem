	<?php
	class SeatBooking extends DB{
		   
		   public $DepartureConfigId;
		   public $SeatId;
		   public $PassengerId;
		   public $ConfrimedStatus;
		   
		public function Insert(){
		        $this->Connect();
				$sql = "insert into  seatbooking(departure_configid, seatid, passengerid, confirmedstatus)
				           values('".MS($this->DepartureConfigId)."',
						          '".MS($this->SeatId)."',
								  '".MS($this->PassengerId)."',
								  '".MS($this->ConfrimedStatus)."')";
								 if(mysql_query($sql)){
									 return true;
									 } 
								$this->err = mysql_error();
								return false;	 
			
			}//end of insert brace      
			
			
			
		public function Update($DepartureConfigId, $SeatId, $PassengerId){
			$this->Connect();
			$sql ="update 
			                  set
							  departure_configid ='".MS($this->DepartureConfigId)."',
							  seatid = '".MS($this->SeatId)."',
							  passengerid = '".MS($this->PassengerId)."',
							  confirmedstatus = '".MS($this->ConfrimedStatus)."'
							  where
							  departure_configid = '".MS($this->DepartureConfigId)."' 
							   
							  AND
							  seatid = '".MS($this->SeatId)."'
							  AND
							  passengerid  ='".MS($this->PassengerId)."'";
							  
							  if(mysql_query($sql)){
								  return true;
								  }
								$this->err = mysql_error();
								return false;
				
			           }//end of main brace of update
				
			
		public function Delete(){
			  $this->Connect();
			  $sql =" delete from assignseats 
			  where counterid ='".$this->CounterId."'
			  AND  
			  departure_configid = '".MS($this->Departure_ConfigId)."'
			  AND
			  seatid = '".MS($this->SeatId)."'";
                
				 if(mysql_query($sql)){
					 return true;
					 }
					$this->err = mysql_error();
					return false;     			
			}//end of main brace of delete	
		
	    public function SelectById(){
			$this->Connect();
			$sql = "select * from assignseats 
			  where counterid ='".$this->CounterId."'
			  AND  
			  departure_configid = '".MS($this->Departure_ConfigId)."'
			  AND
			  seatid = '".MS($this->SeatId)."'";
			  
			$sql = mysql_query($sql);
			while($r = mysql_fetch_row($sql)){
				  $this->CounterId = $r[1];
				  $this->Departure_ConfigId = $r[2];
				  $this->SeatId = $r[3];
				
				
				}
		  
		  
		  }//end of main brace selectbyid				   	
		
	public function Select(){
			$this->Connect();
			$a = "";
			$sql ="select * from "; 
				
			$sql = mysql_query($sql);
			while($d = mysql_fetch_row($sql)){
				$a[] = $d;	
			}
			return $a;
		}
		
}
		
?>