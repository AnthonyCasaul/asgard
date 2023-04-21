<?php
	#initialization
		include("conn.php");
		//$keyword = "sections";
		$result_arr = array();
		$sqlQuery = "";
		error_reporting(E_ERROR);
		$check = isset($_POST['keyword']);
	#select Query
	if($check==true){
		if($_POST['keyword'] == "teachers"){
			if($_POST['department'] == ""){
				$_POST['department'] = "No Department";
			}
			//$sqlQuery = "SELECT * FROM `professors`";
			$sqlQuery = "INSERT INTO `professors`(`professor_name`, `rank`,`college`, `department`, `preferred_days`) VALUES ('".$_POST['teacherName']."','".$_POST['rank']."','".$_POST['college']."','".$_POST['department']."','".$_POST['days']."')";
		}
		else if($_POST['keyword'] == "subjects"){
			//$sqlQuery = "SELECT * FROM `courses`";
			$sqlQuery = "INSERT INTO `courses`(`course_code`, `course_type`, `professor_list`, `isLab`, `duration`) VALUES ('".$_POST['subject_code']."','".$_POST['type']."','".$_POST['profs']."','".$_POST['isLab']."','".$_POST['units']."')";
		}
		else if($_POST['keyword'] == "sections"){
			//$sqlQuery = "SELECT * FROM `rooms`";
			$sqlQuery = "INSERT INTO `sections`(`section_name`, `year`, `course_list`, `shift`, `department`) VALUES ('".$_POST['section_name']."','".$_POST['year']."','".$_POST['subjects']."','".$_POST['shift']."','".$_POST['department']."')";
		}
		else if($_POST['keyword'] == "rooms"){
			//$sqlQuery = "SELECT * FROM `rooms`";
			$sqlQuery = "INSERT INTO `rooms`(`room_name`, `isLab`) VALUES ('".$_POST['room_name']."','".$_POST['isLab']."')";			
		}
		else if ($_POST['keyword'] == "sched") {
			$sqlQuery = "SELECT * FROM `inputs`";	
			if ($result = $mysqli -> query($sqlQuery)) {
				$rowcount=mysqli_num_rows($result);
				if($rowcount != 0){
					$deleteQuery = "DELETE FROM `inputs`";
					if($mysqli -> query($deleteQuery)){
						$sqlQuery = "INSERT INTO `inputs`(`className`) VALUES ('".$_POST['sectionName']."')";
					}
				}
				else{
					$sqlQuery = "INSERT INTO `inputs`(`className`) VALUES ('".$_POST['sectionName']."')";
				}
			}
		}
		if ($result = $mysqli -> query($sqlQuery)) {
			echo json_encode("Added Successfully!");
		}
		else{
			echo json_encode($mysqli-> error);
		}
	}
	else{
			$jsonString = $_POST['schedTobeSaved'];
			$jsonArray = json_decode($jsonString, true);
			foreach ($jsonArray as $item) {
				$sqlQuery = "INSERT INTO `schedules`(`meetingTime`, `room`, `section`, `subject`) VALUES (".$item['meetingTime'].",".$item['room'].",".$item['section'].",".$item['subject'].")";

				if ($result = $mysqli -> query($sqlQuery)) {
						//echo json_encode("Added Successfully!");
					   print_r($jsonArray);
					}
				else{
						echo ($mysqli-> error);
					}
			}		
	}
	
	$mysqli -> close();
?>