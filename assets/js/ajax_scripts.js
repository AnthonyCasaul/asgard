schedTobeSaved = {};
function setSched(sched){
    schedTobeSaved = sched;
}

function RefreshTable(tableName,page) {
    $('#'+tableName).load(page+".html #"+tableName);
}

$( "#Generate" ).click(function() {
    var sectionName = $('#sectionName').val();
    $.ajax({
        type: "POST",
        data:{"keyword":"sched",
            "sectionName":sectionName},
        url: "assets/php/Create.php",
        success: function(result){
            $('#table_body').empty();
            $('#table_body').append('<tr id="loading"><td colspan="5"><img src="https://usagif.com/wp-content/uploads/loading-71.gif"></td></tr>');
        }
    });
    $.ajax({
        type: "POST",
        dataType:"JSON",
        url: "assets/python/GA_Scheduling.py",
        success: function(result){
            console.log(result);
                $('#table_body').empty();
                $.each(result, function(index, value) {
                    $('#table_body').append("<tr><td>"+value.meetingTime+"</td>"+
                                            //"<td>"+value.professor+"</td>"+
                                            "<td>"+value.room+"</td>"+
                                            "<td>"+value.section+"</td>"+
                                            "<td>"+value.subject+"</td></tr>");
                });
        },
       complete: function (data) {
            schedTobeSaved = data.responseJSON;
            console.log(schedTobeSaved);
       }
    });
});

$( "#submitNewTeacher" ).click(function() {
    var formData = $('#addTeacherForm').serialize();
    formData += "&keyword=teachers"
    $.ajax({
        type: "POST",
        data:formData,
        url: "assets/php/Create.php",
        success: function(result){
            $('#addTeacherModal').modal('hide');
            $('#addTeacherForm').trigger('reset');
            Swal.fire(
                'Success',
                 result,
                'success'
              );
              getTeachers();
        }
    });
});

$("#saveClassButton").click(function(){
    if(Object.keys(schedTobeSaved).length != 0){
        $.ajax({
        type: "POST",
        data:schedTobeSaved,
        url: "assets/php/Create.php",
        success: function(result){
            console.log(result);
            Swal.fire(
                'Success',
                 result,
                'success'
              )
        }
    });
    }
    else{
            Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Generate a Schedule first!',
          });
    }
});

$( "#submitNewRoom" ).click(function() {
    var formData = $('#addRoomForm').serialize();
    formData += "&keyword=rooms"
    $.ajax({
        type: "POST",
        data:formData,
        url: "assets/php/Create.php",
        success: function(result){
            $('#addRoomModal').modal('hide');
            $('#addRoomForm').trigger('reset');
            Swal.fire(
                'Success',
                 result,
                'success'
              );
              getRooms();
        }
    });
});


$( "#submitNewSection" ).click(function() {
    var formData = $('#addSectionForm').serialize();
    formData += "&keyword=sections"
    $.ajax({
        type: "POST",
        data:formData,
        url: "assets/php/Create.php",
        success: function(result){
            $('#addSectionModal').modal('hide');
            $('#addSectionForm').trigger('reset');
            Swal.fire(
                'Success',
                 result,
                'success'
              );
              getSections();
        }
    });
});

$( "#submitNewSubject" ).click(function() {
    var formData = $('#addNewSubjectForm').serialize();
    formData += "&keyword=subjects"
    $.ajax({
        type: "POST",
        data:formData,
        url: "assets/php/Create.php",
        success: function(result){
            $('#addSubjectModal').modal('hide');
            $('#addNewSubjectForm').trigger('reset');
            Swal.fire(
                'Success',
                 result,
                'success'
              );
              getSubjects();
        }
    });
});


