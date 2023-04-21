<?php
	#initialization
		include("conn.php");
		$keyword = $_POST['keyword'];
		$result_arr = array();
		$sqlQuery = "";
		error_reporting(E_ERROR);
	#select Query
		if($keyword == "teachers"){
			//$sqlQuery = "SELECT * FROM `professors`";
			//$_POST['teacherName']."','".$_POST['position']."','".$_POST['department']."','".$_POST['days']."'
			if($_POST['department'] == ""){
				$_POST['department'] = "No Department";
			}
			$sqlQuery = "UPDATE `professors` SET `professor_name`='".$_POST['teacherName']."',`college`='".$_POST['college']."',`department`='".$_POST['department']."',`preferred_days`='".$_POST['days']."',`rank`='".$_POST['rank']."' WHERE professorID = ".$_POST['id'];
		}
		else if($keyword == "subjects"){
			//$sqlQuery = "SELECT * FROM `courses`";
			$sqlQuery = "UPDATE `courses` SET `course_code`='".$_POST['subject_code']."',`course_type`='".$_POST['type']."',`professor_list`='".$_POST['profs']."',`isLab`='".$_POST['isLab']."',`duration`='".$_POST['units']."' WHERE courseID = ".$_POST['id'];
		}
		else if($keyword == "sections"){
			//$sqlQuery = "SELECT * FROM `rooms`";
			$sqlQuery = "UPDATE `sections` SET `section_name`='".$_POST['section_name']."',`year`='".$_POST['year']."',`course_list`='".$_POST['subjects']."',`shift`='".$_POST['shift']."',`department`='".$_POST['department']."' WHERE sectionID =".$_POST['id'];
		}
		else if($keyword == "rooms"){
			//$sqlQuery = "SELECT * FROM `rooms`";	
			$sqlQuery = "UPDATE `rooms` SET `room_name`='".$_POST['room_name']."',`isLab`='".$_POST['isLab']."' WHERE roomID =".$_POST['id'];		
		}
		//
	#Perform Query
		if ($result = $mysqli -> query($sqlQuery)) {
				echo json_encode("Edited Successfully!");
			}
		else{
				echo json_encode($mysqli-> error);
			}
			
		 // $result -> free_result();
		  
	$mysqli -> close();
?>