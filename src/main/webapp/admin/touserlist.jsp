<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/pagination" prefix="pagination"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>派单----》维修人员页面</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/charts/bar.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/page.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css"
	rel="stylesheet" />


<link href="${pageContext.request.contextPath}/css/font-awesome.css"
	rel="stylesheet" />

<link href="${pageContext.request.contextPath}/css/adminia.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/css/adminia-responsive.css"
	rel="stylesheet" />

<link href="${pageContext.request.contextPath}/css/pages/dashboard.css"
	<script src="${pageContext.request.contextPath}/jquery.fly.min.js"></script>
	rel="stylesheet" />

<style type="text/css">




</style>

<script language=javascript>
	function check() {
		
			window.location.href = "${pageContext.request.contextPath}/user/toadd"
	}
</script>
<script>
$(document).ready(function(){
	
	$("#choose").click(function(){
		var name = document.getElementsByName("checkBox");
  		var a = 0;
  		var val = "";
  		var empGuid= new Array();
  		var empName=new Array();
		for(var i = 0;i<name.length;i++){
  			if(name[i].checked){
  				val = name[i].value;
  				a++;
  				var str=val.split("&");
  				empGuid[i]=str[0];
  				empName[i]=str[1];	
  			}
  		}
	
		if(a==0){
  			alert("请选择记录");
  			return;
  		}
		var  str_name="";
		for(var i = 0;i<empName.length;i++){
			
			if(i<((empName.length)-1)){
				str_name+=(empName[i]+"&");
			}else{
				str_name+=empName[i];	
			}
		}
		
		var  str_guid="";
		for(var i = 0;i<empGuid.length;i++){
			
			if(i<((empGuid.length)-1)){
				str_guid+=(empGuid[i]+"&");
			}else{
				str_guid+=empGuid[i];	
			}
		}
		if (window.opener) {
			 fWindowText1 = window.opener.document.getElementById('testuser2');
				fuserGuid = window.opener.document.getElementById('user2');
				fWindowText1.value = empName;
				fuserGuid.value = empGuid; 
		}
  		
	});	
	
});

 

	function goBack(userName,id) {
		if (window.opener) {
			 fWindowText1 = window.opener.document.getElementById('testuser2');
			fuserGuid = window.opener.document.getElementById('user2');
			fWindowText1.value = userName;
			fuserGuid.value = id; 
			window.close();
			
		}
	}
	
	function selectAll1(){
  		var name = document.getElementsByName("checkBox");
  		if(name[0].checked){
	  		for(var i = 0;i<name.length;i++){
	  			 name[i].checked = false;
	  		}
  		}else{
  			for(var i = 0;i<name.length;i++){
	  			 name[i].checked = true;
	  		}
  		}
  	}
	
	</script>	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>

<body>


	<%@ include file="/include/top.jsp"%>


	<div id="content">

		<div class="container">

			<div class="row">

				<%@ include file="/include/left_admin.jsp"%>

<br>
				<div class="span9">

					<h1 class="page-title">
						<i class="icon-home"></i>维修人员
					</h1>

					<div class="form-actions">

						<button type="button" class="btn btn-primary btn-large"
							id="choose" >派单</button>
							
					</div>



					<div class="widget widget-table">

						<div class="widget-header">
							<i class="icon-th-list"></i>
							<h3>派单给维修人员</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">
							<form action="" method="post">
							<input type="hidden" name="type" id="type" value="${type}" />
			<input type="hidden" name="user" id="user" value="${testuser}" />
			<input type="hidden" name="userGuid" id="userGuid" value="${userGuid}" />
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th><input name="" type="checkbox" value=""
							onclick="selectAll1(this)" /></th>
											<th>姓名</th>
											<th>性别</th>
											<th>tel</th>
											<th>详细住址</th>
											<th>操作</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${list }" var="l" varStatus="num">
											<tr>
												<td ><input name="checkBox" type="checkbox" value="${l.userName}&${l.id}"/></td>
												<td>${l.userName }</td>
												<c:if test="${l.gender ==0}">
													<td>男</td>
												</c:if>
												<c:if test="${l.gender ==1}">
													<td>女</td>
												</c:if>
												<td>${l.tel }</td>
												<td>${l.adress }</td>
												<!-- 操作 -->
											     <td>
											   <a href="#" onclick="goBack('${l.userName}','${l.id}')">派单</a>
											     </td>
									
											</tr>

										</c:forEach>
										</tbody>
								</table>
								<div>
									
						</div>
							</form>
						</div>
			
						<nav>
							<ul class="pagination">
								
								<c:if test="${page != null}">
									<pagination:page parameter="${page}" />
								</c:if>
							</ul>
						</nav>
			


					</div>


				</div>



			</div>


		</div>


	</div>



	<%@ include file="/include/bottom.jsp"%>

</body>
</html>
