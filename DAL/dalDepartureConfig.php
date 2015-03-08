	<?php
	class DepartureConfig extends DB{
		   
		   public $Id;
		   public $BusId;
		   public $CoachNumber;
		   public $StationFrom;
		   public $StationTo;
		   public $CounterId;
		   public $ViaLocation;
		   public $JourneyType;
		   public $StartTime;
		   public $EndTime;
		   public $Date;
		   
		 
		public function Insert(){
			   $this->Connect();
			   $sql = "insert into departure_config(busid, coachno, station_from, station_to, counter_id,  vialocation, journey_type, start_time, end_time, startdate)
			                                   values('".MS($this->BusId)."',
											          '".MS($this->CoachNumber)."',
													  '".MS($this->StationFrom)."',
													  '".MS($this->StationTo)."',
                                                      '".MS($this->CounterId)."',
													  '".MS($this->ViaLocation)."',
													  '".MS($this->JourneyType)."',
													  '".MS($this->StartTime)."',
													  '".MS($this->EndTime)."',
													  '".MS($this->Date)."')";
			   
			echo $sql;                                                 
													  if(mysql_query($sql)){
														  return true;
													  }
														$this->err = mysql_error();
														return false;
							
		   }//end of insert brace   
		   
		   public function Update(){
			      $this->Connect();
				  $sql = "update departure_config
				                              set 
											  busid = '".MS($this->BusId)."',       
											  coachno = '".MS($this->CoachNumber)."',
											  stationid = '".MS($this->StationId)."',
											  station_from = '".MS($this->Station_From)."',
											  station_to = '".MS($this->Station_To)."',
											  viacounter = '".MS($this->ViaCounter)."',
											  vialocation = '".MS($this->ViaLocation)."',
											  journey_type = '".MS($this->JourneyType)."',
											  start_time = '".MS($this->StartTime)."',
											  end_time = '".MS($this->EndTime)."',
											  startdate = '".MS($this->StartDate)."'
											  
											  where id = '".MS($this->Id)."'";
											 
											 if(mysql_query($sql)){
												 return true;
												 } 		                           
											$this->err = mysql_error();
											  return false;
																			   
			   }//end of update brace
			   
			   
		public function Delete(){
			    $this->Connect();
				$sql = "delete from departure_config  where id = '".MS($this->Id)."'";
				if(mysql_query($sql)){
					return true;
					}
				$this->err = mysql_error();
				   return  false;	
		
			
			}//end of delete brace
			
		public function SelectById(){
			    $this->Connect();
				$sql = "select * from departure_config  where id = '".MS($this->Id)."'";
				$sql = mysql_query($sql);
				while($r = mysql_fetch_row($sql)){
					 $this->BusId = $r[1];
					 $this->CoachNumber = $r[2];
					 $this->StationId = $r[3];
					 $this->Station_From = $r[4];
					 $this->Station_To = $r[5];
					 $this->ViaCounter =$r[6];
					 $this->ViaLocation = $r[7];
					 $this->JourneyType = $r[8];
					 $this->StartTime = $r[9];
					 $this->EndTime = $r[10];
					 $this->StartDate = $r[11];
				
					}
	            		
			
	 }//end of selectbyid brace 
	 
	 public function Select()
		{
			$this->Connect();
			$a = "";
			$sql = "SELECT dc.id, bus.name AS BusName, dc.coachno AS CoachNO,  st.name, (select name from station where id = station_from) AS StationFrom,  (select name from station where id = station_to) AS StationTo,  counter.name AS CounterName, dc.vialocation AS Location, dc.journey_type AS JourneyType, dc.start_time AS TimeStart, dc.end_time AS EndTime, dc.startdate AS Date  FROM departure_config AS dc, station AS st, bus, counter
			WHERE dc.busid = bus.id 
AND dc.station_from = st.id 
AND dc.counter_id = counter.id";
													
													
			
			$sql = mysql_query($sql);
			while($d = mysql_fetch_array($sql)) {
				$a[] = $d;	
			}
			return $a;
		}	
			
		
	}//end of main brace 
	
	
	
	?>