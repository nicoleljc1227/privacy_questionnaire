<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/15
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

    <title>基本信息调查</title>
    <base href="<%=basePath%>"/>
    <link type="text/css" rel="stylesheet" href="${basePath}css/main.css">
    <link type="text/css" rel="stylesheet" href="${basePath}css/bootstrap.min.css">
    <script src="${basePath}js/jquery-1.9.1.min.js" type='text/javascript'></script>
    <%--<script src="${basePath}js/jquery.cityselect.js" type='text/javascript'></script>--%>


</head>
<body>

<div id="container" class="container">
    <h1 id="logo" class="logo" style="position: relative">
        <a></a>
    </h1>
    <form:form action="${basePath}profileProcess" cssClass="form" method="post" commandName="profile">
        <div class="info" id="formHeader"><h2 align="center">社交应用隐私策略使用偏好调查</h2>
            <div><br></div>
        </div>
        <ul id="fields" class="fields">
            <%--y要验证--%>
            <li class=" one"  reqd="1">
                <label class="desc">
                    您是否使用过以下任意一款社交软件? 微信/QQ/人人/Facbook/微博/等其他社交软件
                    <span class="req">*<form:errors path="filed1"/></span>
                </label>
                <div class="content">
                    <span>
                        <form:radiobutton id="filed1_1" path="filed1" value="是"/>
                        <label for="filed1_1">是</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed1_2" path="filed1" value="否"/>
                        <label for="filed1_2">否</label>
                    </span>
                </div>
            </li>
            <li class="one">
                <label class="desc">您使用社交应用的频率是？
                    <span class="req">*<form:errors path="filed2"/></span>
                </label>

                <div class="content">
                    <span>
                        <form:radiobutton id="filed2_1" path="filed2" cssClass="fld" value="0"/>
                        <label for="filed2_1">每天都用</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed2_2" path="filed2" cssClass="fld" value="1"/>
                        <label for="filed2_2">一周一次</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed2_3" path="filed2" cssClass="fld" value="2"/>
                        <label for="filed2_3">几个月一次</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed2_4" path="filed2" cssClass="fld" value="3"/>
                        <label for="filed2_4">一年及以上使用一次</label>
                    </span>
                </div>
            </li>

            <li class="one">
                <label class="desc">您大概多久在社交应用上发布动态(图片/文字/签到)？
                    <span class="req">*<form:errors path="filed3"/></span>
                </label>

                <div class="content">
                    <span>
                        <form:radiobutton id="filed3_1" path="filed3" cssClass="fld" value="0"/>
                        <label for="filed3_1">每天都发</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed3_2" path="filed3" cssClass="fld" value="1"/>
                        <label for="filed3_2">一周发几条</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed3_3" path="filed3" cssClass="fld" value="2"/>
                        <label for="filed3_3">几个月一条</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed3_4" path="filed3" cssClass="fld" value="3"/>
                        <label for="filed3_4">一年发几条</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed3_5" path="filed3" cssClass="fld" value="4"/>
                        <label for="filed3_5">几年发一条动态</label>
                    </span>
                </div>
            </li>

            <%--要验证--%>
            <li  class="leftHalf  one"  reqd="1">
                <label class="desc">您对发布的内容会进行隐私设置么(所有人可见[默认]、仅自己可见、仅好友可见、自定义分组可见)？
                    <span class="req">*<form:errors path="filed4"/></span>
                </label>
                <div class="content">
                    <span>
                        <form:radiobutton id="filed4_1" path="filed4" cssClass="fld" value="1"/>
                        <label for="filed4_1">会设置</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed4_2" path="filed4" cssClass="fld" value="0"/>
                        <label for="filed4_2">不设置,默认所有人可见</label>
                    </span>
                </div>
            </li>

            <%--要验证--%>
            <li class=" one" reqd="1">
                <label class="desc">您对发布的内容通常进行哪些隐私设置？
                    <span class="req">*<form:errors path="filed5"/></span>
                </label>
                <div class="content">
                    <span>
                        <form:radiobutton  id="filed5_1" path="filed5" cssClass="fld" value="0"/>
                        <label for="filed5_1">所有发布的内容都设置为：所有人可见/不设置让系统默认</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed5_2" path="filed5" cssClass="fld" value="1"/>
                        <label for="filed5_2">所有发布的内容都设置为：仅好友可见</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed5_3" path="filed5" cssClass="fld" value="2"/>
                        <label for="filed5_3">只使用：仅好友可见和所有人可见  这2种策略</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed5_4" path="filed5" cssClass="fld" value="3"/>
                        <label for="filed5_4">只使用：仅好友可见和自定义分组可见 这2种策略</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed5_5" path="filed5" cssClass="fld" value="4"/>
                        <label for="filed5_5">只使用：自定义分组可见 这一种策略</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed5_6" path="filed5" cssClass="fld" value="5"/>
                        <label for="filed5_6">只使用：仅自己可见 这一种策略</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed5_7" path="filed5" cssClass="fld" value="6"/>
                        <label for="filed5_7">以上几种策略结合使用</label>
                    </span>
                    <span>
                        <form:radiobutton id="filed5_8" path="filed5" cssClass="fld" value="7"/>
                        <label for="filed5_8">其他社交应用策略</label>
                    </span>
                </div>
            </li>

            <li>
                <div class="noLabelAlign">
                    <label class="desc section"></label>
                    <div class="content section-desc">
                        <p>
                            接下来统计您的基本个人信息，本调查问卷用于学术研究，您真实的个人数据是我们研究的前提！ 在此郑重声明：不会泄露用户隐私数据；谢谢您的支持！
                        </p>
                    </div>
                </div>
            </li>
                <input type="hidden" name="gender" value="1"/>
                <%--这里可以不要了直接设置为1--%>
           <%-- <li class="one" reqd="1">
                <label class="desc">性别
                    <span class="req">*<form:errors path="gender"/></span>
                </label>
                <div class="content">

                    <span>
                        <form:radiobutton id="gender_1" path="gender" cssClass="fld" value="1"/>
                        <label for="gender_1">男</label>
                    </span>
                    <span>
                        <form:radiobutton id="gender_2" path="gender" cssClass="fld" value="0"/>
                        <label for="gender_2">女</label>
                    </span>
                </div>
            </li>--%>

            <%--x需要验证--%>
            <li class="" type="text" reqd="1">
                <label class="desc">年龄
                    <span class="req">*<form:errors path="age"/></span>
                </label>
                <div class="content">
                    <form:input id="age_1" path="age" cssClass="input fld m" maxlength="256" />
                </div>
            </li>
            <li class=" three" type="radio" reqd="1">
                <label class="desc">学历
                    <span class="req">*<form:errors path="education"/></span>
                </label>
                <div class="content">
                    <span>
                        <form:radiobutton id="education_1" path="education" cssClass="fld" value="高中及以下"/>
                            <label for="education_1">高中及以下</label>
                    </span>
                    <span>
                        <form:radiobutton id="education_2" path="education" cssClass="fld" value="本科"/>
                            <label for="education_2">本科</label>
                    </span>
                    <span>
                        <form:radiobutton id="education_3" path="education" cssClass="fld" value="硕士"/>
                            <label for="education_3">硕士</label>
                    </span>
                    <span>
                        <form:radiobutton id="education_4" path="education" cssClass="fld" value="博士及以上"/>
                            <label for="education_4">博士及以上</label>
                    </span>
                    <span>
                        <form:radiobutton id="education_5" path="education" cssClass="fld" value="其它"/>
                            <label for="education_5">其它</label>
                    </span>
                </div>
            </li>

            <li class=" three"  reqd="1">
                <label class="desc">职业
                    <span class="req">*<form:errors path="education"/></span>
                </label>
                <div class="content">
                    <span>
                        <form:radiobutton id="occupation_1" path="occupation" cssClass="fld" value="学生"/>
                        <label for="occupation_1">学生</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_2" path="occupation" cssClass="fld" value="教师"/>
                        <label for="occupation_2">教师</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_3" path="occupation" cssClass="fld" value="医生/护士"/>
                        <label for="occupation_3">医生/护士</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_4" path="occupation" cssClass="fld" value="建筑/设计师"/>
                        <label for="occupation_4">建筑/设计师</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_5" path="occupation" cssClass="fld" value="IT从业者"/>
                        <label for="occupation_5">IT从业者</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_6" path="occupation" cssClass="fld" value="商人"/>
                        <label for="occupation_6">商人</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_7" path="occupation" cssClass="fld" value="工人"/>
                        <label for="occupation_7">工人</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_8" path="occupation" cssClass="fld" value="会计师"/>
                        <label for="occupation_8">会计师</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_9" path="occupation" cssClass="fld" value="经理"/>
                        <label for="occupation_9">经理</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_10" path="occupation" cssClass="fld" value="主持人"/>
                        <label for="occupation_10">主持人</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_11" path="occupation" cssClass="fld" value="销售人员"/>
                        <label for="occupation_11">销售人员</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_12" path="occupation" cssClass="fld" value="公务员/行政人员"/>
                        <label for="occupation_12">公务员/行政人员</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_13" path="occupation" cssClass="fld" value="司机"/>
                        <label for="occupation_13">司机</label>
                    </span>
                    <span>
                        <form:radiobutton id="occupation_14" path="occupation" cssClass="fld" value="其它"/>
                        <label for="occupation_14">其它</label>
                    </span>
                </div>
            </li>
                <li class="" type="address" >
                    <label class="desc">家乡(省市)
                        <span class="req">*<form:errors path="homeTown"/>
                    </label>
                    <div class="content">
                            <%--<input type="text" class="input fld m" name="address"/>--%>
                        <form:input path="homeTown" cssClass="input fld m" />
                    </div>
                   <%-- <div id="citySelect" class="content onelineLeft">
                        <span class="left third clear">
                            <select name="h_province" class="prov xxl province input fld" id="province"></select>
                        </span>
                        <span class="left third">
                            <select name="h_city" class="city xxl city input fld" disabled="disabled" id="city"></select>
                        </span>
                        <span class="left third">
                            <select name="h_county" class="dist xxl zip input fld" disabled="disabled" id="county"></select>
                        </span>
                    </div>--%>
                    <%--<div id="citySelect" class="content onelineLeft">
                        <span class="left third clear">
                           <form:select path="h_province" cssClass="prov xxl province input fl" id="province"/>
                        </span>
                        <span class="left third">
                           <form:select path="h_city" cssClass="city xxl city input fld" id="city"/>
                        </span>
                        <span class="left third">
                           <form:select path="h_county" cssClass="dist xxl zip input fld" id="county"/>
                        </span>
                    </div>--%>
                </li>
                <%--<li class="" type="address" >
                    <label class="desc">现在居住地(省市)
                        <span class="req">*&lt;%&ndash;<form:errors path="address"/>&ndash;%&gt;
                    </label>
                    <div id="citySelect2" class="content onelineLeft">
                        <span class="left third clear">
                            <select name="" class="prov xxl province input fld" &lt;%&ndash;id="province"&ndash;%&gt;></select>
                        </span>
                        <span class="left third">
                            <select class="city xxl city input fld" disabled="disabled" &lt;%&ndash;id="city"&ndash;%&gt;></select>
                        </span>
                        <span class="left third">
                            <select class="dist xxl zip input fld" disabled="disabled" &lt;%&ndash;id="county"&ndash;%&gt;></select>
                        </span>
                    </div>
                </li>--%>
                <li class="" type="address">
                    <label class="desc">现在居住地(省市)
                        <span class="req">*</span>
                    </label>
                    <div class="content">
                        <%--<input type="text" class="input fld m" name="address"/>--%>
                        <form:input path="address" cssClass="input fld m" />
                    </div>
                </li>

            <%--所有的path  都是要和Profile.java中的字段对应--%>

            <li class="" reqd="1">
                <label class="desc">QQ邮箱
                    <span class="req">*</span>
                </label>
                <div class="content">
                    <form:input  path="qqMail" cssClass="input fld m" maxlength="20"/>
                </div>
            </li>

            <li class="pc-submit">
                <button id="btnSubmit" type="submit" class="btn-submit" value="提交">提交</button>
            </li>
        </ul>
    </form:form>
    <script type="text/javascript">
       /* $(function () {
            $("#citySelect").citySelect({
                nodata: "none",
                required: false,
                prov:null,
                city:null,
                dist:null
            });
        });
        $(function () {
            $("#citySelect2").citySelect({
                nodata: "none",
                required: false,
                prov:null,
                city:null,
                dist:null
            });
        });*/
    </script>
</div>
</body>
</html>
