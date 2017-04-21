<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>极客学院-SpringMVC实现CRM客户关系管理系统</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/charts/bar.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/myjs/nav.js"></script>
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
	<link
	href="${pageContext.request.contextPath}/css/nav.css"
	rel="stylesheet" />

<link href="${pageContext.request.contextPath}/css/pages/dashboard.css"
	rel="stylesheet" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">

ul,dl,dd,h2,p,form {
	padding:0;
	margin:0;
}
ul li {
	list-style-type:none;
}

#nav {
	width:465px;
	height:52px;
	background:url(images/nav_bg.png) no-repeat;
	margin:0 auto;
	position:relative;
}
#nav ul {
	position:absolute;
}
#nav ul li {
	width:85px;
	height:52px;
	line-height:52px;
	text-align:center;
	font-weight:bold;
	float:left;
}
#nav ul.black {
	left:20px;
	color:#333;
	z-index:1;
}
#nav ul.white {
	width:425px;
	color:#fff;
	z-index:3;
	left:0;
}
#nav ul.about {
	z-index:4;
	left:20px;
	cursor:pointer;
	background:red;
	filter:alpha(opacity=0);
	opacity:0;
}
#nav div.nav_bg {
	width:85px;
	height:52px;
	background:url(images/nav_over.png) no-repeat 0 11px;
	position:absolute;
	left:20px;
	top:0px;
	z-index:2;
	overflow:hidden;
}

</style>

<script type="text/javascript">
$(function () {
	$('#nav .about li').hover(function () {
		var target = $(this).first().offsetLeft;
		$('#nav .nav_bg').animate({
			attr : 'x',
			target : target + 20,
			t : 30,
			step : 10,
			fn : function () {
				$('#nav .white').animate({
					attr : 'x',
					target : -target
				});
			}
		});
	}, function () {
		$('#nav .nav_bg').animate({
			attr : 'x',
			target : 20,
			t : 30,
			step : 10,
			fn : function () {
				$('#nav .white').animate({
					attr : 'x',
					target : 0
				});
			}
		});
	});
	


});
</script>

</head>

<body>
	<%@ include file="include/top.jsp"%>
	
	
	
	
	<div id="content">
		<div class="container">
			<div class="row">
				<%@ include file="include/left_admin.jsp"%>
				
				<div class="span9">
<div id="nav">
	<ul class="about">
		<li>#</li>
		<li>##</li>
		<li>#</li>
		<li>#</li>
		<li>#</li>
	</ul>
	<ul class="black">
		<li>首页</li>
		<li>博文列表</li>
		<li>精彩相册</li>
		<li>动感音乐</li>
		<li>关于我</li>
	</ul>
	<div class="nav_bg">
		<ul class="white">
			<li>首页</li>
			<li>博文列表</li>
			<li>精彩相册</li>
			<li>动感音乐</li>
			<li>关于我</li>
		</ul>
	</div>	
</div>

<br>
					<h1 class="page-title">
						<i class="icon-th-list"></i> 客户管理
					</h1>
					<div class="form-actions">
						<button    type="button" 
							class="btn btn-primary btn-large"
							onclick="location.href='add.jsp';">新增用户</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-large"
							onclick="location.href='import.jsp';">批量导入用户</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-large btn-success">批量导出用户</button>
				
    

						
					</div>
					<div class="widget widget-table">

						<div class="widget-header">
							<i class="icon-th-list"></i>
							<h3>客户列表</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">

							<table class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>#</th>
										<th>姓名</th>
										<th>邮箱地址</th>
										<th>手机号码</th>
										<th>公司</th>
										<th>常用操作</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td>1</td>
										<td>Michael</td>
										<td>Jordan</td>
										<td>@mjordan</td>
										<td>Chicago Bulls</td>
										<td class="action-td"><a href="javascript:;"
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
										</a> <a href="javascript:;" class="btn btn-small"> <i
												class="icon-remove"></i>
										</a></td>
									</tr>
									<tr>
										<td>2</td>
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
									<tr>
										<td>3</td>
										<td>Charles</td>
										<td>Barkley</td>
										<td>@cbarkley</td>
										<td>Phoenix Suns</td>
										<td class="action-td"><a href="javascript:;"
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
										</a> <a href="javascript:;" class="btn btn-small"> <i
												class="icon-remove"></i>
										</a></td>
									</tr>
									<tr>
										<td>4</td>
										<td>Karl</td>
										<td>Malone</td>
										<td>@kmalone</td>
										<td>Utah Jazz</td>
										<td class="action-td"><a href="javascript:;"
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
										</a> <a href="javascript:;" class="btn btn-small"> <i
												class="icon-remove"></i>
										</a></td>
									</tr>
									<tr>
										<td>5</td>
										<td>David</td>
										<td>Robinson</td>
										<td>@drobinson</td>
										<td>San Antonio Spurs</td>
										<td class="action-td"><a href="javascript:;"
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
										</a> <a href="javascript:;" class="btn btn-small"> <i
												class="icon-remove"></i>
										</a></td>
									</tr>
									<tr>
										<td>6</td>
										<td>Reggie</td>
										<td>Miller</td>
										<td>@rmiller</td>
										<td>Indiana Pacers</td>
										<td class="action-td"><a href="javascript:;"
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
										</a> <a href="javascript:;" class="btn btn-small"> <i
												class="icon-remove"></i>
										</a></td>
									</tr>
									<tr>
										<td>7</td>
										<td>Clyde</td>
										<td>Drexler</td>
										<td>@cdrexler</td>
										<td>Portland Trail Blazers</td>
										<td class="action-td"><a href="javascript:;"
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
										</a> <a href="javascript:;" class="btn btn-small"> <i
												class="icon-remove"></i>
										</a></td>
									</tr>
									<tr>
										<td>8</td>
										<td>Hakeem</td>
										<td>Olajuwon</td>
										<td>@holajuwon</td>
										<td>Houston Rockets</td>
										<td class="action-td"><a href="javascript:;"
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
										</a> <a href="javascript:;" class="btn btn-small"> <i
												class="icon-remove"></i>
										</a></td>
									</tr>
								</tbody>
							</table>





						</div>
						<nav    >
							<ul class="pagination"  >
								<li><a href="#" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>

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

	<!-- Placed at the end of the document so the pages load faster -->
	
</body>
</html>
