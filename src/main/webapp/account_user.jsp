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
<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>


<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
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


<link href="${pageContext.request.contextPath}/css/pages/plans.css"
	rel="stylesheet" />

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<script type="text/javascript">
	function validate() {
		var text1 = $("#password1");
		var text2 = $("#password2");
		if (text1.val() != text2.val()) {
			$("#div3").text("密碼不一致，請重新輸入").css({
				"font-size" : "12px",
				"color" : "red"
			});
		} else {
			$("#div3").text("");
		}
	}
	function update() {
		$.post("${pageContext.request.contextPath}/user", dealResult);
	}
	function dealResult(result) {
		var re = result.split("&");
		if (re[0] == 'OK') {
			alert(re[1]);
			setTimeout("window.location.reload()", 500);
		}
		if (re[0] == 'ERROR') {
			alert(re[1]);
		}

	}
</script>

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
						<i class="icon-th-large"></i> 个人中心
					</h1>


					<div class="row">

						<div class="span9">

							<div class="widget">

								<div class="widget-header">
									<h3>基本信息</h3>
								</div>
								<!-- /widget-header -->

								<div class="widget-content">



									<div class="tabbable">


										<br />

										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<form id="edit-profile" class="form-horizontal"
													action="${pageContext.request.contextPath}/user"
													method="post" />
												<fieldset>
													<input type="hidden" class="input-medium disabled"
														name="userid" id="userid" value="${user.id }"    />
													<div class="control-group">
														<label class="control-label" for="username">登录账号</label>
														<div class="controls">
															<input type="text" class="input-medium disabled"
																name="username" id="username" value="${user.userName }" />

														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->




													<div class="control-group">
														<label class="control-label" for="lastname">手机号码</label>
														<div class="controls">
															<input type="text" class="input-medium" id="tel"
																name="tel" value="${user.tel }" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->





													<div class="control-group">
														<label class="control-label" for="password1">修改密码</label>
														<div class="controls">
															<input type="password" class="input-medium"
																name="password1" id="password1"
																value="${user.passWord }" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->


													<div class="control-group">
														<label class="control-label" for="password2">确认密码</label>
														<div class="controls">
															<input type="password" class="input-medium"
																name="password2" id="password2" value="password"
																onblur="validate()" />

														</div>
														<div class="controls" id="div3"></div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->



													<br />


													<div class="form-actions">
														<button type="submit" class="btn btn-primary">提交保存</button>
														<button class="btn">取消操作</button>
													</div>
													<!-- /form-actions -->
												</fieldset>
												</form>
											</div>

											<div class="tab-pane" id="2">
												<form id="edit-profile2" class="form-horizontal" />
												<fieldset>


													<div class="control-group">
														<label class="control-label" for="accounttype">Account
															Type</label>
														<div class="controls">
															<label class="radio"> <input type="radio"
																name="accounttype" value="option1" checked="checked"
																id="accounttype" /> POP3
															</label> <label class="radio"> <input type="radio"
																name="accounttype" value="option2" /> IMAP
															</label>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="accountusername">Account
															Username</label>
														<div class="controls">
															<input type="text" class="input-large"
																id="accountusername" value="rod.howard@example.com" />
															<p class="help-block">Leave blank to use your profile
																email address.</p>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="emailserver">Email
															Server</label>
														<div class="controls">
															<input type="text" class="input-large" id="emailserver"
																value="mail.example.com" />
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="accountpassword">Password</label>
														<div class="controls">
															<input type="text" class="input-large"
																id="accountpassword" value="password" />
														</div>
													</div>




													<div class="control-group">
														<label class="control-label" for="accountadvanced">Advanced
															Settings</label>
														<div class="controls">
															<label class="checkbox"> <input type="checkbox"
																name="accountadvanced" value="option1" checked="checked"
																id="accountadvanced" /> User encrypted connection when
																accessing this server
															</label> <label class="checkbox"> <input type="checkbox"
																name="accounttype" value="option2" /> Download all
																message on connection
															</label>
														</div>
													</div>


													<br />

													<div class="form-actions">
														<button type="submit" class="btn btn-primary">Save</button>
														<button class="btn">Cancel</button>
													</div>
												</fieldset>
												</form>
											</div>

										</div>


									</div>








								</div>
								<!-- /widget-content -->

							</div>
							<!-- /widget -->

						</div>
						<!-- /span9 -->

					</div>
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
