<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>LarryCMS后台登录</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<!-- load css -->
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>css/login.css" media="all">
</head>
<body>
	<div class="layui-canvs"></div>
	<div class="layui-layout layui-layout-login">
		<h1>
			<strong>Frog Shop管理系统后台</strong> <em>Management System</em>
		</h1>
		<form action="<%=basePath %>loginBackground" method="POST">

			<div class="layui-user-icon larry-login">
				<input type="text" name="principal" placeholder="账号"
					class="login_txtbx" />
			</div>
			<div class="layui-pwd-icon larry-login">
				<input type="password" name="password" placeholder="密码"
					class="login_txtbx" />
			</div>
			<!--    <div class="layui-val-icon larry-login">
 	<div class="layui-code-box">
 		<input type="text" id="code" name="code" placeholder="验证码" maxlength="4" class="login_txtbx">
         <img src="images/verifyimg.png" alt="" class="verifyImg" id="verifyImg" onClick="javascript:this.src='xxx'+Math.random();">
 	</div>
 </div> -->
			<div class="layui-submit larry-login">
				<input type="submit" value="立即登陆" class="submit_btn" />
			</div>
		</form>
		<div class="layui-login-text">
			<p>© 2016-2017 Frog Shop 版权所有</p>
			<p>粤xxxxxx</p>
		</div>
	</div>
	<script type="text/javascript"
		src="<%=basePath %>common/layui/lay/dest/layui.all.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/login.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>jsplug/jparticle.jquery.js"></script>
	<script type="text/javascript">
$(function(){
	$(".layui-canvs").jParticle({
		background: "#141414",
		color: "#E6E6E6"
	});

});
</script>
</body>
</html>