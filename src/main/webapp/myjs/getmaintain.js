function getMaintain(objevent, objposition) {
	var parentmaintain = $("#parentmaintain").val();
    $.ajax({
        type: "POST",
        data:"parentId="+parentmaintain,
        dataType: "json",
        url: "/propertysystem/category/tojson",
        success: function (data) {
        	$("#" + objposition + "").empty();
        		 var myobj = eval(data);
        		 
        		 for (var i =0;i< myobj.length; i++) {
        			
        			 var ptyguid = myobj[i].parentId;
                     var ptyname = myobj[i].category;
                     $("#" + objposition + "").prepend("<option value='" + ptyname + "'>" + ptyname + "</option>")

                 
        	}

        }

    });
    
}