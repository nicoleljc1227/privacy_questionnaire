<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    request.setAttribute("basePath",basePath);
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>社交网络隐私策略调查</title>
    <base href="<%=basePath%>"/>
    <link type="text/css" rel="stylesheet" href="${basePath}css/main.css">
    <link type="text/css" rel="stylesheet" href="${basePath}css/bootstrap.min.css">
    <%-- <mvc:resources location="/resource/js/" mapping="/js/**"/> 要注意这里的映射 --%>
</head>
<body>

<div id="container" class="container">
    <h1 id="logo" class="logo" style="position: relative"></h1>
    <div class="info" id="formHeader"><h2 align="center">社交应用隐私策略偏好调查</h2>
        <div><br></div>
    </div>

    <ul>
        <li class="one">
            <h3 align="center">认真填写的都是好孩纸</h3>
        </li>
        <li class="one">
            <div align="center">本次问卷大概花费十分钟，大家挑个时间充裕的时候一口气填完,比如饭后填助消化、睡前填助睡眠</div>
            <div align="center">问卷调查内容主要分为两部分：1.基本个人信息;&nbsp;&nbsp;2.隐私策略选择;&nbsp;&nbsp;问卷数据搜集主要用于学术研究！</div>
        </li>
        <li class="pc-submit">
            <button id="btnSubmit" type="submit" class="btn-submit" onclick="location.href='${basePath}genderPage'">开始</button>
        </li>
    </ul>

</div>

</body>
</html>
