<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>管理员增加用户页面</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
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


<link href="${pageContext.request.contextPath}/css/pages/plans.css"
	rel="stylesheet" />


<script src="${pageContext.request.contextPath}/myjs/getproject.js"></script>
<script src="${pageContext.request.contextPath}/myjs/getmaintain.js"></script>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
 
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>

	<%@ include file="/include/top.jsp"%>
	<div id="content">
		<div class="container">
			<div class="row">
				<%@ include file="/include/left_admin.jsp"%>
				<div class="span9">
					<h1 class="page-title">
						<i class="icon-th-list"></i>用户管理
					</h1>
					<div class="row">
						<div class="span9">

							<div class="widget">

								<div class="widget-header">
									<h3>新增用户</h3>
								</div>
								<!-- /widget-header -->

								<div class="widget-content">



									<div class="tabbable">


										<br /> <br /> <br />

										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<form id="edit-profile" class="form-horizontal" action="${pageContext.request.contextPath}/user/add"
													method="post" />
												<fieldset>

													<div class="control-group">
														<label class="control-label" for="username">用户类型</label>
														<div class="controls">
															<select class="input-medium " id="type" name="type">
																<option value="管理员">管理员</option>
																<option value="维修人员">维修人员</option>
																<option value="业主">业主</option>
																<option value="管理层">管理层</option>
																</select>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->



													<div class="control-group">
														<label class="control-label" for="username">性别</label>
														<div class="controls">
															<select class="input-medium " id="gender" name="gender">
																<option value="0">男</option>
																<option value="1">女</option>
																</select>
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													<br /> <br />
													<div class="control-group">
														<label class="control-label" for="firstname">姓名</label>
														<div class="controls">
															<input type="text" class="input-large" id="userName"
																name="userName" placeholder="姓名" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->

													<div class="control-group">
														<label class="control-label" for="lastname">密码</label>
														<div class="controls">
															<input type="text" class="input-large" id="passWord"
																name="passWord" placeholder="" value="123"  />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													<div class="control-group">
														<label class="control-label" for="lastname">详细地址</label>
														<div class="controls">
															<input type="text" class="input-large" id="adress"
																name="adress" placeholder="详细地址" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													<div class="control-group">
														<label class="control-label" for="email">联系电话</label>
														<div class="controls">
															<input type="text" class="input-medium" id="tel"
																name="tel" placeholder="联系电话" />
														</div>
														<!-- /controls -->
													</div>



													<br />


													<div class="form-actions">
														<button type="submit" class="btn btn-success btn-large">提交保存</button>
														<button class="btn btn-large">取消操作</button>
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
														<button type="submit" class="btn btn-success btn-large">Save</button>
														<button class="btn btn-large">Cancel</button>
													</div>
												</fieldset>
												</form>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /content -->
	<%@ include file="/include/bottom.jsp"%>
</body>
</html>
