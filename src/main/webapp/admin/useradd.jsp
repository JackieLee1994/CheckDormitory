<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>增加用户</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>


    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>


    <script src="${pageContext.request.contextPath}/bootstrap20160104/lib/bootstrap-select.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap20160104/lib/bootstrap-select.css">
    <script src="${pageContext.request.contextPath}/bootstrap20160104/lib/bootstrap.min.js"></script>

    <link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet"/>


    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/css/adminia.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/adminia-responsive.css" rel="stylesheet"/>


    <link href="${pageContext.request.contextPath}/css/pages/plans.css" rel="stylesheet"/>

    <script src="${pageContext.request.contextPath}/myjs/getproject.js"></script>
    <script src="${pageContext.request.contextPath}/myjs/getmaintain.js"></script>


    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>

    <![endif]-->

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>
        checkbox {
            width: 18px;
            height: 18px;
        }
    </style>
    <script language="JavaScript">
        function showClasses() {
            var obj = document.getElementById("grade"); //定位id
            var index = obj.selectedIndex; // 选中索引
            var text = obj.options[index].text; // 选中文本
            var value = obj.options[index].value;
            var collegeSelect = document.getElementById("college");
            index = collegeSelect.selectedIndex;
            var collegeValue = collegeSelect.options[index].value;
            $.ajax({
                type: 'get',
                url: '/CheckDormitory/power/classes/' + collegeValue + '/' + value,
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    var classes_html = '<div class="control-group">'
                    + '<label class="control-label" for="workId">'
                    + '班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label>'
                    + '<div class="controls">';
                    for (var i = 0; i < data.length; i++) {
                        console.log(data[i]);

                        classes_html += '<input style="width: 16px;height: 16px" type="checkbox" id="selectedClasses" name="selectedClasses" value="'+data[i]+'"/>' + data[i]+'&nbsp;&nbsp;';
                    }
                    classes_html += '</div></div>';
                    $('#classFieldset').html(classes_html);
                },
                error: function (data) {
                    alert("error")
                }
            });
        }
        function showGrade() {
            $('#college').removeAttr("onChange");
            var html2 = '';
            html2 += '<div class="control-group">'
                + '<label class="control-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label>'
                + '<div class="controls">'
                + '<select class="input-medium " id="grade" name="grade" onchange="showClasses()">'
                + '<option value="-1">---请选择年级---</option>'
                + '<option value="1">大一</option>'
                + '<option value="2">大二</option>'
                + '<option value="3">大三</option>'
                + '<option value="4">大四</option>'
            ;
            html2 += '</select></div></div>';
            $('#power').append(html2);
        };
        function showNode() {
            var options = "";
            $.ajax({
                type: 'get',
                url: '/CheckDormitory/power/colleges',
                contentType: 'application/json;charset=utf-8',
                success: function (data) {
                    $.each(data.college, function (n, jsonObject) {
                        options += '<option value="' + jsonObject.value + '">' + jsonObject.text + '</option>';
                    });
                    showSelect();
                },
                error: function (data) {
                    alert("error")
                }
            });

            function showSelect() {
                var obj = document.getElementById("type"); //定位id
                var index = obj.selectedIndex; // 选中索引
                var text = obj.options[index].text; // 选中文本
                var html = "";
                if (text == "辅导员") {
                    html = '<legend style="font-size: medium" id="legend">管理的班级</legend>';
                    html += '<div class="control-group">'
                        + '<label class="control-label">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院</label>'
                        + '<div class="controls">'
                        + '<select class="input-medium " id="college" name="college" onchange="showGrade()">'
                        + '<option value="-1">---请选择学院---</option>'
                        + options;
                    html += '</select></div></div>';
                    $('#power').html(html);
                } else if (text == "宿舍管理员") {
                    html = '<legend style="font-size: medium" id="legend">查寝范围</legend>';

                    $('#power').html(html);
                } else if (text == "系统管理员") {
                    html = "";
                    $('#power').html(html);
                    $('#classFieldset').html(html);
                }
            }

        }
    </script>
</head>

<body>

<%@ include file="/include/top.jsp" %>

