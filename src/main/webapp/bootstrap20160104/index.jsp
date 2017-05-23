<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jQuery bootstrap-select</title>
    <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <!-- 3.0 -->
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <%-- <script src="lib/jquery-1.12.2.js"></script>
    <link href="lib/bootstrap.min.css" rel="stylesheet">
    <script src="lib/bootstrap.min.js"></script>--%>

    <script type="text/javascript" src="lib/bootstrap-select.js"></script>
    <link rel="stylesheet" type="text/css" href="lib/bootstrap-select.css">



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
    <!--</optgroup>-->
</select>

<select class="selectpicker bla bla bli" multiple data-live-search="true">
    <option>Mustard</option>
    <option>Ketchup</option>
    <option>Relish</option>
</select>

<div class="form-group">
    <label class="col-sm-3 control-label">客资类型：</label>
    <div class="col-sm-4">
        <select class="selectpicker show-tick form-control" multiple data-live-search="true">
            <option value="0">苹果</option>
            <option value="1">菠萝</option>
            <option value="2">香蕉</option>
            <option value="3">火龙果</option>
            <option value="4">梨子</option>
            <option value="5">草莓</option>
            <option value="6">哈密瓜</option>
            <option value="7">椰子</option>
            <option value="8">猕猴桃</option>
            <option value="9">桃子</option>
        </select>
    </div>
</div>
</body>
</html>
