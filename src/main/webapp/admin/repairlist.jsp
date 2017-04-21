<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/pagination" prefix="pagination"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>管理员维修列表</title>

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
.addinfo {
	width: 625px;
	height: 320px;
	position: absolute;
	top: 0;
	left: 23%;
	background: #fcfdfd;
	box-shadow: 1px 8px 10px 1px #9b9b9b;
	border-radius: 1px;
	behavior: url(js/pie.htc);
	display: none;
	z-index: 111111;
}
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
	$(".cancel").click(function() {

		$(".addinfo").fadeOut(100);
	});
	});
</script>
<script language=javascript>
	function check() {
		<c:if test="${sessionScope.type=='管理员' }">
		window.location.href = "${pageContext.request.contextPath}/repairtask/admintoadd"
		</c:if>
	}
	function openUserWin(type, user, userGuid) {
		var url = "${pageContext.request.contextPath}/user/tosend?type=" + type + "&user=" + user
				+ "&userGuid=" + userGuid;
		window
				.open(
						url,
						'',
						'height=600,width=1100,scrollbars=yes,left=200,top=100,location=no,status=yes,toolbar=no,menubar=no,titlebar=no');
		// var windowStatus = "dialogWidth:260px;dialogHeight:180px;center:1;status:0;";
		//在模式窗口中打开的页面
		// var url = "${root}/print/taskUser.tl";
		//将模式窗口返回的值临时保存
		// var temp = showModalDialog(url,"",windowStatus);
		// alert(temp);

	}

	//获取人员
	function getuser(type, usertype, testuser, userGuid) {
		$("#" + usertype).val(type);
		$("#" + userGuid).val("");
		$("#" + testuser).val("");
		openUserWin(type, testuser, userGuid);
		//禁用按钮的提交 
		return false;
	};
	
	//获取人员
	function gettask(rid) {
		getRepair(rid);
		$(".addinfo").fadeIn(200);
		return false;
	};
	function myChange() {
   alert("myChange=============");
  var rid= document.getElementById("taskid").value;
   alert(rid+"-----pid-------")
		$.ajax({
			//要用post方式 
			type : "Post",
			//方法所在页面和方法名 
			url : "${pageContext.request.contextPath}/repairtask/change?id="+rid,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
		});
	}
	function addMessage() {
		$(".load_data").show();
		var data = $("#form2").serializeArray(); //自动将form表单封装成json
		$.post("${pageContext.request.contextPath}/message/add", data, dealResult, "json");
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
	
	
	function getRepair(rid) {
		var val = rid;
		$("#taskid").val(rid);
		$.ajax({
			//要用post方式 
			type : "Post",
			//方法所在页面和方法名 
			url : "${pageContext.request.contextPath}/repairtask/gettask?rid="+rid,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			data : val,
			success : function(data) {
				//返回的数据用data.d获取内容 
				if (data != null && data != '') {
					alert(data+"=====Repair")
					alert(data.repairproject+"=====Repair")
					$("#title").val(data.repairproject);
					$("#type").val(data.repairtype);
					$("#rcontent").val(data.repaircontent);
					
				} else {
					// alert("查找不到楼层");
				}

			},
			error : function(err) {
				alert(err);
			}
		});
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
											<th>报修者</th>
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
												<td>${l.repairpeople }</td>
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
														<a href="${l.id}/adminupdate">修改</a>
														<a href="${l.id}/admindel">删除</a>
														<%-- ${l.id}/adminsent --%>
														<a href="javascript:void(0)" onclick="gettask('${l.id}')">派单</a>
													</c:if> <c:if test="${l.taskstatus ==1}">
														<a href="###" onclick="alert('已抢单，不能修改！！！');">修改</a>
														<a href="###" onclick="alert('已抢单，不能删除！！！');">删除</a>
													</c:if> <c:if test="${l.taskstatus ==2}">
														<a href="###" onclick="alert('工作已完成，不能修改');">修改</a>
														<a href="###" onclick="alert('工作已完成，不能删除');">删除</a>
														<a href="${l.id}/adminsure">评价</a>
													</c:if> <c:if test="${l.taskstatus ==3}">
														<a href="###" onclick="alert('工作已完成，不能修改');">修改</a>
														<a href="###" onclick="alert('工作已完成，不能删除');">删除</a>
														<a href="###" onclick="alert('已经评价了 谢谢！！！');">评价</a>
													</c:if>
													
													<c:if test="${l.taskstatus ==4}">
														<a href="###" onclick="alert('已接单，不能修改');">修改</a>
														<a href="###" onclick="alert('已接单，不能删除');">删除</a>
														<a href="###" onclick="alert('还未完成，不能评价！');">评价</a>
													</c:if>
													<c:if test="${l.taskstatus ==5}">
														<a href="###" onclick="alert('工作已完成，不能修改');">修改</a>
														<a href="###" onclick="alert('工作已完成，不能删除');">删除</a>
														<a href="###" onclick="alert('已经评价了 谢谢！！！');">评价</a>
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

						<!--addinfo  -->
						<div class="addinfo">
							<div class="tiptop">
								<br> <span
									style="font-family:华文中宋; color:blue; font-size: 20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;任务派送</span><a></a>
							</div>
							<form action="" method="post" id="form2" class="form-horizontal"
								name="form2">

								<div class="tipinfo"
									style="margin-top: 0px;overflow:auto;height:220px;padding-top:2px;padding-top:0px;margin-bottom:10px">
									<ul class="forminfo">
										<br>
										<br>
										<input name="taskid" id="taskid" type="hidden"
											class="input-medium" value="" style="width: 145px;" />

										<div class="control-group">
											<label class="control-label" for="lastname">员工姓名</label>
											<div class="controls">
												<input name="usertype2" id="usertype2" type="hidden"
													class="txt" value="" /> <input name="user2" id="user2"
													type="hidden" class="txt" value="" /> <input
													name="testuser2" id="testuser2" type="text"
													class="input-medium" value="" style="width: 145px;" /> <input
													name="userbutton" type="button" class="btn"
													onclick="getuser(1,'usertype2','testuser2','user2');"
													value="选择人员" />
											</div>
											<!-- /controls -->
										</div>
										<div class="control-group">
											<label class="control-label" for="lastname">项目</label>
											<div class="controls">
												<input type="text" class="input-medium" id="title"
													name="title" value="" />
											</div>
											<!-- /controls -->
										</div>
										<div class="control-group">
											<label class="control-label" for="lastname">类型</label>
											<div class="controls">
												<input type="text" class="input-medium" id="type"
													name="type" value="" />
											</div>
											<!-- /controls -->
										</div>
										<div class="control-group">
											<label class="control-label" for="lastname">内容</label>
											<div class="controls">
												<input type="text" class="input-medium" id="rcontent"
													name="rcontent" value="" />
											</div>
											<!-- /controls -->
										</div>
										<center>
											<li style="display: none;"><tr>
													<td colspan="3" align="center"><img
														src="/propertysystem/images/load.gif" alt="加载中..."
														class="load_data" style="display:none" width="30"
														height="30" /></li>
										</center>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-primary"
										onclick="addMessage();myChange()">确定</button>
									<button class="btn">取消操作</button>
								</div>
								<!-- /form-actions -->

							</form>
						</div>

					</div>


				</div>



			</div>


		</div>


	</div>



	<%@ include file="/include/bottom.jsp"%>

</body>
</html>
