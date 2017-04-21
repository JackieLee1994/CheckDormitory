<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="span3">

	<div class="account-container">

		<div class="account-avatar">
			<img src="${pageContext.request.contextPath}/img/headshot.png" alt=""
				class="thumbnail" />
		</div>
		<!-- /account-avatar -->

		<div class="account-details">

			<span class="account-name">${sessionScope.username }</span>
		

			<span class="account-role">${sessionScope.type }</span>
		
			<span class="account-actions"> <a href="javascript:;">个人中心</a>
				| <a href="javascript:;">系统设置</a>
			</span>

		</div>
		<!-- /account-details -->

	</div>
	<!-- /account-container -->

	<!--  class="active"      将我的桌面    这些列表一直拉黑         -->
	<ul id="main-nav" class="nav nav-tabs nav-stacked">
		<br />
		<br />
		<li><a href="${pageContext.request.contextPath}/notice/show">
				<i class="icon-home"></i> 首页
		</a></li>
		
		<li><a href="${pageContext.request.contextPath}/repairtask/ownerlist"> <i
				class="icon-th-list"></i>我的报修
		</a></li>
		<li><a href="${pageContext.request.contextPath}/touser"> <i
				class="icon-user"></i> 个人中心
		</a></li>
		
		<li><a href="${pageContext.request.contextPath}/login.jsp"> <i
				class="icon-off"></i> 安全退出
		</a></li>
		<br />
	</ul>

	<hr />

	<div class="sidebar-extra">
		<p>小伙们大家好，欢迎使用物业管理之维修管理系统。</p>
	</div>
	<!-- .sidebar-extra -->

	<br />

</div>
<!-- /span3 -->
