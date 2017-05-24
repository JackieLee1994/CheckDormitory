<%--
  Created by IntelliJ IDEA.
  User: lwxzbh
  Date: 2017/5/23
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="span3">
    <div class="account-container">
        <div class="account-avatar">
            <img src="${pageContext.request.contextPath}/img/kobe.jpg" alt="" class="thumbnail">
        </div>
        <div class="account-details">
            <span class="account-name">${sessionScope.username}</span>
            <c:if test="${sessionScope.type==1}">
                <span class="account-role">系统管理员</span>
            </c:if>
            <c:if test="${sessionScope.type==2}">
                <span class="account-role">辅导员</span>
            </c:if>
            <c:if test="${sessionScope.type==3}">
                <span class="account-role">宿舍管理员</span>
            </c:if>
        </div>
    </div>

    <hr/>
    <!--  class="active"-->
    <ul id="main-nav" class="nav nav-tabs nav-stacked">

        <li>
            <a href="${pageContext.request.contextPath}/dataStatistics/lateReturnList?workId=${sessionScope.workId}">
                <i class="icon-th-list"></i>
                最新晚未归名单
            </a>
        </li>
        <li>
            <a href="#">
                <i class="icon-signal"></i>
                晚未归历史走势
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/dataStatistics/history_record?workId=${sessionScope.workId}">
                <i class="icon-th-list"></i>
                晚未归历史记录
            </a>
        </li>

        <li>
            <a href="#">
                <i class="icon-thumbs-up"></i>
                晚未归班级对比
            </a>
        </li>
        <li><a href="${pageContext.request.contextPath}/user/PersonalCenter"> <i class="icon-user"></i> 个人中心
        </a></li>

        <li><a href="${pageContext.request.contextPath}/login.jsp"> <i class="icon-off"></i> 安全退出
        </a></li>
    </ul>

    <hr/>

    <div class="sidebar-extra">
        <p>欢迎使用校园宿舍查寝系统。</p>
    </div>
    <!-- .sidebar-extra -->

    <br/>
</div>
