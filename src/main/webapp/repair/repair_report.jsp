<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/pagination" prefix="pagination"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>极客学院-SpringMVC实现CRM客户关系管理系统</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
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
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/calendar-brown.css"
	rel="stylesheet" />

<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/addfile5331.js"></script>
<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>


	<%@ include file="include/top.jsp"%>

	<div id="content">

		<div class="container">

			<div class="row">

				<%@ include file="include/left.jsp"%>


				<div class="span9">

					<h1 class="page-title">
						<i class="icon-home"></i> 我的桌面
					</h1>

					<form action="" method="post">
						<div class="form-actions">
							<input type="text" value="时间查询："
								style="width: 65px;border: none;background: #eeeeee;text-align: center;vertical-align: middle;">
							<input name="startTime" id="startTime" type="text"
								class="dfinput"
								onClick="return showCalendar('startTime', 'y-mm-dd');"
								value="${startTime}"
								style="width: 115px;text-align: center;vertical-align: middle;height: 30px;" />

							<input name="endTime" id="endTime" type="text" class="dfinput"
								onClick="return showCalendar('endTime', 'y-mm-dd');"
								value="${endTime}"
								style="width: 115px;height: 30px;text-align: center;vertical-align: middle;" />



							<button type="submit" class="btn btn-primary btn-large"
								id="select"
								>查询</button>
							&nbsp;&nbsp;&nbsp;&nbsp;

						</div>


						<div class="widget widget-table">

							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>工作报表</h3>
							</div>
							<!-- /widget-header -->

							<div class="widget-content">

								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th>月抢单量</th>
											<th>月抢单完成量</th>
											<th>月用维修工时</th>
											<th>月平均响应时间</th>
											<th>姓名</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${reportList }" var="l" varStatus="num">
											<tr>
												<td>${num.index +1 }</td>
												<td>${l.grabConut }</td>
												<td>${l.finishCount }</td>
												<td>${l.avgResponse }</td>
												<td>${l.avgRepair }</td>
												<td>${l.workpeople }</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
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
		<!-- /row -->

	</div>
	<!-- /container -->

	</div>
	<!-- /content -->


	<%@ include file="include/bottom.jsp"%>
	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/js/charts/bar.js"></script>
</body>
</html>
