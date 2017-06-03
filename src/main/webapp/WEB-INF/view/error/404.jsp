<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    request.setAttribute("basePath", basePath);
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>404Page</title>
    <base href="<%=basePath%>"/>
    <link type="text/css" rel="stylesheet" href="${basePath}css/main.css">
    <link type="text/css" rel="stylesheet" href="${basePath}css/bootstrap.min.css">
</head>
<body>

<div id="container" class="container">
    <h1 id="logo" class="logo" style="position: relative"></h1>
    <div class="info" id="formHeader"><h2>社交应用隐私策略偏好调查</h2>
        <div><br></div>
    </div>

    <ul>
        <li class="one">
            <h3>提交了就可以撤了！</h3>
        </li>
        <li class="one">
            <h3>还没提交的可以点击下面</h3>
        </li>

        <li class="pc-submit">
            <button id="btnSubmit" type="button" class="btn-submit" onclick="location.href='${basePath}genderPage'">请戳这</button>
        </li>
    </ul>
</div>
</body>
</html>
