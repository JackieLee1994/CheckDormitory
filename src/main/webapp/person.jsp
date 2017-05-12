<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajax list数据传送</title>
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
</head>
<body>
<script type="text/javascript">
    function submit() {
        $.ajax({
            url: '/CheckDormitory/test',
            type: 'POST',
            data: $('form').serialize(),
            /*contentType: "application/json; charset=utf-8",*/
            dataType: 'json',
            success: function (data) {
                alert("成功！");
            },
            error:function () {
                alert("failure");
            }
        });
    }
</script>

<form id="form" modelAttribute="person user2" action="/CheckDormitory/test" method="post">
    <input type="text" name="person.name" value="jobs"/>
    <input type="text" name="person.password" value="55"/><br/>
    <input type="text" name="user2.username" value="jim"/>
    <input type="text" name="user2.password" value="21"/><br/>
    <button type="submit">提交</button>
</form>

</body>
</html>
