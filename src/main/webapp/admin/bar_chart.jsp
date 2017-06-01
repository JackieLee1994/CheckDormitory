<%--
  Created by IntelliJ IDEA.
  User: lwxzbh
  Date: 2017/5/27
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/pagination" prefix="pagination" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>班级对比</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>


    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap20160104/lib/bootstrap.min.js"></script>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/page.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/css/adminia.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/adminia-responsive.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/css/pages/dashboard.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/js/jquery.fly.min.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/headshot.png" type="image/x-icon">

    <script src="${pageContext.request.contextPath}/js/Chart-1.0.1-beta.4.js"></script>

    <script>
        //数据结构
        var data = {
            labels: [],
            datasets: [
                {
                    fillColor: "rgba(151,187,205,0.5)",
                    strokeColor: "rgba(151,187,205,1)",
                    data:[]
                }
            ]
        }
        window.onload=function () {
            console.log(data);
            var ctx = document.getElementById("myChart").getContext("2d");
            data.datasets[0].data=${data};
            var label = new Array();
            label[0] = "January";
            label[1] = "2017-05-24"
            data.labels = ${labels};
            new Chart(ctx).Bar(data);
        };
    </script>
</head>
<body>
<%@ include file="/include/top.jsp" %>
<div id="content">
    <div class="container">
        <div class="row">
            <%@include file="/include/left_admin.jsp" %>
            <br/>
            <br/>
            <br/>
            <br/>
            <div class="span9">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <i class="icon-th-list"></i>
                        <h3>班级对比</h3>
                    </div>
                    <div class="widget-content">
                        <canvas  id="myChart" width="830" height="450"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/include/bottom.jsp" %>
</body>
</html>
