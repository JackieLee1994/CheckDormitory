<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <title>My JSP 'index.jsp' starting page</title>
    <script type="text/javascript">
    		//ajax 方式上传文件操作
			 $(document).ready(function(){
        		$('#btn').click(function(){
            		if(checkData()){
            			$('#form1').ajaxSubmit({  
            				url:'uploadExcel/ajaxUpload.do',
            				dataType: 'text',
            				success: resutlMsg,
            				error: errorMsg
            			}); 
            			function resutlMsg(msg){
  							alert(msg);   
  							$("#upfile").val("");
  						}
   						function errorMsg(){ 
   							alert("导入excel出错！");    
   						}
            		}
        		});
    	     });
    	     
    	     //JS校验form表单信息
    	     function checkData(){
    	     	var fileDir = $("#upfile").val();
    	     	var suffix = fileDir.substr(fileDir.lastIndexOf("."));
    	     	if("" == fileDir){
    	     		alert("选择需要导入的Excel文件！");
    	     		return false;
    	     	}
    	     	if(".xls" != suffix && ".xlsx" != suffix ){
    	     		alert("选择Excel格式的文件导入！");
    	     		return false;
    	     	}
    	     	return true;
    	     }
    	     
    	     //ajax 方式下载文件操作
			 $(document).ready(function(){
        		$('#exportExcel').click(function(){
          			$('#form2').ajaxSubmit({  
          				dataType: 'text',
          				error: errorMsg
          			}); 
					function errorMsg(){ 
						alert("导出excel出错！");    
					}
        		});
    	     });
    </script> 
  </head>
  
  <body>
  <div> 1.通过简单的form表单提交方式</br> 
  		2.通过jquery.form.js插件提供的form表单异步提交功能 </div></br> 
  	<form method="POST" enctype="multipart/form-data" id="form1" action="uploadExcel/upload.do">
 	 	<table>
 	 	 <tr>
 	 	 	<td>上传文件: </td>
 	 	 	<td> <input id="upfile" type="file" name="upfile"></td>
 	 	 </tr>
  		<tr>
 	 	 	<td><input type="submit" value="提交" onclick="return checkData()"></td>
 	 	 	<td><input type="button" value="ajax方式提交" id="btn" name="btn" ></td>
 	 	 </tr>
  		</table>	
	</form>
	</br></br>
	<hr></br>
	<div>
		文件以模板的方式导出，模板存放在项目中(WEB-INF/ExcelDemoFile/)
	</div>
	</br>
	<form action="${pageContext.request.contextPath}/ExportExcel/ajaxExport" method="post" id="form2">
		<input type="submit" id="exportExcel" name="exportExcel" value="Excel导出"/>
	</form>
	
  </body>
</html>
