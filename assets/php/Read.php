<?php
	#initialization
		include("conn.php");
		$keyword = $_POST['keyword'];
		//$keyword = "subjects";
		$result_arr = array();
		$sqlQuery = "";
		$first_row_name = "";
		$second_row_name = "";

	#select Query
		if($keyword == "teachers"){
			$sqlQuery = "SELECT * FROM `professors`";
		}
		else if($keyword == "subjects"){
			$sqlQuery = "SELECT * FROM `courses`";
		}
		else if($keyword == "rooms"){
			$sqlQuery = "SELECT * FROM `rooms`";
		}
		else if($keyword == "sections"){
			$sqlQuery = "SELECT * FROM `sections`";			
		}

	#Perform Query
		if ($result = $mysqli -> query($sqlQuery)) {
			$rowcount=mysqli_num_rows($result);
			if($rowcount != 0){
				foreach($result as $row){
				  	if($keyword == "teachers"){
						$temp_array = Array("id"=>$row['professorID'],
											"name"=>$row['professor_name'],
											"college"=>$row['college'],
											"department"=>$row['department'],
											"rank"=>$row['rank'],
											"PreferredDays"=>$row['preferred_days']);}

					else if($keyword == "subjects"){
						$temp_array = Array("id"=>$row['courseID'],
											"name"=>$row['course_code'],
											"type"=>$row['course_type'],
											"professor_list"=>$row['professor_list'],
											"islab"=>$row['isLab'],
											"duration"=>$row['duration']);}
					else if($keyword == "sections"){
						$temp_array = Array("id"=>$row['sectionID'],
											"name"=>$row['section_name'],
											"year"=>$row['year'],
											"department"=>$row['department'],
											"shift"=>$row['shift'],
											"course_list"=>$row['course_list']);}
					else if($keyword == "rooms"){
						$temp_array = Array("id"=>$row['roomID'],
											"name"=>$row['room_name'],
											"islab"=>$row['isLab']);}
			  		array_push($result_arr, $temp_array);
				}
				echo json_encode($result_arr);
			}
			else{
				echo json_encode("No records");
			}

		  
		  //$result -> free_result();
		}

	$mysqli -> close();
?>