<div id="content">

    <div class="container">
        <div class="row">
            <%@ include file="/include/left_admin.jsp" %>
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

                                    <br/>

                                    <div class="tab-content">
                                        <div class="tab-pane active" id="1">
                                            <form id="edit-profile" class="form-horizontal"
                                                  action="${pageContext.request.contextPath}/user/add"
                                                  method="post">
                                                <fieldset>
                                                    <legend style="font-size: medium">基本信息</legend>
                                                    <div class="control-group">
                                                        <label class="control-label" for="type">用户类型</label>
                                                        <div class="controls">
                                                            <select class="input-medium " id="type" name="typeId"
                                                                    onchange="showNode()">
                                                                <option value="1">系统管理员</option>
                                                                <option value="2">辅导员</option>
                                                                <option value="3">宿舍管理员</option>
                                                            </select>
                                                        </div>
                                                        <!-- /controls -->
                                                    </div>
                                                    <!-- /control-group -->


                                                    <div class="control-group">
                                                        <label class="control-label" for="gender">
                                                            性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
                                                        <div class="controls">
                                                            <select class="input-medium " id="gender" name="gender">
                                                                <option value="0">女</option>
                                                                <option value="1">男</option>
                                                            </select>
                                                        </div>
                                                        <!-- /controls -->
                                                    </div>
                                                    <!-- /control-group -->

                                                    <%--<br/> <br/>--%>
                                                    <div class="control-group">
                                                        <label class="control-label" for="workId">
                                                            工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label>
                                                        <div class="controls">
                                                            <input type="text" class="input-large" id="workId"
                                                                   name="workId" placeholder="工号" value="20134545"/>
                                                        </div>
                                                        <!-- /controls -->
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label" for="username">
                                                            姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
                                                        <div class="controls">
                                                            <input type="text" class="input-large" id="username"
                                                                   name="username" placeholder="姓名" value="习大大"/>
                                                        </div>
                                                        <!-- /controls -->
                                                    </div>
                                                    <!-- /control-group -->

                                                    <div class="control-group" id="password_div">
                                                        <label class="control-label" for="password">
                                                            密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                                                        <div class="controls">
                                                            <input type="text" class="input-large" id="password"
                                                                   name="password" placeholder="" value="123"/>
                                                        </div>
                                                        <!-- /controls -->
                                                    </div>
                                                </fieldset>
                                                <fieldset id="power">
                                                </fieldset>
                                                <fieldset id="classFieldset">
                                                </fieldset>

                                                <br/>
                                                <div class="form-actions">
                                                    <button type="submit" class="btn btn-success btn-large">
                                                        提交保存
                                                    </button>
                                                    <button class="btn btn-large" onclick="window.history.back()">
                                                        取消操作
                                                    </button>
                                                </div>
                                            </form>
                                        </div>


                                        <div class="tab-pane" id="2">
                                            <form id="edit-profile2" class="form-horizontal">
                                                <fieldset>
                                                    <div class="control-group">
                                                        <label class="control-label" for="accounttype">Account
                                                            Type</label>
                                                        <div class="controls">
                                                            <label class="radio"> <input type="radio"
                                                                                         name="accounttype"
                                                                                         value="option1"
                                                                                         checked="checked"
                                                                                         id="accounttype"/> POP3
                                                            </label> <label class="radio"> <input type="radio"
                                                                                                  name="accounttype"
                                                                                                  value="option2"/> IMAP
                                                        </label>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label" for="accountusername">Account
                                                            Username</label>
                                                        <div class="controls">
                                                            <input type="text" class="input-large"
                                                                   id="accountusername" value="rod.howard@example.com"/>
                                                            <p class="help-block">Leave blank to use your profile
                                                                email address.</p>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label" for="emailserver">Email
                                                            Server</label>
                                                        <div class="controls">
                                                            <input type="text" class="input-large" id="emailserver"
                                                                   value="mail.example.com"/>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label"
                                                               for="accountpassword">Password</label>
                                                        <div class="controls">
                                                            <input type="text" class="input-large"
                                                                   id="accountpassword" value="password"/>
                                                        </div>
                                                    </div>


                                                    <div class="control-group">
                                                        <label class="control-label" for="accountadvanced">Advanced
                                                            Settings</label>
                                                        <div class="controls">
                                                            <label class="checkbox"> <input type="checkbox"
                                                                                            name="accountadvanced"
                                                                                            value="option1"
                                                                                            checked="checked"
                                                                                            id="accountadvanced"/> User
                                                                encrypted connection when
                                                                accessing this server
                                                            </label> <label class="checkbox"> <input type="checkbox"
                                                                                                     name="accounttype"
                                                                                                     value="option2"/>
                                                            Download all
                                                            message on connection
                                                        </label>
                                                        </div>
                                                    </div>


                                                    <br/>

                                                    <div class="form-actions">
                                                        <button type="submit" class="btn btn-success btn-large">Save
                                                        </button>
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
<%@ include file="/include/bottom.jsp" %>
</body>
</html>
