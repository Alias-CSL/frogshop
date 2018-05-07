<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link href="<%=basePath%>basic/css/demo.css" rel="stylesheet"
	type="text/css" />

<link href="<%=basePath%>css/sustyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
</head>

<body>


	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">
					<a href="#" target="_top" class="h">亲，请登录</a> <a href="#"
						target="_top">免费注册</a>
				</div>
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="#" target="_top" class="h">商城首页</a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
				</div>
			</div>
			<div class="topMessage mini-cart">
				<div class="menu-hd">
					<a id="mc-menu-hd" href="#" target="_top"><i
						class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
						id="J_MiniCartNum" class="h">0</strong></a>
				</div>
			</div>
			<div class="topMessage favorite">
				<div class="menu-hd">
					<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
				</div>
		</ul>
	</div>

	<!--悬浮搜索框-->

	<div class="nav white">
		<div class="logo">
			<img src="<%=basePath%>images/logo.png" />
		</div>
		<div class="logoBig">
			<li><img src="<%=basePath%>images/logobig.png" /></li>
		</div>

		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form>
				<input id="searchInput" name="index_none_header_sysc" type="text"
					placeholder="搜索" autocomplete="off"> <input
					id="ai-topsearch" class="submit" value="搜索" index="1" type="submit">
			</form>
		</div>
	</div>

	<div class="clear"></div>



	<div class="take-delivery">
		<div class="status">
			<h2>订单已提交</h2>
			<div class="successInfo">
				<ul>
					<c:choose>
						<c:when test="${not empty newOrder }">
							<li>待付款金额<em>${newOrder.total }</em></li>
							<div class="user-info">
								<input type="hidden" value="${newOrder.id }" />
								<p>收货人：${newOrder.address.contacterName }</p>
								<p>联系电话：${newOrder.address.phone }</p>
								<p>收货地址：${newOrder.address.province}&nbsp;${newOrder.address.city}&nbsp;${newOrder.address.districts}&nbsp;${newOrder.address.address}</p>
								<p>订单编号：${newOrder.orderNum }</p>
							</div>
							<button type="button" class="am-btn am-btn-danger"
								data-am-modal="{target: '#my-alert'}">立即支付</button>
							<a href="<%=basePath%>index.html" type="button"
								class="am-btn am-btn-danger">继续购物</a>
						</c:when>
					</c:choose>
				</ul>
				<div class="option">
					<span class="info">您可以</span> <a href="<%=basePath%>order.html"
						class="J_MakePoint">查看<span>订单详情</span></a>
				</div>
			</div>
		</div>
	</div>
	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">二维码支付</div>
			<div class="am-modal-bd">
				<img src="<%=basePath%>images/payCode1.jpg" />
			</div>
			<div class="am-modal-footer">
				<a class="" href="<%=basePath%>payBill?orderId=${newOrder.id }">免单支付</a>
			</div>
		</div>
	</div>

	<div class="footer">
		<div class="footer-hd">
			<p>
				<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
					href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
			</p>
		</div>
		<div class="footer-bd">
			<p>
				<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
					href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
			</p>
		</div>
	</div>


</body>
</html>
