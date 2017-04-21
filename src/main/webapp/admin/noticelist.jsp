<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/pagination" prefix="pagination"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>管理员公告列表</title>

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
		　alert("最新公告新增成功！！！");
		　　}
	
	});
</script>
<script language=javascript>
	function check() {
		window.location.href = "${pageContext.request.contextPath}/notice/toadd"
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
						<i class="icon-home"></i> 维修任务
					</h1>

					<div class="form-actions">

						<button type="button" class="btn btn-primary btn-large"
							id="addbtn" onclick="check()">新增公告</button>
						&nbsp;&nbsp;&nbsp;&nbsp;

					</div>



					<div class="widget widget-table">

						<div class="widget-header">
							<i class="icon-th-list"></i>
							<h3>公告管理</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">
							<form action="" method="post">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th>内容一</th>
											<th>内容二</th>
											<th>内容三</th>
											<th>内容四</th>
											<th>内容五</th>
											<th>内容六</th>
											<th>操作</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${list }" var="l" varStatus="num">
											<tr>
												<td>${num.index +1 }</td>
												<td>${l.title1 }<br> ${l.content1 }<br> 
												<c:if test="${l.picurl1 !=null}">
												<a
													href
													onclick="javascript:{window.open('${pageContext.request.contextPath}/upload/${l.picurl1}');}">查看</a>
													
												</c:if>	
													
												</td>
												<td>${l.title2 }<br> ${l.content2 }<br>
												<c:if test="${l.picurl2 !=null}">
												 <a
													href
													onclick="javascript:{window.open('${pageContext.request.contextPath}/upload/${l.picurl2}');}">查看</a>
												</c:if>	
												</td>
												<td>${l.title3 }<br> ${l.content3 }<br> 
												
												
												<c:if test="${l.picurl3 !=null}">
												 <a
													href
													onclick="javascript:{window.open('${pageContext.request.contextPath}/upload/${l.picurl3}');}">查看</a>
												</c:if>	
												
												</td>
												<td>${l.title4 }<br> ${l.content4 }<br> 
												<c:if test="${l.picurl4 !=null}">
												 <a
													href
													onclick="javascript:{window.open('${pageContext.request.contextPath}/upload/${l.picurl4}');}">查看</a>
												</c:if>	
												</td>
												<td>${l.title5 }<br> ${l.content5 }<br> 
												
												
												<c:if test="${l.picurl5 !=null}">
												 <a
													href
													onclick="javascript:{window.open('${pageContext.request.contextPath}/upload/${l.picurl5}');}">查看</a>
												</c:if>	
												
												</td>
												<td>${l.title6 }<br> ${l.content6 }<br>
												
												 <c:if test="${l.picurl6 !=null}">
												 <a
													href
													onclick="javascript:{window.open('${pageContext.request.contextPath}/upload/${l.picurl6}');}">查看</a>
												</c:if>	
												
												</td>
												<td style="text-align: center; vertical-align: middle;"  >
												<a href="${l.id}/del">删除</a>
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