$( "#archiveTeacher" ).click(function() {
    var profID = $('#idDelete').val();
    if(profID != ""){
        $.ajax({
            type: "POST",
            data:{"keyword":"teachers",
                   "id":profID},
            url: "assets/php/Delete.php",
            success: function(result){
                $('#idDelete').val("");
                $('#archiveTeacherModal').modal('hide');
                Swal.fire(
                    'Success',
                     result,
                    'success'
                  );
                  getTeachers();
            }
        });
    }
    else{
        $('#archiveTeacherModal').modal('hide');
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Click a teacher first!',
          });
    }
});

$( "#archiveSubject" ).click(function() {
    var subID = $('#deleteSubID').val();
    if(subID != ""){
         $.ajax({
        type: "POST",
        data:{"keyword":"subjects",
               "id":subID},
        url: "assets/php/Delete.php",
        success: function(result){
            $('#deleteSubID').val("");
            $('#archiveSubjectModal').modal('hide');
            Swal.fire(
                'Success',
                 result,
                'success'
              );
              getSubjects();
        }
    });
    }
   else{
        $('#archiveSubjectModal').modal('hide');
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Click a subject first!',
        });
   }
});
$( "#archiveSection" ).click(function() {
    var secID = $('#deleteSectionID').val();
    if(secID != ""){
        $.ajax({
            type: "POST",
            data:{"keyword":"sections",
                "id":secID},
            url: "assets/php/Delete.php",
            success: function(result){
                $('#deleteSectionID').val("");
                $('#archiveSectionModal').modal('hide');
                Swal.fire(
                    'Success',
                     result,
                    'success'
                  );
                  getSections();
            }
        });
    }
    else{
        $('#archiveSectionModal').modal('hide');
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Click a section first!',
          });
    }

});

$( "#archiveRoom" ).click(function() {
    var roomID = $('#deleteRoomID').val();
    if(roomID != ""){
        $.ajax({
        type: "POST",
        data:{"keyword":"rooms",
               "id":roomID},
        url: "assets/php/Delete.php",
        success: function(result){
            $('#deleteRoomID').val("");
                $('#archiveRoomModal').modal('hide');
                Swal.fire(
                    'Success',
                     result,
                    'success'
                  );
                  getRooms();
        }
    });
    }
    else{
        $('#archiveRoomModal').modal('hide');
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Click a room first!',
          });
    }
    
});

$( "#editSection" ).click(function() {
    var formData = $('#editSectionForm').serialize();
    formData += "&keyword=sections"
    var id = $('#editSectionID').val();
    if(id != ""){
        $.ajax({
        type: "POST",
        data:formData,
        url: "assets/php/Update.php",
        success: function(result){
            $('#editSectionModal').modal('hide');
            $('#editSectionForm').trigger('reset');
            Swal.fire(
                'Success',
                 result,
                'success'
              );
              getSections();
        }
    });
    }
    else{
        $('#editSectionModal').modal('hide');
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Click a section first!',
          });
    }
});

$( "#editRoom" ).click(function() {
    var formData = $('#editRoomForm').serialize();
    formData += "&keyword=rooms";
    roomID = $('#EditRoomID').val();
    if(roomID != ""){
            $.ajax({
        type: "POST",
        data:formData,
        url: "assets/php/Update.php",
        success: function(result){
            $('#editRoomModal').modal('hide');
            $('#editRoomForm').trigger('reset');
            Swal.fire(
                'Success',
                 result,
                'success'
              );
              getRooms();
        }
    });
    }
    else{
        $('#editRoomModal').modal('hide');
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Click a room first!',
          });
    }
});

$( "#editSubject" ).click(function() {
    var formData = $('#editSubjectForm').serialize();
    formData += "&keyword=subjects";
    var subID = $("#editSubID").val();
    if(subID != ""){
        $.ajax({
        type: "POST",
        data:formData,
        url: "assets/php/Update.php",
        success: function(result){
            $('#editSubjectModal').modal('hide');
            $('#editSubjectForm').trigger('reset');
            Swal.fire(
                'Success',
                 result,
                'success'
              );
              getSubjects();
        }
    });
    }
    else{
        $('#editSubjectForm').modal('hide');
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Click a subject first!',
          });
    }
});

