<%--
  Created by IntelliJ IDEA.
  User: 岳毫柯
  Date: 2024-01-23
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="../../resourceyhk/js/layui-v2.6.8/layui/css/layui.css">
  <script src="../../resourceyhk/js/layui-v2.6.8/layui/layui.js" charset="utf-8"></script>
  <script src="../../resourceyhk/js/addPage.js" defer></script>
  <script src="../../resourceyhk/js/jQuery.js"></script>
  <style>
    *{
      margin: 0;
      padding: 0;
    }
    body{
      width: 100%;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .container{
      width: 70%;
      height: 75%;
      padding: 2vh;
      border: 1px solid black;
    }
    .container .title{
      font-size: 25px;
      font-weight: 600;
      box-sizing: border-box;
      padding: 2vh;
      border-bottom: 2px solid black;
    }
    .container .topSearch{
      box-sizing: border-box;
      padding: 2vh;
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
      <div class="layui-card layui-panel">
        <div class="layui-card-body">
          <div class="container">
            <div class="title">
              <span>添加</span><span>用户信息</span>
            </div>
            <div class="topSearch">
              <div class="textArea">
                <div class="layui-form">
                  <input type="hidden" id="userId" value="0">
                  <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                      <input id="username" type="text" name="username" lay-verify="required"  placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">密码：</label>
                    <div class="layui-input-block">
                      <input id="password" type="password" name="password" lay-verify="required"  placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">确认密码：</label>
                    <div class="layui-input-block">
                      <input id="password2" type="password" name="password" lay-verify="required"  placeholder="请再次输入密码" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">地址：</label>
                    <div class="layui-input-block">
                      <input id="address" type="text" name="address" lay-verify="required"  placeholder="请输入地址" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">电话号码：</label>
                    <div class="layui-input-block">
                      <input id="phonenumber" type="text" name="phonenumber" lay-verify="required"   placeholder="请输入电话号码" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">用户金额：</label>
                    <div class="layui-input-block">
                      <input id="money" type="text" name="money" lay-verify="required"  placeholder="请输入用户金额" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">类型：</label>
                    <div class="layui-input-block">
                      <select name="type" lay-verify="required">
                        <option value="5">身份</option>
                        <option value="0">普通用户</option>
                        <option value="1">商家</option>
                      </select>
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <div class="layui-input-block">
                      <button id="add" class="layui-btn layui-btn-normal">添加</button>
                      <button id="back" class="layui-btn layui-btn-normal">取消</button>
                    </div>
                  </div>
                </div>
              </div>
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
