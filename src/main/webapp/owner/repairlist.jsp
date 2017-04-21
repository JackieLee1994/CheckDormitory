<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/pagination" prefix="pagination"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>业主维修任务列表</title>

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
	
		<c:if test="${sessionScope.type=='业主' }">
		window.location.href = "${pageContext.request.contextPath}/repairtask/toadd"
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

				<%@ include file="/include/left_owner.jsp"%>

				<%-- <button type="button" class="btn btn-primary btn-large"
							id="addbtn"  onchange="check();"
							onclick="location.href='${pageContext.request.contextPath}/repairtask/toadd';">新增维修任务</button>
						&nbsp;&nbsp;&nbsp;&nbsp; --%>
				<br>
				<div class="span9">

					<h1 class="page-title">
						<i class="icon-home"></i> 维修任务
					</h1>

					<div class="form-actions">

						<button type="button" class="btn btn-primary btn-large"
							id="addbtn" onclick="check()">新增维修任务</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
					</div>



					<div class="widget widget-table">

						<div class="widget-header">
							<i class="icon-th-list"></i>
							<h3>维修任务</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">
							<form action="" method="post">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th>项目</th>
											<th>维修种类</th>
											<th>维修内容</th>
											<th>任务状态</th>
											<th>维修人员</th>
											<th>查看</th>
											<th>操作</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${list }" var="l" varStatus="num">
											<tr>
												<td>${num.index +1 }</td>
												<td>${l.repairproject }</td>
												<td>${l.repairtype }</td>
												<td>${l.repaircontent }</td>
												<!-- 任务状态判断 -->
												<c:if test="${l.taskstatus ==0}">
													<td>待抢单</td>
												</c:if>
												<c:if test="${l.taskstatus ==1}">
													<td>已抢单</td>
												</c:if>
												<c:if test="${l.taskstatus ==2}">
													<td>已完成</td>
												</c:if>
												<c:if test="${l.taskstatus ==3}">
													<td>已评价</td>
												</c:if>
												<c:if test="${l.taskstatus ==4}">
													<td>已接单</td>
												</c:if>
												<c:if test="${l.taskstatus ==5}">
													<td>已派单</td>
												</c:if>
												<td>${l.workpeople }</td>
												<c:if test="${l.picurl !=null}">
													<td><a href
														onclick="javascript:{window.open('${pageContext.request.contextPath}/upload/${l.picurl}');}">查看</a>
													</td>
												</c:if>
												<c:if test="${l.picurl ==null}">
													<td></td>
												</c:if>
												<td><c:if test="${l.taskstatus ==0}">
														<a href="${l.id}/update">修改</a>
														<a href="${l.id}/del">删除</a>
														<a href="###" onclick="alert('还未完成工作 不能评价');">评价</a>
													</c:if> <c:if test="${l.taskstatus ==1}">
														<a href="###" onclick="alert('已抢单，不能修改！！！');">修改</a>
														<a href="###" onclick="alert('已抢单，不能删除！！！');">删除</a>
														<a href="###" onclick="alert('还未完成工作 不能评价');">评价</a>
													</c:if> <c:if test="${l.taskstatus ==2}">
														<a href="###" onclick="alert('工作已完成，不能修改');">修改</a>
														<a href="###" onclick="alert('工作已完成，不能删除');">删除</a>
														<a href="${l.id}/sure">评价</a>
													</c:if> <c:if test="${l.taskstatus ==3}">
														<a href="###" onclick="alert('工作已完成，不能修改');">修改</a>
														<a href="###" onclick="alert('工作已完成，不能删除');">删除</a>
														<a href="###" onclick="alert('已经评价了 谢谢！！！');">评价</a>
													</c:if>
													<c:if test="${l.taskstatus ==4}">
														<a href="###" onclick="alert('工作人员已接单，不能修改');">修改</a>
														<a href="###" onclick="alert('工作人员已接单，不能删除');">删除</a>
														<a href="###" onclick="alert('还未完成工作 不能评价');">评价</a>
													</c:if>
													<c:if test="${l.taskstatus ==5}">
														<a href="###" onclick="alert('已派单，不能修改');">修改</a>
														<a href="###" onclick="alert('已派单，不能删除');">删除</a>
														<a href="###" onclick="alert('还未完成工作 不能评价');">评价</a>
													</c:if>
													</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
								<div></div>
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