$( "#EditTeacher" ).click(function() {
    var formData = $('#editTeacherForm').serialize();
    formData += "&keyword=teachers";
    var id = $('#id').val();
    if(id != ""){
        $.ajax({
            type: "POST",
            data:formData,
            url: "assets/php/Update.php",
            success: function(result){
                $('#editTeacherModal').modal('hide');
                $('#editTeacherForm').trigger('reset');
                Swal.fire(
                    'Success',
                     result,
                    'success'
                  );
                  getTeachers();
            }
        });
    }
    else{
        $('#editTeacherModal').modal('hide');
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Click a teacher first!',
          });
    }

});

function getTeachers(){
                $.ajax({
                type: "POST",
                dataType: "JSON",
                data:{"keyword":"teachers"},
                url: "assets/php/Read.php",
                success: function(result){
                    if(result != "No Records"){
                        $('#teachers_table').bootstrapTable("destroy");
                        $('#teachers_table').bootstrapTable({data: result,});     
                    }
                    else{
                        $('#teachers_table').empty();
                        $('#teachers_table').append("<tr><td colspan='2'>No Records</td></tr>");
                    }

                }
            });
}
function getSubjects(){
                $.ajax({
                type: "POST",
                dataType: "JSON",
                data:{"keyword":"subjects"},
                url: "assets/php/Read.php",
                success: function(result){
                    if(result != "No Records"){
                        $('#subjects_table').bootstrapTable("destroy");
                        $('#subjects_table').bootstrapTable({data: result,});     
                    }
                    else{
                        $('#subjects_table').empty();
                        $('#subjects_table').append("<tr><td colspan='2'>No Records</td></tr>");
                    }
                }
            });
}

function getSections(){
                $.ajax({
                type: "POST",
                dataType: "JSON",
                data:{"keyword":"sections"},
                url: "assets/php/Read.php",
                success: function(result){
                 if(result != "No Records"){
                        $('#sections_table').bootstrapTable("destroy");   
                        $('#sections_table').bootstrapTable({data: result,});     
                    }
                    else{
                        $('#sections_table').empty();
                        $('#sections_table').append("<tr><td colspan='2'>No Records</td></tr>");
                    }
                }
            });
}

function getRooms(){
                $.ajax({
                type: "POST",
                dataType: "JSON",
                data:{"keyword":"rooms"},
                url: "assets/php/Read.php",
                success: function(result){
                    if(result != "No Records"){
                        $('#rooms_table').bootstrapTable("destroy");   
                        $('#rooms_table').bootstrapTable({data: result,});     
                    }
                    else{
                        $('#rooms_table').empty();
                        $('#rooms_table').append("<tr><td colspan='2'>No Records</td></tr>");
                    }
                }
            });
}

//Search Variables

function searchTeachers(){
    var search_word = $(" #searchBox ").val(); 
    $.ajax({
        type: "POST",
        dataType: "JSON",
        data:{"keyword":"teachers",
            "search_word":search_word},
        url: "assets/php/Search.php",
        success: function(result){
            if(result != "No matches"){
                $('#teachers_table').bootstrapTable("destroy");
                $('#teachers_table').bootstrapTable({data: result,});
            }
            else{
                $('#teachers_table').empty();
                $('#teachers_table').append("<tr><td colspan='2'>No matches</td></tr>");
            }
        }
    });
}

