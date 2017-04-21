<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/pagination" prefix="pagination"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>维修人员的的维修任务</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/charts/bar.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>

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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript">
	$(function() {
		/*删除一行*/
		//绑定删除事件
		$(".del").on("click", function() {
			//获取要移除的行、进行移除
			$(this).parents("tr").remove();
		});

	})
</script>




</head>





<body>


	<%@ include file="/include/top.jsp"%>

	<div id="content">

		<div class="container">

			<div class="row">

				<%@ include file="/include/left_repair.jsp"%>

				<br> <br>
				<div class="span9">

					<h1 class="page-title">
						<i class="icon-home"></i> 我的维修任务
					</h1>
					<div class="widget widget-table">

						<div class="widget-header">
							<i class="icon-th-list"></i>
							<h3>我的维修任务</h3>
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
											<th>详细地址</th>
											<th>联系电话</th>
											<th>任务状态</th>
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
												<td>${l.adress }</td>
												<td>${l.tel }</td>
												<!-- 任务状态判断 -->
												<c:if test="${l.taskstatus ==1}">
													<td>已抢到</td>
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
												<td class="action-td"><c:if test="${l.taskstatus ==1}">
														<a href="${l.id}/tosumbit">提交任务</a>&nbsp;&nbsp;&nbsp;
														<a class="del" href="${l.id}/cancel">取消</a>
													</c:if> <c:if test="${l.taskstatus ==2}">
														<a href="###" onclick="alert('任务已经提交过了！！');">提交任务</a>&nbsp;&nbsp;&nbsp;
														
													</c:if> <c:if test="${l.taskstatus ==3}">
														<a href="###" onclick="alert('任务已经提交过了！！');">提交任务</a>&nbsp;&nbsp;&nbsp;
														
													</c:if> <c:if test="${l.taskstatus ==4}">
														<a href="${l.id}/tosumbit">提交任务</a>&nbsp;&nbsp;&nbsp;
														<a class="del" href="${l.id}/cancel">拒单</a>
													</c:if>
														 <c:if test="${l.taskstatus ==5}">
														<a href="###" onclick="alert('还未接单,请前往消息中心接单');">提交任务</a>&nbsp;&nbsp;&nbsp;
														
													</c:if>
													</td>
											</tr>

										</c:forEach>
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
						<!-- /widget-content -->

					</div>

				</div>
				<!-- /span9 -->


			</div>
			<!-- /row -->

		</div>
		<!-- /container -->

	</div>
	<!-- /content -->


	<%@ include file="/include/bottom.jsp"%>

</body>
</html>
