<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/15
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <title>基本信息调查</title>
    <base href="<%=basePath%>"/>
    <link type="text/css" rel="stylesheet" href="${basePath}css/main.css">
    <link type="text/css" rel="stylesheet" href="${basePath}css/bootstrap.min.css">
    <script src="${basePath}js/jquery-1.9.1.min.js" type='text/javascript'></script>
    <script src="${basePath}js/jquery.cityselect.js" type='text/javascript'></script>
</head>
<body>

<div id="container" class="container">
    <h1 id="logo" class="logo" style="position: relative">
        <a></a>
    </h1>
    <form action="/profileProcess" class="form" method="post" >
        <div class="info" id="formHeader"><h2 align="center">社交应用隐私策略使用偏好调查</h2>
            <div><br></div>
        </div>
        <ul id="fields" class="fields">
            <%--y要验证--%>
            <li class=" one"  reqd="1">
                <label class="desc">
                    您是否使用过以下任意一款社交软件? 微信/QQ/人人/Facbook/微博/等其他社交软件
                    <span class="req">*<%--<form:errors path="filed1"/>--%></span>
                </label>
                <div class="content">
                    <span>
                        <input type="radio" id="filed1_1" name="filed1" value="是"/>
                        <label for="filed1_1">是</label>
                    </span>
                    <span>
                        <input type="radio" id="filed1_2" name="filed1" value="否"/>
                        <label for="filed1_2">否</label>
                    </span>
                </div>
            </li>
            <li class="one">
                <label class="desc">您使用社交应用的频率是？
                    <span class="req">*<%--<form:errors path="filed2"/>--%></span>
                </label>

                <div class="content">
                    <span>
                        <input type="radio" id="filed2_1" class="fld" name="filed2" value="0"/>
                        <label for="filed2_1">每天都用</label>
                    </span>
                    <span>
                        <input type="radio" id="filed2_2" class="fld" name="filed2" value="1"/>
                        <label for="filed2_2">一周一次</label>
                    </span>
                    <span>
                        <input type="radio" id="filed2_3" class="fld" name="filed2" value="2"/>
                        <label for="filed2_3">几个月一次</label>
                    </span>
                    <span>
                        <input type="radio" id="filed2_4" class="fld" name="filed2" value="3"/>
                        <label for="filed2_4">一年及以上使用一次</label>
                    </span>
                </div>
            </li>

            <li class="one">
                <label class="desc">您大概多久在社交应用上发布动态(图片/文字/签到)？
                    <span class="req">*<%--<form:errors path="filed3"/>--%></span>
                </label>

                <div class="content">
                    <span>
                        <input type="radio" id="filed3_1" class="fld" name="filed3" value="0"/>
                        <label for="filed3_1">每天都发</label>
                    </span>
                    <span>
                        <input type="radio" id="filed3_2" class="fld" name="filed3" value="1"/>
                        <label for="filed3_2">一周发几条</label>
                    </span>
                    <span>
                        <input type="radio"  id="filed3_3" class="fld" name="filed3" value="2"/>
                        <label for="filed3_3">几个月一条</label>
                    </span>
                    <span>
                        <input type="radio" id="filed3_4" class="fld" name="filed3" value="3"/>
                        <label for="filed3_4">一年发几条</label>
                    </span>
                    <span>
                        <input type="radio" id="filed3_5" class="fld" name="filed3" value="4"/>
                        <label for="filed3_5">几年发一条动态</label>
                    </span>
                </div>
            </li>

            <%--要验证--%>
            <li  class="leftHalf  one"  reqd="1">
                <label class="desc">您对发布的内容会进行隐私设置么(所有人可见[默认]、仅自己可见、仅好友可见、自定义分组可见)？
                    <span class="req">*<%--<form:errors path="filed4"/>--%></span>
                </label>
                <div class="content">
                    <span>
                        <input type="radio" id="filed4_1" class="fld" name="filed4" value="1"/>
                        <label for="filed4_1">会设置</label>
                    </span>
                    <span>
                        <input type="radio" id="filed4_2" class="fld" name="filed4" value="0"/>
                        <label for="filed4_2">不设置,默认所有人可见</label>
                    </span>
                </div>
            </li>

            <%--要验证--%>
            <li class=" one" reqd="1">
                <label class="desc">您对发布的内容通常进行哪些隐私设置？
                    <span class="req">*<%--<form:errors path="filed5"/>--%></span>
                </label>
                <div class="content">
                    <span>
                        <input type="radio" id="filed5_1" class="fld" name="filed5" value="0"/>
                        <label for="filed5_1">所有发布的内容都设置为：所有人可见/不设置让系统默认</label>
                    </span>
                    <span>
                        <input type="radio" id="filed5_2" class="fld" name="filed5" value="1"/>
                        <label for="filed5_2">所有发布的内容都设置为：仅好友可见</label>
                    </span>
                    <span>
                        <input type="radio" id="filed5_3" class="fld" name="filed5" value="2"/>
                        <label for="filed5_3">只使用：仅好友可见和所有人可见  这2种策略</label>
                    </span>
                    <span>
                        <input type="radio" id="filed5_4" class="fld" name="filed5" value="3"/>
                        <label for="filed5_4">只使用：仅好友可见和自定义分组可见 这2种策略</label>
                    </span>
                    <span>
                        <input type="radio" id="filed5_5" class="fld" name="filed5" value="4"/>
                        <label for="filed5_5">只使用：自定义分组可见 这一种策略</label>
                    </span>
                    <span>
                        <input type="radio" id="filed5_6" class="fld" name="filed5" value="5"/>
                        <label for="filed5_6">只使用：仅自己可见 这一种策略</label>
                    </span>
                    <span>
                        <input type="radio" id="filed5_7" class="fld" name="filed5" value="6"/>
                        <label for="filed5_7">以上几种策略结合使用</label>
                    </span>
                    <span>
                        <input type="radio" id="filed5_8" class="fld" name="filed5" value="7"/>
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

            <li class="one" reqd="1">
                <label class="desc">性别
                    <span class="req">*<%--<form:errors path="gender"/>--%></span>
                </label>
                <div class="content">

                    <span>

                        <input type="radio"  class="fld" name="gender" value="1"/>
                        <label>男</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="gender" value="0"/>
                        <label>女</label>
                    </span>
                </div>
            </li>

            <%--x需要验证--%>
            <li class="" type="text" reqd="1">
                <label class="desc">年龄
                    <span class="req">*<%--<form:errors path="age"/>--%></span>
                </label>
                <div class="content">
                    <input type="text" name="age" class="input fld m"  max="3"/>
                </div>
            </li>
            <li class=" three" type="radio" reqd="1">
                <label class="desc">学历
                    <span class="req">*<%--<form:errors path="education"/>--%></span>
                </label>
                <div class="content">
                    <span>
                        <input type="radio"  class="fld" name="education" value="高中及以下"/>
                            <label>高中及以下</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="education" value="本科"/>
                            <label>本科</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="education" value="硕士"/>
                            <label>硕士</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="education" value="博士及以上"/>
                            <label>博士及以上</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="education" value="其它"/>
                            <label>其它</label>
                    </span>
                </div>
            </li>

            <li class=" three"  reqd="1">
                <label class="desc">职业
                    <span class="req">*<%--<form:errors path="education"/>--%></span>
                </label>
                <div class="content">
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="学生"/>
                        <label>学生</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="教师"/>
                        <label>教师</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="医生/护士"/>
                        <label>医生/护士</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="建筑/设计师"/>
                        <label>建筑/设计师</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="IT从业者"/>
                        <label>IT从业者</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="商人"/>
                        <label>商人</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="工人"/>
                        <label>工人</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="会计师"/>
                        <label>会计师</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="经理"/>
                        <label>经理</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="主持人"/>
                        <label>主持人</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="销售人员"/>
                        <label>销售人员</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="公务员/行政人员"/>
                        <label>公务员/行政人员</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="司机"/>
                        <label>司机</label>
                    </span>
                    <span>
                        <input type="radio"  class="fld" name="occupation" value="其它"/>
                        <label>其它</label>
                    </span>
                </div>
            </li>
               <%-- <li class="" type="address" >
                    <label class="desc">家乡(省市)
                        <span class="req">*&lt;%&ndash;<form:errors path="homeTown"/>&ndash;%&gt;
                    </label>
                    <div id="citySelect" class="content onelineLeft">
                        <span class="left third clear">
                            <select name="h_province" class="prov xxl province input fld" id="province"></select>
                        </span>
                        <span class="left third">
                           <select name="h_city" class="city xxl city input fld" disabled="disabled" id="city"></select>
                        </span>
                        <span class="left third">
                           <select name="h_county" class="dist xxl zip input fld" disabled="disabled" id="county"></select>
                        </span>
                    </div>
                </li>--%>
                <%--<li class="" type="address" reqd="1">
                    <label class="desc">家乡(省市)
                        <span class="req">*<form:errors path="homeTown"/></span>
                    </label>
                    <div class="content">
                        <input type="text"  class="input fld m" name="homeTown" max="10"/>
                    </div>

                </li>--%>
                <li class="" type="address" reqd="1">
                <label class="desc">现在居住地(省市)
                    <span class="req">*<form:errors path="address"/></span>
                </label>
                <div class="content">
                    <input type="text"  class="input fld m" name="address" max="10"/>
                </div>
            </li>

            <%--所有的path  都是要和Profile.java中的字段对应--%>

            <li class="" reqd="1">
                <label class="desc">QQ邮箱
                    <span class="req">*<%--<form:errors path="qqMail"/>--%></span>
                </label>
                <div class="content">
                    <input type="text" name="qqMail" class="input fld m" />
                </div>
            </li>

            <li class="pc-submit">
                <button id="btnSubmit" type="submit" class="btn-submit" value="提交">提交</button>
            </li>
        </ul>
    </form>
    <%--<script type="text/javascript">
        $(document).ready(function () {

            GetDataList("#livingProvinces", 0, "livingProvinces");

            $("#livingProvinces").change(function () {
                GetDataList("#livingCities", $("#livingProvinces").val(), "livingCities");
            });

            $("#livingCities").change(function () {
                GetDataList("#livingDistricts", $("#livingCities").val(), "livingDistricts");
            });

            $("#btnSubmit").click(function () {
                alert($("#livingProvinces").val() + "--" + $("#livingProvinces option:selected").text());
            });
        });

        function GetDataList(ddlId, id, action, selId) {
            $.getJSON("tools/SelectAjax.ashx", { action: action, id: id, rnd: Math.random() }, function (data) {
                $(ddlId).empty();

                $("<option value=\"-1\">请选择</option>").appendTo($(ddlId));
                $.each(data, function (i, item) {
                    $("<option></option>")
                            .val(item.CityId)
                            .attr("selected", item.CityId == selId)
                            .text(item.CityName)
                            .appendTo($(ddlId));
                });
            });
        }
    </script>--%>
    <script type="text/javascript">
        $(function () {
            $("#citySelect").citySelect({
                nodata: "none",
                required: false,
                prov:null,
                city:null,
                dist:null
            });
        });
    </script>
</div>
</body>
</html>
