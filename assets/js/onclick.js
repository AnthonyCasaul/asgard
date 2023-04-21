$(document).ready(function() {
	$( "#TeacherDept" ).prop( "disabled", true );
	$( "#EditTeacherDept" ).prop( "disabled", true );

    $('#teachers_table').on('click-cell.bs.table', function (field, value, row, $el) {
    	$('#id').val($el.id);
    	$('#editTeacherName').val($el.name);
    	$('#idDelete').val($el.id);
        $('#teacher_name').text($el.name);
		$('#college').text($el.college);
        $('#department').text($el.department);
        $('#rank').text($el.rank);
		$('#preferredDays').text($el.PreferredDays);
        $('#teacherNameArchive').text($el.name);
    });
    $('#subjects_table').on('click-cell.bs.table', function (field, value, row, $el) {
    	$('#editSubID').val($el.id);
    	$('#deleteSubID').val($el.id);
    	$("#units").val($el.duration);
    	$('#edit_subject_code').val($el.name);
        $('#course_code').text($el.name);
        $('#Description').text("Description: No Description");
        $('#type').text("Course Type: "+$el.type);
        $('#prof_list').text("Professor List: "+$el.professor_list);
        $('#isLab').text("Is Laboratory: "+$el.islab);
        $('#subjectName').text($el.name);
    });
    $('#sections_table').on('click-cell.bs.table', function (field, value, row, $el) {
    	$('#editSectionID').val($el.id);
    	$('#editSectionName').val($el.name);
    	$('#deleteSectionID').val($el.id)
    	$('#section_name').text($el.name);
    	$('#sectionName').text($el.name);
    	$('#year').text("Year: "+$el.year);
    	$('#shift').text("Shift: "+$el.shift);
    	$('#department').text("Department: "+$el.department);
    	$('#req_subs').text("Required Subjects: "+$el.course_list);
    });
    $('#rooms_table').on('click-cell.bs.table', function (field, value, row, $el) {
    	$('#editRoomName').val($el.name);
    	$('#deleteRoomID').val($el.id);
    	$('#EditRoomID').val($el.id);
    	$('#room_name').text($el.name);
    	$('#roomName').text($el.name);
    	$('#isLab').text("Is Laboratory: "+$el.islab);
    });

	$('#TeacherCollege').change(function() {
		var selectedOption = $(this).val();
		if(selectedOption != "CCIS"){
			$( "#TeacherDept" ).prop( "disabled", true );
		}
		else{
			$( "#TeacherDept" ).prop( "disabled", false );
		}
	});

	$('#EditTeacherCollege').change(function() {
		var selectedOption = $(this).val();
		if(selectedOption != "CCIS"){
			$( "#EditTeacherDept" ).prop( "disabled", true );
		}
		else{
			$( "#EditTeacherDept" ).prop( "disabled", false );
		}
	});

	$('#profs').change(function() {
		var selectedOption = $(this).val();
		$('#profList').append("<li>"+selectedOption+"</li>");
		var listItems = $('#profList li')
		var itemArr = "";
		listItems.each(function(index, listItem) {
			var itemTemp = $(listItem).text();
			if(itemArr != ""){
				itemArr += ",";
			}
			if(!itemArr.includes(itemTemp)){
				itemArr += itemTemp;
			}
		});
		$('#listHidden').html(itemArr);
	});

	$('#profsEdit').change(function() {
		var selectedOption = $(this).val();
		$('#Editproflist').append("<li>"+selectedOption+"</li>");
		var listItems = $('#Editproflist li')
		var itemArr = "";
		listItems.each(function(index, listItem) {
			var itemTemp = $(listItem).text();
			if(itemArr != ""){
				itemArr += ",";
			}
			if(!itemArr.includes(itemTemp)){
				itemArr += itemTemp;
			}
		});
		$('#listHidden').html(itemArr);
	});

	$('#AddpreferedDaysSelect').change(function() {
		var selectedOption = $(this).val();
		$('#AddpreferedDays').append("<li>"+selectedOption+"</li>");
		var listItems = $('#AddpreferedDays li');
		var itemArr = "";
		listItems.each(function(index, listItem) {
			var itemTemp = $(listItem).text();
			if(itemArr != ""){
				itemArr += ",";
			}
			if(!itemArr.includes(itemTemp)){
				itemArr += itemTemp;
			}
		});
		$('#AddDayslistHidden').html(itemArr);
	});

	$('#preferedDaysSelect').change(function() {
		var selectedOption = $(this).val();
		$('#EditpreferedDays').append("<li>"+selectedOption+"</li>");
		var listItems = $('#EditpreferedDays li');
		var itemArr = "";
		listItems.each(function(index, listItem) {
			var itemTemp = $(listItem).text();
			if(itemArr != ""){
				itemArr += ",";
			}
			if(!itemArr.includes(itemTemp)){
				itemArr += itemTemp;
			}
		});
		$('#DayslistHidden').html(itemArr);
	});

	$('#subjectsAddSelect').change(function() {
		var selectedOption = $(this).val();
		$('#sublist').append("<li>"+selectedOption+"</li>");
		var listItems = $('#sublist li');
		var itemArr = "";
		listItems.each(function(index, listItem) {
			var itemTemp = $(listItem).text();
			if(itemArr != ""){
				itemArr += ",";
			}
			if(!itemArr.includes(itemTemp)){
				itemArr += itemTemp;
			}
		});
		$('#listHidden').html(itemArr);
	});

	$('#subjectsEditSelect').change(function() {
		var selectedOption = $(this).val();
		$('#Editsublist').append("<li>"+selectedOption+"</li>");
		var listItems = $('#Editsublist li');
		var itemArr = "";
		listItems.each(function(index, listItem) {
			var itemTemp = $(listItem).text();
			if(itemArr != ""){
				itemArr += ",";
			}
			if(!itemArr.includes(itemTemp)){
				itemArr += itemTemp;
			}
		});
		$('#EditlistHidden').html(itemArr);
	});
});