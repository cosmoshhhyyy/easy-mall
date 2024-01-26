<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/resourceszjd/css/mystyle.css" media="all">
    <script src="/layui/layui.js" charset="utf-8"></script>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="/resourceszjd/js/jquery.js"></script>
    <script>
        $(function () {
            $("#search").click(function () {
                $("#pageNo").val(1);
                $("#txForm").submit();
            })
            /**
             * 弹出添加弹出层
             */
            layui.use(['layer','form'], function () {
                var layer = layui.layer;
                var form = layui.form;
                var pop;
                $("#addCategorie").click(function () {
                    pop = layer.open({
                        type: 1,
                        area: [500, 250],
                        content: $('#categoriePop')
                    });
                })
                form.on('submit(demo1)', function (data) {
                    $.ajax({
                        url: "/categorie/addCategorie",
                        type: "post",
                        data: data.field,
                        dataType: "text",
                        success: function (text) {
                            if (text == "success") {
                                layer.msg("添加成功");
                                layer.close(pop);
                                $("#txForm").submit();
                            }
                            if(text=="true"){
                                console.log("添加失败，已经存在该类别")
                                layer.msg("添加失败，已经存在该类别")
                                layer.close(pop);

                            }
                        }
                    })
                    //阻止页面跳转  防止同步提交  使用ajax异步提交表单
                    return false;
                });
                $(".delete").click(function () {
                    var cid = $(this).attr("cid");
                    layer.confirm('是否确认删除?', {icon: 3, title:'提示'}, function(index){
                        $.ajax({
                            url: "/categorie/delCategorie",
                            type: "post",
                            data: {
                                cid:cid
                            },
                            dataType: "text",
                            success: function (text) {
                                if (text == "success") {
                                    layer.msg("删除成功");
                                    layer.close(index);
                                    $("#txForm").submit();
                                }
                            }
                        })
                    });
                });
                var pop1;
                $("[modify]").click(function () {
                    var cid = $(this).attr("cid");
                    $.ajax({
                        url: "/categorie/getCategorie",
                        type: "post",
                        data: {
                            cid:cid
                        },
                        dataType: "json",
                        success: function (jsonObj) {
                            $("#cid").val(jsonObj.cid);
                            $("#pcname").val(jsonObj.cname);
                        }
                    })

                    pop1 = layer.open({
                        type: 1,
                        area: [600, 250],
                        content: $('#categoriePop1')
                    });
                })
                form.on('submit(demo2)', function (data) {
                    $.ajax({
                        url: "/categorie/updateCategorie",
                        type: "post",
                        data: data.field,
                        dataType: "text",
                        success: function (text) {
                            if (text == "success") {
                                layer.msg("修改成功");
                                layer.close(pop1);
                                $("#txForm").submit();
                            }
                        }
                    })
                    return false;
                });
            })





            /**
             * 用于控制上一页和下一页的可用的切换
             * @type {jQuery}
             */
            var pageNo = $("#pageNo").val();
            var totalPage = $("#totalPage").val();

            pageNo = parseInt(pageNo);
            totalPage = parseInt(totalPage);

            $("#"+pageNo).addClass("currentPage").siblings().removeClass("currentPage")

            if (pageNo == 1 && pageNo == totalPage) {
                $("#prev").addClass("layui-disabled");
                $("#prev").css("pointer-events", "none");
                $("#next").addClass("layui-disabled");
                $("#next").css("pointer-events", "none");
            }

            if (pageNo == 1 && pageNo < totalPage) {
                $("#prev").addClass("layui-disabled");
                $("#prev").css("pointer-events", "none");
                $("#next").removeClass("layui-disabled");
                $("#next").css("pointer-events", "auto");
            }

            if (pageNo > 1 && pageNo < totalPage) {
                $("#prev").removeClass("layui-disabled");
                $("#prev").css("pointer-events", "auto");
                $("#next").removeClass("layui-disabled");
                $("#next").css("pointer-events", "auto");
            }

            if (pageNo > 1 && pageNo == totalPage) {
                $("#prev").removeClass("layui-disabled");
                $("#prev").css("pointer-events", "auto");
                $("#next").addClass("layui-disabled");
                $("#next").css("pointer-events", "none");
            }
            $("#prev").click(function () {
                $("#pageNo").val(--pageNo);
                $("#txForm").submit();
            })

            $("#next").click(function () {
                $("#pageNo").val(++pageNo);
                var params = $("#txForm").serialize();
                console.log(params);
                $("#txForm").submit();
            })
            $(".pageN").click(function () {
                var pageNo = $(this).html();
                $("#pageNo").val(pageNo);
                $("#txForm").submit();
            })
        })
    </script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">易购商城</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="">个人信息</a></li>
                <li class="layui-nav-item"><a href="/user/list">用户管理</a></li>
                <li class="layui-nav-item"><a href="/categorie/list">类别管理</a></li>
                <li class="layui-nav-item"><a href="/product/list">商品管理</a></li>
                <li class="layui-nav-item"><a href="/html/uorder/uorder.html">订单管理</a></li>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-card layui-panel">
                <div class="layui-card-body">
                    <div class="layuimini-container">
                        <div class="layuimini-main">
                            <form id="txForm" action="/categorie/list" method="post">
                                <fieldset class="table-search-fieldset" style="border:1px solid #EBEBEB;">
                                    <div style="margin: 10px 10px 10px 10px" id="btn">
                                        <form class="layui-form layui-form-pane">
                                            <div class="layui-form-item">
                                                <h1>分类管理</h1>
                                            </div>
                                            <div class="layui-form-item">
                                                <div class="layui-inline">
                                                    <label class="layui-form-label">类别</label>
                                                    <div class="layui-input-inline">
                                                        <input type="text" class="layui-input" value="${mq.cname}" name="cname" id="cname" autocomplete="off">
                                                    </div>
                                                </div>
                                                <div class="layui-inline">
                                                    <button type="button" class="layui-btn layui-btn-primary" data-type="reload" id="search"
                                                            lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索
                                                    </button>
                                                </div>
                                                <div class="layui-inline" style="float:right;">
                                                    <button type="button" id="addCategorie" class="layui-btn layui-btn-primary" data-type="reload">
                                                        <i class="layui-icon layui-icon-add-1"></i> 添 加
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <table class="layui-table"   style="font-size: 15px;width: 45%">
                                        <colgroup>
                                            <col width="150">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th class="hidden-xs-portrait" width="33%">序号</th>
                                            <th class="hidden-xs" width="33%">类别</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${page.list}" var="categorie" varStatus="status">
                                            <tr>
                                                <td class="hidden-xs-portrait">${categorie.cid}</td>
                                                <td class="hidden-xs-portrait">${categorie.cname}</td>
                                                <td >
                                                    <button  class="layui-btn layui-btn-sm" type="button" modify cid="${categorie.cid}" > 修改</button>
                                                    <button type="button"  style="background-color: #31bdec"  class="layui-btn layui-btn-sm delete" cid="${categorie.cid}"> 删除</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <div>
                                        <%--隐藏域--%>
                                        <input type="hidden" id="pageNo" name="pageNo" value="${mq.pageNo}">
                                        <input type="hidden" id="totalPage" value="${page.totalPage}">
                                        <ul style="display: flex;margin-left:20px">
                                            <li ><button id="prev"  class="layui-btn layui-btn-primary layui-btn-sm  layui-border-green">上一页</button></li>
                                            <c:forEach begin="1" end="${page.totalPage}" var="myPageNo">
                                                <li>
                                                    <button id="${myPageNo}" class="layui-btn layui-btn-primary layui-btn-sm  layui-border-green pageN" type="button" <c:if test="${myPageNo == mq.pageNo}"> </c:if> >${myPageNo}</button>
                                                </li>
                                            </c:forEach>
                                            <li ><button id="next" class="layui-btn layui-btn-primary layui-btn-sm  layui-border-green">下一页</button></li>
                                        </ul>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        欢迎来到易购商城管理员后台
    </div>
