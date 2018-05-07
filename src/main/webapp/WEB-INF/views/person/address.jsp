<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>

<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="<%=basePath %>css/personal.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath %>css/addstyle.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath %>css/jsstyle.css" rel="stylesheet"
	type="text/css" />

</head>

<body>
	<!--头 -->
	<header> <article>
	<div class="mt-logo">
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
						<a href="<%=basePath %>collection.html" target="_top"><i
							class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
					</div>
			</ul>
		</div>

		<!--悬浮搜索框-->

		<div class="nav white">
			<div class="logoBig">
				<li><img src="<%=basePath %>images/logobig.png" /></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form>
					<input id="searchInput" name="index_none_header_sysc" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	</div>
	</article> </header>

	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="#">首页</a></li>
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-address address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<ul id="user-addresses">
						<c:choose>
							<c:when test="${not empty addresses }">
								<c:forEach items="${addresses }" var="address" varStatus="vs">
									<div class="per-border"></div>
									<c:if test="${address.status == 1 }">
										<li class="user-addresslist defaultAddr">
									</c:if>
									<c:if test="${address.status == 2 }">
										<li class="user-addresslist">
									</c:if>
									<input type="hidden" value="${address.id }" name="id"
										id="addressId-input" />
									<div class="address-left">
										<div class="user DefaultAddr">
											<p class="new-tit new-p-re">
												<span class="buy-address-detail"> <span
													class="buy-user new-txt ">${address.contacterName} </span>
													<span class="buy-phone new-txt-rd2">${address.phone }</span>
												</span>
											</p>
										</div>
										<div class="default-address DefaultAddr new-mu_l2a new-p-re">
											<p class="new-mu_l2cw">
												<span class="buy-line-title buy-line-title-type title">收货地址：</span>
												<span class="buy--address-detail"> <span
													class="province">${address.province }</span> <span
													class="city">${address.city }</span> <span class="dist">${address.districts }</span>
													<span class="street">${address.address }</span>
												</span>
											</p>
										</div>
										<c:if test="${address.status == 1 }">
											<ins class="deftip default-address-ins">默认地址</ins>
										</c:if>
										<c:if test="${address.status == 2 }">
											<ins class="deftip default-address-ins hidden">默认地址</ins>
										</c:if>
									</div>
									<div class="address-right">
										<a href="<%=basePath %>person/address.html"> <span
											class="am-icon-angle-right am-icon-lg"></span></a>
									</div>
									<div class="clear"></div>

									<div class="new-addr-btn ">
										<c:if test="${address.status == 2 }">
											<a href="#" class="save-default-btn" class="set-default">设为默认</a>
										</c:if>
										<c:if test="${address.status == 1 }">
											<a href="#" class="hidden save-default-btn"
												class="set-default">设为默认</a>
										</c:if>
										<span class="new-addr-bar hidden">|</span> <a href="#"
											class="edit-address" data-am-modal="{target: '#my-confirm'}"><i
											class="am-icon-edit"></i>编辑</a> <span class="new-addr-bar">|</span>
										<a href="#" class="delete-btn"><i class="am-icon-trash"></i>删除</a>
									</div>

									</li>
								</c:forEach>
							</c:when>
						</c:choose>
					</ul>
					<div class="clear"></div>
					<div id="new-addrss-edit">
						<div class="am-modal-dialog">
							<div class="am-modal-hd">
								<div class="am-cf am-padding">
									<div class="am-fl am-cf">
										<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
											address</small>
									</div>
								</div>
								<hr />
							</div>
							<div class="am-modal-bd am-u-md-12">
								<form method="post" id="form-create"
									class="am-form am-form-horizontal" action="#">
									<input type="hidden" value="${sessionScope.userId }"
										name="userId" />
									<div class="am-form-group">
										<label for="username" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" id="username1" name="contacterName"
												placeholder="收货人" />
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone1" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone1" placeholder="手机号必填" type="text"
												name="phone" />
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label ">所在地</label>
										<div class="am-form-content edit-address">
											<select style="width: 33%;float: left;" name="province"
												class="new-buy-province">

											</select> <select style="width: 33%;float: left;" name="city"
												class="new-buy-city">

											</select> <select style="width: 33%;float: left;" name="districts"
												class="new-buy-dist">

											</select>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content detial-address-div">
											<textarea class="detial-address" rows="3" name="address"
												id="user-intro1" placeholder="输入详细地址"></textarea>
											<small style="float: left;">100字以内写出你的详细地址...</small>
										</div>
									</div>

									<div class="am-form-group theme-poptit">
										<div class="am-u-sm-8 am-u-sm-push-2">
											<div class="am-btn am-btn-danger" id="saveAddress">保存</div>
											<div class="am-btn am-btn-danger  close" data-am-modal-close>取消</div>
										</div>
									</div>
								</form>
							</div>
							<div class="am-modal-footer"></div>
						</div>
					</div>
				</div>

				<div class="clear"></div>

			</div>

			<!--底部-->
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
		</div>

		<aside class="menu">
		<ul>
			<li class="person"><a href="index.html">个人中心</a></li>
			<li class="person"><a href="#">个人资料</a>
				<ul>
					<li><a href="information.html">个人信息</a></li>
					<li><a href="safety.html">安全设置</a></li>
					<li class="active"><a href="address.html">收货地址</a></li>
				</ul></li>
			<li class="person"><a href="#">我的交易</a>
				<ul>
					<li><a href="order.html">订单管理</a></li>
					<li><a href="change.html">退款售后</a></li>
				</ul></li>
			<li class="person"><a href="#">我的资产</a>
				<ul>
					<li><a href="coupon.html">优惠券 </a></li>
					<li><a href="bonus.html">红包</a></li>
					<li><a href="bill.html">账单明细</a></li>
				</ul></li>

			<li class="person"><a href="#">我的小窝</a>
				<ul>
					<li><a href="<%=basePath %>collection.html">收藏</a></li>
					<li><a href="foot.html">足迹</a></li>
					<li><a href="comment.html">评价</a></li>
					<li><a href="news.html">消息</a></li>
				</ul></li>

		</ul>

		</aside>
	</div>
	<div class="clear"></div>
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">
				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">修改地址</strong> / <small>Change
							address</small>
					</div>
				</div>
				<hr />
			</div>
			<div class="am-modal-bd am-u-md-12">
				<form method="post" id="form-change"
					class="am-form am-form-horizontal" action="#">
					<input type="hidden" value="${sessionScope.userId }" name="userId" />
					<input type="hidden" name="id" id="address-id" />
					<div class="am-form-group">
						<label for="user-name" class="am-form-label">收货人</label>
						<div class="am-form-content">
							<input type="text" id="username" placeholder="收货人"
								name="contacterName" />
						</div>
					</div>

					<div class="am-form-group">
						<label for="user-phone" class="am-form-label">手机号码</label>
						<div class="am-form-content">
							<input id="user-phone" placeholder="手机号必填" type="text"
								name="phone" />
						</div>
					</div>

					<div class="am-form-group">
						<label for="user-phone" class="am-form-label ">所在地</label>
						<div class="am-form-content edit-address">
							<select style="width: 33%;float: left;" name="province"
								class="buy-province">

							</select> <select style="width: 33%;float: left;" name="city"
								class="buy-city">

							</select> <select style="width: 33%;float: left;" name="districts"
								class="buy-dist">

							</select>
						</div>
					</div>

					<div class="am-form-group">
						<label for="user-intro" class="am-form-label">详细地址</label>
						<div class="am-form-content detial-address-div">
							<textarea class="detial-address" rows="3" name="address"
								id="user-intro" placeholder="输入详细地址"></textarea>
							<small style="float: left;">100字以内写出你的详细地址...</small>
						</div>
					</div>

					<div class="am-form-group theme-poptit">
						<div class="am-u-sm-8 am-u-sm-push-2">
							<div class="am-btn am-btn-danger" id="changeAddress">保存</div>
							<div class="am-btn am-btn-danger  close" data-am-modal-close>取消</div>
						</div>
					</div>
				</form>
			</div>
			<div class="am-modal-footer"></div>
		</div>
	</div>
	<div class="clear"></div>
	<script src="<%=basePath %>/js/jquery-1.7.2.min.js"></script>
	<script src="<%=basePath %>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/postcall.js"></script>
	<script type="text/javascript" src="<%=basePath %>/js/address.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>/js/addressMessage.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>/js/address-handle.js"></script>
	<script type="text/javascript">
			setBasePath("<%=basePath%>");
			showAddresMessage();
		</script>
</body>

</html>