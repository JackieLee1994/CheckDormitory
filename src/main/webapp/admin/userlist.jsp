<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/pagination" prefix="pagination"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>用户列表</title>

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

<!--[if lte IE 9]>
<script src="requestAnimationFrame.js"></script>
<![endif]-->
<script>
$(document).ready(function(){
	var result="${param.result}";
	if (result !== null && result !== undefined && result !== '') {
		　alert("个人信息修改成功！！！");
		　　}
	
	});
</script>
<script language=javascript>
	function check() {
		<c:if test="${sessionScope.type=='管理员' }">
		
			window.location.href = "${pageContext.request.contextPath}/user/toadd"
		</c:if>
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

				<%-- <button type="button" class="btn btn-primary btn-large"
							id="addbtn"  onchange="check();"
							onclick="location.href='${pageContext.request.contextPath}/repairtask/toadd';">新增维修任务</button>
						&nbsp;&nbsp;&nbsp;&nbsp; --%>
<br>
				<div class="span9">

					<h1 class="page-title">
						<i class="icon-home"></i>人员管理
					</h1>

					<div class="form-actions">

						<button type="button" class="btn btn-primary btn-large"
							id="addbtn" onclick="check()">新增用户</button>
						&nbsp;&nbsp;&nbsp;&nbsp;

						<!-- <button class="btn btn-large"
							onclick="location.href='import.jsp';">批量导入用户</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-large btn-success">批量导出用户</button>
 -->



					</div>



					<div class="widget widget-table">

						<div class="widget-header">
							<i class="icon-th-list"></i>
							<h3>人员管理</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">
							<form action="" method="post">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th>姓名</th>
											<th>性别</th>
											<th>用户类型</th>
											<th>tel</th>
											<th>详细住址</th>
											<th>操作</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${list }" var="l" varStatus="num">
											<tr>
												<td>${num.index +1 }</td>
												<td>${l.userName }</td>
												<c:if test="${l.gender ==0}">
													<td>男</td>
												</c:if>
												<c:if test="${l.gender ==1}">
													<td>女</td>
												</c:if>
												<td>${l.type }</td>
												<td>${l.tel }</td>
												<td>${l.adress }</td>
												<!-- 操作 -->
											     <td>
											     <a href="${l.id}/del">删除</a>
											     <a href="${l.id}/update">修改</a>
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
