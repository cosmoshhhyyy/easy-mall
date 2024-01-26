<%--
  Created by IntelliJ IDEA.
  User: 岳毫柯
  Date: 2024-01-23
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="../../resourceyhk/js/layui-v2.6.8/layui/css/layui.css">
  <script src="../../resourceyhk/js/layui-v2.6.8/layui/layui.js" charset="utf-8"></script>
  <script src="../../resourceyhk/js/jQuery.js"></script>
  <script src="https://cdn.staticfile.org/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
  <script src="../../resourceyhk/js/homePage.js" defer></script>
  <style>
    *{
      margin: 0;
      padding: 0;
    }
    body{
      width: 100%;
      height: 150%;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .container{
      border: 2px solid black;
    }
    .container .title{
      font-size: 25px;
      font-weight: 600;
      padding: 2vh;
      box-sizing: border-box;
      border-bottom: 2px solid black;
    }
    .container .topSearch{
      box-sizing: border-box;
      padding: 2vh;
      border-bottom: 2px solid black;
    }
    .container .bottomBody{
      display: flex;
      align-items: center;
      justify-content: center;
    }
    tbody input{
      padding: 2vh;
      font-size: 18px;
      margin-left: 1vw;
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
              用户列表
            </div>
            <div class="topSearch">
              <div class="textArea">
                <div class="layui-form">
                  <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                      <input id="username" type="text" name="username"  placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">地址：</label>
                    <div class="layui-input-block">
                      <input id="address" type="text" name="address"  placeholder="请输入地址" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">电话号码：</label>
                    <div class="layui-input-block">
                      <input id="phonenumber" type="text" name="phonenumber"   placeholder="请输入电话号码" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">用户金额：</label>
                    <div class="layui-input-block">
                      <input id="money" type="text" name="money"  placeholder="请输入大于等于的目标金额" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <label class="layui-form-label">类型：</label>
                    <div class="layui-input-block">
                      <select name="type" lay-verify="required">
                        <option value="5">全部</option>
                        <option value="0">普通用户</option>
                        <option value="1">商家</option>
                      </select>
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <div class="layui-input-block">
                      <button id="search" class="layui-btn">查询</button>
                      <button id="clear" type="reset" class="layui-btn layui-btn-primary">重置</button>
                      <button id="addUser" class="layui-btn layui-btn-normal">添加</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="bottomBody">
              <table class="layui-table">
                <colgroup>
                  <col width="100">
                  <col width="120">
                  <col width="150">
                  <col width="120">
                  <col width="120">
                  <col width="100">
                </colgroup>
                <thead>
                <tr>
                  <th>编号</th>
                  <th>姓名</th>
                  <th>地址</th>
                  <th>电话号码</th>
                  <th>余额</th>
                  <th>类型</th>
                  <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>
                    <button  class="layui-btn layui-btn-danger delete">删除</button>
                    <button  class="layui-btn layui-btn-normal update">修改</button>
                  </td>
                </tr>
                <tr>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>
                    <button  class="layui-btn layui-btn-danger delete">删除</button>
                    <button  class="layui-btn layui-btn-normal update">修改</button>
                  </td>
                </tr>
                <tr>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>
                    <button  class="layui-btn layui-btn-danger delete">删除</button>
                    <button  class="layui-btn layui-btn-normal update">修改</button>
                  </td>
                </tr>
                <tr>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>
                    <button  class="layui-btn layui-btn-danger delete">删除</button>
                    <button  class="layui-btn layui-btn-normal update">修改</button>
                  </td>
                </tr>
                <tr>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>贤心</td>
                  <td>
                    <button  class="layui-btn layui-btn-danger delete">删除</button>
                    <button  class="layui-btn layui-btn-normal update">修改</button>
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
            <div id="page"></div>
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