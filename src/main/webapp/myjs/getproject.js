function getProject(objevent, objposition) {
	var parentId = $("#parentproject").val();
    $.ajax({
        type: "POST",
        data:"parentId="+parentId,
        dataType: "json",
        url: "/propertysystem/project/tojson",
        success: function (data) {
        	$("#" + objposition + "").empty();
        		 var myobj = eval(data);
        		 
        		 for (var i =0;i< myobj.length; i++) {
        			 var parentguid = myobj[i].id;
                     var project = myobj[i].project;
                     $("#" + objposition + "").prepend("<option value='" + project + "'>" + project + "</option>")

                 
        	}

        }

    });
    
}