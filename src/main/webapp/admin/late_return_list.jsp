<%--
  Created by IntelliJ IDEA.
  User: lwxzbh
  Date: 2017/5/23
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/pagination" prefix="pagination" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>晚未归名单</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>

    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/charts/bar.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/page.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/css/adminia.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/adminia-responsive.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/css/pages/dashboard.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/jquery.fly.min.js"></script>
    <style type="text/css">
    </style>
    <!--[if lte IE 9]>
    <script src="requestAnimationFrame.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="Shortcut Icon" href="/img/headshot.png" type="image/x-icon">
    <script>
        function exportExcel() {
            window.location.href = "${pageContext.request.contextPath}/ExportExcel/admin"
        }
    </script>
</head>
<body>
<%@ include file="/include/top.jsp" %>
<div id="content">
    <div class="container">
        <div class="row">
            <%@include file="/include/left_admin.jsp" %>

            <div class="span9">
                <div class="widget widget-table">
                    <div class="form-actions">
                        <button type="button" class="btn btn-primary btn-large"
                                id="exportBtn" onclick="exportExcel()">导出Excel
                        </button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="widget-header">
                        <i class="icon-th-list"></i>
                        <h3>最新晚未归名单（${date}）</h3>

                    </div>

                    <div class="widget-content">
                        <form action="" method="post">
                            <table class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>学号</th>
                                    <th>姓名</th>
                                    <th>班级</th>
                                    <th>寝室</th>
                                    <th>电话</th>
                                    <th>晚归（次）</th>
                                    <th>操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${list}" var="l" varStatus="num">
                                    <tr>
                                        <td>${num.index +1 }</td>
                                        <td>${l.studentInfo.stuNumber}</td>
                                        <td>${l.studentInfo.name }</td>
                                        <td>${l.studentInfo.clazz }</td>
                                        <td>${l.studentInfo.dormitoryBuilding}
                                                ${l.studentInfo.dormitoryNumber}</td>
                                        <td>${l.studentInfo.tel}</td>
                                        <td align="right">${l.studentInfo.noComingSum}</td>
                                        <!-- 操作 -->
                                        <td>
                                            <a href="${pageContext.request.contextPath}/dataAdmin/${l.checkResult.id}/delete">销名</a>
                                            <script>
                                                function sendMSG() {
                                                    $.ajax( {
                                                        type : 'post',
                                                        url : '/CheckDormitory/dataStatistics/sendMsg',
                                                        contentType:'application/json;charset=utf-8',
                                                        data : '${l.studentInfo.tel}',
                                                        success : function(data) {
                                                            alert(data.res);
                                                        },
                                                        error : function(data) {
                                                            alert("网络请求失败")
                                                        }
                                                    });
                                                }
                                            </script>
                                            <a <%--onclick="sendMSG()"--%>>发短信</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div>

                            </div>
                        </form>
                    </div>

                    <nav>
                        <ul class="pagination">

                            <c:if test="${page != null}">
                                <pagination:page parameter="${page}"/>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/include/bottom.jsp" %>
</body>
</html>
