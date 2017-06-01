<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="span3">

    <div class="account-container">

        <div class="account-avatar">
            <img src="${pageContext.request.contextPath}/img/kobe.jpg" alt="" class="thumbnail"/>
        </div>
        <!-- /account-avatar -->

        <div class="account-details">

            <span class="account-name">${sessionScope.username }</span>
            <c:if test="${sessionScope.type==1}">
                <span class="account-role">系统管理员</span>
            </c:if>
            <c:if test="${sessionScope.type==2}">
                <span class="account-role">辅导员</span>
            </c:if>
            <c:if test="${sessionScope.type==3}">
                <span class="account-role">宿舍管理员</span>
            </c:if>
            <%-- <span class="account-actions">
                 <a href="javascript:;">个人中心</a>
                 <a href="javascript:;">系统设置</a>
             </span>--%>

        </div>
        <!-- /account-details -->

    </div>
    <!-- /account-container -->

    <%--<c:if test="${sessionScope.type=='维修人员' }">


    </c:if>--%>


    <hr/>
    <!--  class="active"      将我的桌面    这些列表一直拉黑         -->
    <ul id="main-nav" class="nav nav-tabs nav-stacked">

        <li><a href="${pageContext.request.contextPath}/user/list"> <i
                class="icon-home"></i> 人员管理
        </a></li>

        <%--<li><a href="${pageContext.request.contextPath}/notice/list"> <i class="icon-th-list"></i> 公告管理
        </a></li>

        <li><a href="${pageContext.request.contextPath}/repairtask/adminlist"> <i class="icon-signal"></i> 维修管理
        </a></li>
--%>
        <li>
            <a href="${pageContext.request.contextPath}/dataAdmin/lateReturnList">
                <i class="icon-th-list"></i>
                最新晚未归名单
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/dataAdmin/lineData">
                <i class="icon-signal"></i>
                历史走势
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/dataAdmin/barData">
                <i class="icon-thumbs-up"></i>
                班级对比
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
<!-- /span3 -->
