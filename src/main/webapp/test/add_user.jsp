<%--
  Created by IntelliJ IDEA.
  User: lwxzbh
  Date: 2017/5/26
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加用户</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/test/bootstrap-select.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/test/bootstrap-select.css">
    <!-- 3.0 -->
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">

    <script type="text/javascript">
        $(window).on('load', function () {
            $('.selectpicker').selectpicker({
                'selectedText': 'cat'
            });
            // $('.selectpicker').selectpicker('hide');
        });
    </script>
</head>
<body>
<label for="id_select">多选</label>
<select id="id_select" class="selectpicker bla bla bli" multiple data-live-search="true">
    <option>cow</option>
    <option>bull</option>
    <option>ASD</option>
    <option selected>Bla</option>
    <option>Ble</option>
</select>
</body>
</html>
