<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2017/2/27
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
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
    <meta http-equiv="refresh" content="3;url=${basePath}end">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>感谢您</title>
    <base href="<%=basePath%>"/>
    <link type="text/css" rel="stylesheet" href="${basePath}css/main.css">
    <link type="text/css" rel="stylesheet" href="${basePath}css/bootstrap.min.css">
</head>
<body>
<div id="container" class="container">
    <h1 id="logo" class="logo" style="position: relative"></h1>
    <div class="info" id="formHeader"><h2 align="center">社交应用隐私策略偏好调查</h2>
        <div><br></div>
    </div>

    <ul>
        <li class="one">
            <%--<h3 align="center">您是第${sessionScope.profileId}位参与者，非常感谢您！</h3>--%>
                <h3 align="center">您是第${userId}位参与者，非常感谢您！</h3>
        </li>
    </ul>
</div>
</body>
</html>
