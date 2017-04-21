<!DOCTYPE HTML>
<html>
<head>
<title>Add Product Form</title>
</head>
<body>

<div id="global">
<form action="/CheckDormitory/user_add" method="post">
    <fieldset>
        <legend>Add a user</legend>
        <p>
            <label for="username">User Name: </label>
            <input type="text" id="username" name="username"
                tabindex="1">
        </p>
        <p>
            <label for="password">password    : </label>
            <input type="text" id="password"
                name="password" tabindex="2">
        </p>
        <p id="buttons">
            <input id="reset" type="reset" tabindex="4">
            <input id="submit" type="submit" tabindex="5" 
                value="Add User">
        </p>
    </fieldset>
</form>
</div>
</body>
</html>
