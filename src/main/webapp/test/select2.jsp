<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>select2</title>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.2.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap20160104/lib/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/bootstrap20160104/lib/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/dist/css/select2.min.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/dist/js/select2.min.js"></script>
    <script type="text/javascript">
        $(".js-example-basic-multiple").select2();
    </script>
</head>
<body>
<select class="js-example-basic-multiple" multiple="multiple">
    <option value="AL">Alabama</option>
    <option value="WY">Wyoming</option>
</select>
</body>
</html>
