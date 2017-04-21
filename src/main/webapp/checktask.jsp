<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>极客学院-SpringMVC实现CRM客户关系管理系统</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<link href="./css/bootstrap.min.css" rel="stylesheet" />
<link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />


<link href="./css/font-awesome.css" rel="stylesheet" />

<link href="./css/adminia.css" rel="stylesheet" />
<link href="./css/adminia-responsive.css" rel="stylesheet" />

<link href="./css/pages/dashboard.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="./js/jquery-1.11.1.min.js"></script>
<script src="./js/addfile5331.js"></script>
</head>

<body>


	<%@ include file="include/top.jsp"%>

	<div id="content">

		<div class="container">

			<div class="row">

				<%@ include file="include/left.jsp"%>


				<div class="span9">

					<h1 class="page-title">
						<i class="icon-home"></i> 巡查任务
					</h1>





					<div class="widget widget-table">

						<div class="widget-header">
							<i class="icon-th-list"></i>
							<h3>最新客户</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">

							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>#</th>
										<th>项目</th>
										<th>巡查事项</th>
										<th>关键点</th>
										<th>查看</th>
										<th>巡查人员</th>
										<th>时间</th>
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${list }" var="l">
										<tr>
											<td>${l.id }</td>
											<td>${l.project }</td>
											<td>${l.repairtype }</td>
											<td>${l.repaircontent }</td>
											<td>${l.taskstatus }</td>
											<td>${l.repairpeople }</td>
											<td>${l.addtime}</td>
											<td class="action-td"><a href="javascript:'${u.userid}/update';"
												class="btn btn-small btn-warning"> <i class="icon-ok"></i>
											</a> <a href="javascript:'${l.id}/del';" class="btn btn-small"> <i
													class="icon-remove"></i>
											</a></td>
										</tr>

									</c:forEach>
									<tr>
										<td>2</td>
										<td>Magic</td>
										<td>Magic</td>
										<td>Magic</td>
										<td>Magic</td>
										<td>Johnson</td>
										<td>@mjohnson</td>
										<td>Los Angeles Lakers</td>
										<td class="action-td"><a href="javascript:;"
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
										</a> <a href="javascript:;" class="btn btn-small"> <i
												class="icon-remove"></i>
										</a></td>
									</tr>
							</table>

						</div>
						<!-- /widget-content -->

					</div>
					<!-- /widget -->




					<!-- 	<div class="row">

						<div class="span5">

							<div class="widget">

								<div class="widget-header">
									<h3>5 Column</h3>
								</div>
								/widget-header

								<div class="widget-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
								</div>
								/widget-content

							</div>
							/widget

						</div>
						/span5

						<div class="span4">

							<div class="widget">

								<div class="widget-header">
									<h3>4 Column</h3>
								</div>
								/widget-header

								<div class="widget-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur.</p>
								</div>
								/widget-content

							</div>
							/widget
						</div>
						/span4

					</div> -->
					<!-- /row -->

				</div>
				<!-- /span9 -->


			</div>
			<!-- /row -->

		</div>
		<!-- /container -->

	</div>
	<!-- /content -->


	<%@ include file="include/bottom.jsp"%>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/charts/bar.js"></script>
</body>
</html>
