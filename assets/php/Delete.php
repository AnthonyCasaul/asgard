<?php
	#initialization
		include("conn.php");
		$keyword = $_POST['keyword'];
		$result_arr = array();
		$sqlQuery = "";

	#select Query
		if($keyword == "teachers"){
			$sqlQuery = "DELETE FROM `professors` WHERE professorID = ".$_POST['id'];
		}
		else if($keyword == "subjects"){
			$sqlQuery = "DELETE FROM `courses` WHERE courseID = ".$_POST['id'];
		}
		else if($keyword == "rooms"){
			$sqlQuery = "DELETE FROM `rooms` WHERE roomID = ".$_POST['id'];
		}
		else if($keyword == "sections"){
			$sqlQuery = "DELETE FROM `sections` WHERE sectionID = ".$_POST['id'];			
		}
		//
	#Perform Query
		if ($result = $mysqli -> query($sqlQuery)) {
				echo json_encode("Deleted Successfully!");
			}
		else{
				echo json_encode($mysqli-> error);
			}
		//mysqli_free_result($result);

		  
	$mysqli -> close();
?>