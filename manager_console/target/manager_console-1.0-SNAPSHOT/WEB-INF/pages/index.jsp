<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>购物后台系统</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/layui/layui.js" charset="utf-8"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">购物信息查询系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:">
                    <span id="username"></span>
                </a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="http://localhost" class="layui-icon layui-icon-logout"
                           style="margin: 0 10px;">&nbsp;&nbsp;退出</a>
                    </dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li id="student" class="layui-nav-item">
                    <a data-url="fileContent" data-id="2" data-title="学生管理"
                       class="site-demo-active" data-type="tabAdd" href="/categorie/list" target="iframeMain">
                        <i class="layui-icon layui-icon-friends" style="font-size: 20px;margin: 0 10px;"></i>
                        分类管理
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <!-- 内容主体区域 -->
    <div class="layui-tab" lay-filter="demo" lay-allowclose="true" style="margin-left: 200px;">
        <!-- 放置主体页面 -->
        <div class="layui-tab-content">
            <iframe src="" name="iframeMain" width="100%" height="1000px" frameborder="0"></iframe>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        欢迎来到商城管理系统！
    </div>
</div>
<script src="../sources/layui/layui.js"></script>
<script>
    // 挂载layui，添加jquery和form 一会我们会用到
    layui.use('element', function () {
        const $ = layui.jquery;
        const element = layui.element;

        //获取 上一个页面传来的参数
        const identity = localStorage.getItem("identity");
        const username = "欢迎您，" + localStorage.getItem("username");
        $("#username").text(username);
        if (identity === "0") {
            $("#selectCourse").hide();
            $("#individual").hide();
        } else if (identity === "1") {
            $("#student").hide();
            $("#teacher").hide();
            $("#course").hide();
        } else if (identity === "2") {
            $("#student").hide();
        }
        //触发事件
        const active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="http://localhost:8080/maven02/html/' + url + '.html" style="width:100%;height:99%;"></iframe>',
                    id: id //规定好的id
                })
                FrameWH();  //计算ifram层的大小
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            }
        };

        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on('click', function () {
            //所以为了使用jQuery对象的方法，你必须传入jQuery函数$(this)
            const dataid = $(this);
            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在
                let isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") === dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData === false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });

        function FrameWH() {
            const h = $(window).height() - 41 - 10 - 60 - 10 - 44 - 10;
            $("iframe").css("height", h + "px");
        }

        $(window).resize(function () {
            FrameWH();
        })
    });
</script>
</body>
</html>
