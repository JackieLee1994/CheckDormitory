<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>维修人员提交任务页面</title>

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

<script>
	function setImagePreview() {
		var docObj = document.getElementById("cfile");
		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '300px';
			imgObjPreview.style.height = '120px';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//必须设置初始大小
			localImagId.style.width = "250px";
			localImagId.style.height = "200px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>

	<%@ include file="/include/top.jsp"%>
	<div id="content">
		<div class="container">
			<div class="row">
				<%@ include file="/include/left_repair.jsp"%>
				<div class="span9">
					<h1 class="page-title">
						<i class="icon-th-list"></i>维修任务
					</h1>
					<div class="row">
						<div class="span9">

							<div class="widget">

								<div class="widget-header">
									<h3>提交我的任务</h3>
								</div>
								<!-- /widget-header -->

								<div class="widget-content">



									<div class="tabbable">


										<br /> <br /> <br />

										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<form id="edit-profile" class="form-horizontal"
													 method="post"  modelAttribute="repairTask"
													enctype="multipart/form-data" />
												<fieldset>

													<div class="control-group">
														<label class="control-label" for="lastname">客户联系方式</label>
														<div class="controls">
															<input type="text" class="input-large" id="tel"
																name="tel" value="${repairTask.tel }" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->


													<div class="control-group">
														<label class="control-label" for="email">维修内容</label>
														<div class="controls">
															<input type="text" class="input-large"   id="repaircontent"
																name="repaircontent" value="${repairTask.repaircontent }" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->



													<div class="control-group">
														<label class="control-label" for="lastname">地址</label>
														<div class="controls">
															<input type="text" class="input-large" id="adress"
																name="adress" value="${repairTask.adress }" />
														</div>
														<!-- /controls -->
													</div>
													<!-- /control-group -->
													
													
													
													<div class="control-group">
														<p>
														<div id="localImag" class="controls">
															<img id="preview" width=-1 height=-1 style="diplay:none" />
														</div>
														</p>
														<!-- /controls -->
													</div>

													<!-- /control-group -->



													<div class="control-group">
														<label class="control-label" for="email">上传文件</label>
														<div class="controls">
															<input type=file name="cfile" id="cfile"
																onchange="javascript:setImagePreview();">
														</div>
														<!-- /controls -->
													</div>

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
