<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>极客学院-SpringMVC实现CRM客户关系管理系统</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>

    <link href="./css/bootstrap.min.css" rel="stylesheet"/>
    <link href="./css/bootstrap-responsive.min.css" rel="stylesheet"/>


    <link href="./css/font-awesome.css" rel="stylesheet"/>

    <link href="./css/adminia.css" rel="stylesheet"/>
    <link href="./css/adminia-responsive.css" rel="stylesheet"/>


    <link href="./css/pages/plans.css" rel="stylesheet"/>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<%@ include file="include/top.jsp" %>
<div id="content">

    <div class="container">

        <div class="row">

            <%@ include file="include/left_admin.jsp" %>


            <div class="span9">

                <h1 class="page-title">
                    <i class="icon-th-list"></i>客户管理
                </h1>


                <div class="row">

                    <div class="span9">

                        <div class="widget">

                            <div class="widget-header">
                                <h3>批量导入客户信息</h3>
                            </div>
                            <!-- /widget-header -->

                            <div class="widget-content">


                                <div class="tabbable">


                                    <br/>

                                    <div class="tab-content">
                                        <div class="tab-pane active" id="1">
                                            <form id="edit-profile" class="form-horizontal"/>
                                            <fieldset>

                                                <div class="control-group">
                                                    <label class="control-label" for="username">客户类别</label>
                                                    <div class="controls">
                                                        <select class="input-medium ">
                                                            <option>意向客户</option>
                                                            <option>反馈客户</option>
                                                            <option>VIP客户</option>
                                                        </select>

                                                    </div>
                                                    <!-- /controls -->
                                                </div>
                                                <!-- /control-group -->


                                                <div class="control-group">
                                                    <label class="control-label" for="firstname">Excel文件</label>
                                                    <div class="controls">
                                                        <input type="text" class="input-medium">&nbsp;&nbsp;
                                                        <button class="btn btn-primary">选择文件</button>
                                                        &nbsp;&nbsp;
                                                        <button class="btn btn-warning">下载Excel模板</button>
                                                    </div>
                                                    <!-- /controls -->
                                                </div>
                                                <!-- /control-group -->
                                                <br/>
                                                <div class="form-actions">
                                                    <button type="submit" class="btn btn-success btn-large">提交保存
                                                    </button>
                                                    <button class="btn btn-large">取消操作</button>
                                                </div>
                                                <!-- /form-actions -->
                                            </fieldset>
                                            </form>
                                        </div>

                                        <div class="tab-pane" id="2">
                                            <form id="edit-profile2" class="form-horizontal"/>
                                            <fieldset>


                                                <div class="control-group">
                                                    <label class="control-label" for="accounttype">Account
                                                        Type</label>
                                                    <div class="controls">
                                                        <label class="radio"> <input type="radio"
                                                                                     name="accounttype" value="option1"
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
                                                    <label class="control-label" for="accountpassword">Password</label>
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

<%@ include file="include/bottom.jsp" %>

<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/jquery-1.7.2.min.js"></script>


<script src="./js/bootstrap.js"></script>

</body>
</html>