</div>

</body>
</html>
<div id="categoriePop" style="margin-right: 50px;margin-top: 50px; display: none">
    <form id="addCategorieForm" class="layui-form" method="post" action="/categorie/addCategorie" lay-filter="example">
        <div class="layui-form-item">
            <label class="layui-form-label">商品类别</label>
            <div class="layui-input-block">
                <input type="text" name="cname" style="color: black;" lay-verify="title" autocomplete="off"
                       placeholder="请输入商品类别名" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-normal layui-btn-radius" lay-submit="" lay-filter="demo1">确认添加</button>
            </div>
        </div>
    </form>
</div>
<div id="categoriePop1" style="margin-right: 50px;margin-top: 50px; display: none">
    <form id="updateCategorieForm" class="layui-form" method="post" action="/categorie/updateCategorie" lay-filter="example">
        <input type="hidden" name="cid" id="cid">
        <div class="layui-form-item">
            <label class="layui-form-label">商品类别</label>
            <div class="layui-input-block">
                <input type="text" id="pcname" name="cname" style="color: black;" lay-verify="title" autocomplete="off"
                       placeholder="请输入商品类别名" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-normal layui-btn-radius" lay-submit="" lay-filter="demo2">确认修改</button>
            </div>
        </div>
    </form>
</div>