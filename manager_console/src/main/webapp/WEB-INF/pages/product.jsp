<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layout 管理界面大布局示例 - Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link href="//cdn.staticfile.org/layui/2.9.4/css/layui.css" rel="stylesheet"> -->
    <!-- <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script> -->
    <link href="../../resourceslpy/css/layui-v2.9.4/layui/css/layui.css"  rel="stylesheet">
    <script src="../../resourceslpy/css/layui-v2.9.4/layui/layui.js"></script>
    <link href="../../resourceslpy/css/product.css">
    <script src="../../resourceslpy/js/product.js" defer></script>
    <script src="../../resourceslpy/js/jquery.js" derfer></script>
    <style>
        .page {
            display: flex;
            list-style: none;
            margin-top: 20px;
            justify-content: center;
        }

        .page li {
            border: 1px solid #22a6b3;
            padding: 4px 6px;
            border-radius: 5px;
            font-size: 13px;
            margin: 1px;
            cursor: pointer;
            color:#484e5c;
            margin: 5px;
        }

        .page .current {
            background: #c7ecee;
        }
    </style>
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
            <blockquote class="layui-elem-quote layui-text" style="display:none;">
                Layui 框体布局内容主体区域
            </blockquote>
            <div class="layui-card layui-panel">
                <div class="layui-card-header" style="display:none;">
                </div>
                <div class="layui-card-body">
                    <div class="box">
                        <div class="layui-form layui-row layui-col-space16">
                            <form class="layui-col-md6" id="form" action="/product/list" method="get">
                                <%--隐藏--%>
                                <input type="hidden" id="pageNo" name="pageNo" value="${mq.pageNo}">
                                <input type="hidden" id="totalPage" value="${page.totalPage}">
                                输入厂家：
                                <hr class="ws-space-10">
                                <input type="text" name="mname" placeholder="如：联想" class="layui-input" value="${mq.mname}">
                                <hr class="ws-space-16">
                                选择商品类型：
                                <hr class="ws-space-10">
                                <select name="cid" id="cid">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${categories}" var="categorie">
                                        <option value="${categorie.cid}" <c:if test="${categorie.cid == mq.cid}">selected</c:if>>${categorie.cname}</option>
                                    </c:forEach>
                                </select>
                                <hr class="ws-space-16">
                                输入商品名称：
                                <hr class="ws-space-10">
                                <input type="text" name="pname" placeholder="如：小新" class="layui-input" value="${mq.pname}">
                                <hr class="ws-space-16">
                                <button type="button" class="layui-btn layui-bg-blue search">搜索</button>
                            </form>

                        </div>
                        <table class="layui-table list">
                            <thead>
                            <tr>
                                <td>id</td>
                                <td>商品名称</td>
                                <td>图片</td>
                                <td>商品描述</td>
                                <td>价格</td>
                                <td>操作</td>
                            </tr>
                            </thead>
                            <tbody class="context">
                            <c:forEach items="${page.list}" var="product" varStatus="status">
                                <tr>
                                    <td>${product.pid}</td>
                                    <td>${product.pname}</td>
                                    <td>${product.pic}</td>
                                    <td>${product.pdesc}</td>
                                    <td>${product.price}</td>
                                    <td>
                                        <%--<input type="button" value="查看" class="layui-btn view" pid="2">--%>
                                        <input type="button" value="删除" class="layui-btn layui-bg-red del" pid="${product.pid}">
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <ul class="page">
                        </ul>
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
