<%--
  Created by IntelliJ IDEA.
  User: xl
  Date: 2017/2/15
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>隐私策略调查</title>
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
    <form name="myform" action="${basePath}mood_question" class="form" method="post" onsubmit="return checkform(this)">
        <div class="info" id="formHeader"><h2 align="center">社交应用隐私策略使用偏好调查</h2>
            <div><br></div>
        </div>
        <ul id="fields" class="fields">
            <li>
                <div class="noLabelAlign">
                    <div class="content section-desc">
                        <p>
                            根据之前的问卷填写情况，您在社交应用上发布的内容都是不设置隐私策略(默认所有人可见)
                            &nbsp;&nbsp;假设以下文字是您准备在您使用的社交应用发布的，请根据自身情况判断以下内容是否可以让所有人可见(可以都选同一个选项)谢谢
                            <span class="req2">
                                <label>注意：中途尽量不要刷新，想象一下一些内容是不是部分人可见？(有的人看了会尴尬等)&nbsp;类似住址电话这类内容是不是越少人可见越好？</label>
                            </span>
                        </p>
                    </div>
                </div>
            </li>
            <c:if test="${empty lists}">
                <li>数据出不来啦!</li>
            </c:if>
            <c:if test="${!empty lists}">
                <c:forEach items="${lists}" var="moodlist" varStatus="i"><%-- i就是题目数--%>
                    <li class=" one"  reqd="1">
                        <label class="desc">
                           ${i.index+1}. 假如您在${moodlist.publishTime}&nbsp;&nbsp;${moodlist.address},发布一条文字:<label style="background-color: #d9edf7">${moodlist.moodContent}</label>
                        </label>
                        <label class="desc">
                            您选择的策略是?
                            <span class="req">*</span>
                        </label>
                        <input type="hidden" name="answerList[${i.index}].userId" value="${uid}">
                        <input type="hidden" name="answerList[${i.index}].questionId" value="${moodlist.mood_id}">
                        <div class="content">
                            <span>
                                <input type="radio" id="answerList[${i.index}].answer_1" name="answerList[${i.index}].answer" value="0"/>
                                <%--<input type="radio" name="answer${moodlist.mood_id}" value="0"/>--%>
                                <label for="answerList[${i.index}].answer_1">所有人可见</label>
                            </span>
                            <span>
                                <input type="radio" id="answerList[${i.index}].answer_2" name="answerList[${i.index}].answer" value="1"/>
                                <label for="answerList[${i.index}].answer_2">仅好友可见(所有出现在好友列表中的人)</label>
                            </span>
                            <span>
                                <input type="radio" id="answerList[${i.index}].answer_3" name="answerList[${i.index}].answer" value="2"/>

                                <label for="answerList[${i.index}].answer_3">仅自己可见</label>
                            </span>
                        </div>
                    </li>

                </c:forEach>
            </c:if>
            <li class="pc-submit">
                <button id="btnSubmit" type="submit" class="btn-submit" value="提交">提交</button>
            </li>
        </ul>
    </form>
</div>
<script type="text/javascript">
    function checkform(myform) {
        //var moodList = ;
        for(var i = 0;i<40;i++){//直接给出每个用户回答60道题
            var isChecked = false;//每一题是否有选项初始为false
            var radioobjs = document.getElementsByName('answerList['+i+'].answer');//得到所有选项集
            for(var j = 0;j<radioobjs.length;j++){
                if(radioobjs[j].checked){
                    isChecked = true;
                    break;
                }
            }
            if (isChecked==false){
                var cur = i;
                cur = cur+1;
                alertMsg("不要偷懒!第"+cur+"条文本还没选呐!");
                return false;
            }
            /* if(radioobjs[0].checked||radioobjs[1].checked||radioobjs[2].checked){
             //移除后面四个选项
             }
             if(radioobjs[3].checked||radioobjs[4].checked||radioobjs[5].checked||radioobjs[6].checked){
             //移除前三个选项
             }*/
        }
        if (isChecked==true){
            return true;
        }
    }
</script>
</body>
</html>