function searchSubjects(){
    var search_word = $(" #searchBox ").val(); 
    $.ajax({
        type: "POST",
        dataType: "JSON",
        data:{"keyword":"subjects",
            "search_word":search_word},
        url: "assets/php/Search.php",
        success: function(result){
            if(result != "No matches"){
                $('#subjects_table').empty();
                $('#subjects_table').bootstrapTable("destroy");
                $('#subjects_table').bootstrapTable({data: result,});
            }
            else{
                $('#subjects_table').empty();
                $('#subjects_table').append("<tr><td colspan='2'>No matches</td></tr>");
            }
        }
    });
}
function searchSections(){
    var search_word = $(" #searchBox ").val(); 
    $.ajax({
        type: "POST",
        dataType: "JSON",
        data:{"keyword":"sections",
            "search_word":search_word},
        url: "assets/php/Search.php",
        success: function(result){
            if(result != "No matches"){
                $('#sections_table').empty();
                $('#sections_table').bootstrapTable("destroy");
                $('#sections_table').bootstrapTable({data: result,});
            }
            else{
                $('#sections_table').empty();
                $('#sections_table').append("<tr><td colspan='2'>No matches</td></tr>");
            }
        }
    });
}
function searchRooms(){
    var search_word = $(" #searchBox ").val(); 
    $.ajax({
        type: "POST",
        dataType: "JSON",
        data:{"keyword":"rooms",
            "search_word":search_word},
        url: "assets/php/Search.php",
        success: function(result){
            if(result != "No matches"){
                $('#rooms_tabled').empty();
                $('#rooms_table').bootstrapTable("destroy");
                $('#rooms_table').bootstrapTable({data: result,});
            }
            else{
                $('#rooms_table').empty();
                $('#rooms_table').append("<tr><td colspan='2'>No matches</td></tr>");
            }
        }
    });
}

function FillSections(){
    $.ajax({
        type: "POST",
        dataType: "JSON",
        data:{"keyword":"sections"},
        url: "assets/php/Read.php",
        success: function(result){
            if(result != "No Records"){
                $.each(result, function (i, result) {
                    $('#sectionsDropdown').append($('<option>', { 
                        value: result.name,
                        text : result.name 
                    }));
                });
                $.each(result, function (i, result) {
                    $('#sectionsDropdown').append($('<option>', { 
                        value: result.name,
                        text : result.name 
                    }));
                });
                
            }
            else{
                $('#sectionsDropdown').append($('<option>', { 
                    value: "None",
                    text : "No item" 
                }));
                $('#sectionsDropdown').append($('<option>', { 
                    value: "None",
                    text : "No item" 
                }));
            }
        }
    });
}

function FillSubjects(){
    $.ajax({
        type: "POST",
        dataType: "JSON",
        data:{"keyword":"subjects"},
        url: "assets/php/Read.php",
        success: function(result){
            if(result != "No Records"){
                $.each(result, function (i, result) {
                    $('#subjectsDropDownAdd').append($('<option>', { 
                        value: result.name,
                        text : result.name 
                    }));
                });
                $.each(result, function (i, result) {
                    $('#subjectsDropDownEdit').append($('<option>', { 
                        value: result.name,
                        text : result.name 
                    }));
                });
                
            }
            else{
                $('#subjectsDropDownAdd').append($('<option>', { 
                    value: "None",
                    text : "No item" 
                }));
                $('#subjectsDropDownEdit').append($('<option>', { 
                    value: "None",
                    text : "No item" 
                }));
            }
        }
    });
}
function FillTeachers(){
    $.ajax({
        type: "POST",
        dataType: "JSON",
        data:{"keyword":"teachers"},
        url: "assets/php/Read.php",
        success: function(result){
            if(result != "No Records"){
                $.each(result, function (i, result) {
                    $('#profListAdd').append($('<option>', { 
                        value: result.name,
                        text : result.name 
                    }));
                });
                $.each(result, function (i, result) {
                    $('#profListEdit').append($('<option>', { 
                        value: result.name,
                        text : result.name 
                    }));
                });
                
            }
            else{
                $('#profListAdd').append($('<option>', { 
                    value: "None",
                    text : "No item" 
                }));
                $('#profListEdit').append($('<option>', { 
                    value: "None",
                    text : "No item" 
                }));
            }
        }
    });
}
