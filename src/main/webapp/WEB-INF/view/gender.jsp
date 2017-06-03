<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

    <title>您的性别</title>
    <base href="<%=basePath%>"/>
    <link type="text/css" rel="stylesheet" href="${basePath}css/main.css">
    <link type="text/css" rel="stylesheet" href="${basePath}css/bootstrap.min.css">
    <script src="${basePath}js/main.js" type='text/javascript'></script>
    <style type="text/css">
        #alertMsg {
            display: none;
            width: 400px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 1px 1px 10px black;
            padding: 10px;
            font-size: 12px;
            position: absolute;
            text-align: center;
            background: #fff;
            z-index: 100000;
        }
        #alertMsg_info {
            padding: 2px 15px;
            line-height: 1.6em;
            text-align: left;
        }
        #alertMsg_btn1, #alertMsg_btn2 {
            display: inline-block;
            background: #e3e3e3;
            padding-left: 3px;
            color: #000000;
            font-size: 12px;
            text-decoration: none;
            margin-right: 10px;
            cursor: pointer;
        }
        #alertMsg_btn1 cite, #alertMsg_btn2 cite {
            line-height: 24px;
            display: inline-block;
            padding: 0 13px 0 10px;
            background: #f9f9f9;
            font-style: normal;
        }
    </style>
</head>


<body>
<div id="container" class="container">
    <h1 id="logo" class="logo" style="position: relative"></h1>
    <form class="form" name="myform">
    <div class="info" id="formHeader"><h2 align="center">社交应用隐私策略使用偏好调查</h2>
        <div><br></div>
    </div>
    <ul id="fields" class="fields">
        <li class="one" reqd="1">
            <label class="desc">您的性别
                <span class="req">*</span>
            </label>
            <div class="content">
                    <span>
                        <input id="gender_1" name="sex" type="radio" class="fld" value="1"/>
                        <label for="gender_1">男</label>
                    </span>
                    <span>
                        <input type="radio" name="sex" id="gender_2" class="fld" value="0"/>
                        <label for="gender_2">女</label>
                    </span>
            </div>
        </li>
        <li class="pc-submit">
            <button id="btnSubmit" type="button" class="btn-submit" value="提交"  onclick="sexPost(this)" >提交</button>
        </li>
    </ul>
    </form>
    <script type="text/javascript">
        //添加用户
        function sexPost(myform) {
            var isChecked = false;
            var form = document.forms[0];
            var objects = document.getElementsByName('sex');//得到选项
            for(var j=0;j<objects.length;j++){
                if(objects[j].checked){
                    isChecked = true;
                    break;
                }
            }

            if (isChecked==true){
                form.action = "${basePath}genderProcess";
                form.method = "post";
                form.submit();
                return true;
            }else {
                alertMsg("还没选择性别呐!");
                return false;
            }


        }

        /*  //验证有没有选中
         function checkChoose(myform){
         var isChecked = false;
         var obj = document.getElementsByName('sex');//得到选项
         if(obj.checked){
         isChecked = true;
         }
         if (isChecked==true){
         return true;
         }else {
         alertMsg("还没选择性别呐!");
         return false;
         }
         }*/
    </script>
</div>
</body>
</html>
