<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head lang="en">
<meta charset="UTF-8">
<title>注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet"
	href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.min.css" />
<link href="<%=basePath %>css/dlstyle.css" rel="stylesheet"
	type="text/css">
<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>

	<div class="login-boxtitle">
		<a href="home/demo.html"><img alt=""
			src="<%=basePath %>images/logobig.png" /></a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img src="<%=basePath %>images/big.jpg" />
			</div>
			<div class="login-box">

				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
						<li class="am-active" name="email-panel"><a href="">邮箱注册</a></li>
						<li name="phone-panel"><a href="">手机号注册</a></li>
					</ul>

					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active email-panel">
							<div class="div-message">
								<span class="message" style="color:red;"></span>
							</div>
							<form method="post" action="<%=basePath%>emailRegister">
								<div class="user-name user-data">

									<label for="username"><i class="am-icon-user "></i></label> <input
										type="text" name="username" class="username"
										placeholder="请输入用户名">
								</div>
								<div class="user-email user-data">
									<label for="email"><i class="am-icon-envelope-o"></i></label> <input
										type="email" name="email" class="email" placeholder="请输入邮箱账号">
								</div>
								<div class="user-pass user-data">
									<label for="password"><i class="am-icon-lock"></i></label> <input
										type="password" name="password" class="password"
										placeholder="设置密码">
								</div>
								<div class="user-pass user-data">
									<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
									<input type="password" name="passwordRepeat"
										class="passwordRepeat" placeholder="确认密码">
								</div>
								<div class="user-pass reader-div am-checkbox">
									<input type="checkbox" class="onError reader-me" />
									<p>点击表示您同意商城《服务协议》</p>
								</div>
								<div class="user-pass am-cf">
									<input type="submit" name="" value="注册"
										class="send am-btn am-btn-primary am-btn-sm am-fl am-disabled">
								</div>
							</form>
						</div>

						<div class="am-tab-panel phone-panel">
							<div class="div-message">
								<span class="message" style="color:red;"></span>
							</div>

							<form method="post" action="<%=basePath%>phoneRegister">
								<div class="user-name user-data">
									<label for="username"><i class="am-icon-user "></i></label> <input
										type="text" name="username" class="username"
										placeholder="请输入用户名" />
								</div>
								<div class="user-phone user-data">
									<label for="phone"><i
										class="am-icon-mobile-phone am-icon-sm"></i></label> <input type="tel"
										name="phoneNum" class="phone" placeholder="请输入手机号">
								</div>

								<div class="verification  user-data">
									<label for="code"><i class="am-icon-code-fork"></i></label> <input
										type="tel" name="code" class="verify-code" id="code"
										placeholder="请输入验证码" />
									<button type="button" class="am-btn am-btn-primary"
										id="dyMobileButton" style="font-size: 15px;">获取验证码</button>
								</div>
								<div class="user-pass user-data">
									<label for="password"><i class="am-icon-lock"></i></label> <input
										type="password" name="password" class="password"
										placeholder="设置密码">
								</div>
								<div class="user-pass user-data">
									<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
									<input type="password" name="passwordRepeat"
										class="passwordRepeat" placeholder="确认密码">
								</div>
								<div class="user-pass reader-div am-checkbox">
									<input type="checkbox" class="onError reader-me" />
									<p>点击表示您同意商城《服务协议》</p>
								</div>
								<div class="am-cf">
									<input type="submit" name="" value="注册"
										class="send am-btn am-btn-primary am-btn-sm am-fl am-disabled">
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="footer ">
			<div class="footer-hd ">
				<p>
					<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
						href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
				</p>
			</div>
			<div class="footer-bd ">
				<p>
					<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a
						href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
				</p>
			</div>
		</div>
		<script type="text/javascript" src="<%=basePath%>js/register.js"></script>
</body>

</html>