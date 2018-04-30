<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>物流</title>

		<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath %>css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath %>css/lostyle.css" rel="stylesheet" type="text/css">

	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<c:choose>
										<c:when test="${sessionScope.loginFlag}">
			      							<div class="am-dropdown" data-am-dropdown>
											  <button class="am-btn am-round  am-dropdown-toggle" data-am-dropdown-toggle style="background:none;font-size:15px;"><i class="am-icon-user am-icon-fw"></i>${sessionScope.loginEntity.userName} <span class="am-icon-caret-down"></span></button>
											  <ul class="am-dropdown-content">
											   <!--  <li class="am-dropdown-header">标题</li> -->
											   	<li><a href="<%=basePath%>/logout" >账号管理</a></li>
											    <li><a href="<%=basePath%>/logout" >退出</a></li>
											  </ul>
											</div>
			      							<input type="hidden" value="${sessionScope.loginEntity.id}" id="userId-input"/>
										</c:when>
										<c:otherwise>
											<a href="<%=basePath %>login.html" target="_top">亲，请登录</a>
											<a href="<%=basePath %>register.html" target="_top">免费注册</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="<%=basePath %>collection.html" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
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
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">首页</a></li>
                                <li class="qc"><a href="#">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc"><a href="#">团购</a></li>
                                <li class="qc last"><a href="#">大包装</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="user-logistics">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">物流跟踪</strong> / <small>Logistics&nbsp;History</small></div>
						</div>
						<hr/>
						<div class="package-title">
							<div class="m-item">
								<%-- <div class="item-pic">
									<img src="<%=basePath %>images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
								</div> --%>
								<div class="item-info" >
									<p class="log-status">物流状态:<span>已签收</span> </p>
									<p>承运公司：天天物流</p>
									<p>快递单号：373269427868</p>
									<p>官方电话：4001-888-888</p>
								</div>
							</div>
                         <div class="clear"></div>
						</div>
						<div class="package-status">
							<ul class="status-list">		
								<li class="latest">
									<p class="text">【武汉市】已签收,签收人是青年城签收，感谢使用天天快递，期待再次为您服务</p>
									<div class="time-list">
										<span class="date">2015-12-19</span><span class="week">周六</span><span class="time">15:35:42</span>
									</div>
								</li>
								<li>
									<p class="text">【武汉市】光谷关山分部派件员正在为您派件</p>
									<div class="time-list">
										<span class="date hidden">2015-12-19</span><span class="week hidden">周六</span><span class="time">14:27:28</span>
									</div>
								</li>
								<li>
									<p class="text">【武汉市】快件已到达 光谷关山分部</p>
									<div class="time-list">
										<span class="date hidden">2015-12-19</span><span class="week hidden">周六</span><span class="time">09:25:51</span>
									</div>
								</li>
								<li>
									<p class="text">【武汉市】武汉 已发出</p>
									<div class="time-list">
										<span class="date  hidden">2015-12-19</span><span class="week  hidden">周六</span><span class="time">06:56:03</span>
									</div>
								</li>
								<li>
									<p class="text">【杭州市】杭州集散陆运 已发出</P>
									<div class="time-list">
										<span class="date">2015-12-17</span><span class="week">周四</span><span class="time">22:15:23</span>
									</div>
								</li>
								<li>
									<p class="text">【绍兴市】诸暨 已发出</p>
									<div class="time-list">
										<span class="date hidden">2015-12-17</span><span class="week hidden">周四</span><span class="time">18:55:25</span>
									</div>
								</li>
								<li>
									<p class="text">【绍兴市】天天快递 诸暨收件员 已揽件</span>
										<div class="time-list">
											<span class="date hidden">2015-12-17</span><span class="week hidden">周四</span><span class="time">18:54:25</span>
										</div>
								</li>
								<li>
									<p class="text">商家正通知快递公司揽件</span>
										<div class="time-list">
											<span class="date hidden">2015-12-17</span><span class="week hidden">周四</span><span class="time">15:49:40</span>
										</div>
								</li>
								<li>
									<p class="text">您的包裹已出库</span>
										<div class="time-list">
											<span class="date hidden">2015-12-17</span><span class="week hidden">周四</span><span class="time">15:49:40</span>
										</div>
								</li>
								<li>
									<p class="text">您的订单待配货</p>
									<div class="time-list">
										<span class="date hidden">2015-12-17</span><span class="week hidden">周四</span><span class="time">15:18:15</span>
									</div>
								</li>
								<li class="first">
									<p class="text">您的订单开始处理</p>
									<div class="time-list">
										<span class="date  hidden">2015-12-17</span><span class="week  hidden">周四</span><span class="time">14:27:50</span>
									</div>
								</li>															
								
							</ul>
						</div>
					</div>
				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有</em>
						</p>
					</div>
				</div>
			</div>
			<aside class="menu">
				<ul>
					<li class="person">
						<a href="index.html">个人中心</a>
					</li>
					<li class="person">
						<a href="#">个人资料</a>
						<ul>
							<li> <a href="information.html">个人信息</a></li>
							<li> <a href="safety.html">安全设置</a></li>
							<li> <a href="address.html">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的交易</a>
						<ul>
							<li><a href="order.html">订单管理</a></li>
							<li> <a href="change.html">退款售后</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的资产</a>
						<ul>
							<li> <a href="coupon.html">优惠券 </a></li>
							<li> <a href="bonus.html">红包</a></li>
							<li> <a href="bill.html">账单明细</a></li>
						</ul>
					</li>

					<li class="person">
						<a href="#">我的小窝</a>
						<ul>
							<li> <a href="<%=basePath %>collection.html">收藏</a></li>
							<li> <a href="foot.html">足迹</a></li>
							<li> <a href="comment.html">评价</a></li>
							<li class="active"> <a href="news.html">消息</a></li>
						</ul>
					</li>

				</ul>

			</aside>
		</div>
		
		<script src="<%=basePath %>/js/jquery-1.7.2.min.js"></script>
		<script src="<%=basePath %>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>	
		<script type="text/javascript">
			$(function(){
				var data = '${result}';
				var jsondata = $.parseJSON(data);
				alert(jsondata.expressName);
				var item_info_parent = $("div.item-info");
				item_info_parent.empty();
				var status ;
				if(jsondata.State == 3) {
					status = "已签收";
				}else if(result.State == 2) {
					status = "在途中";
				}else{
					status = "问题件";
				}
				item_info_parent.append($('<p class="log-status">物流状态：<span>'+status+'</span> </p>'))
								.append($('<p>承运公司：'+jsondata.expressName+'</p>'))
								.append($('<p>快递单号：'+jsondata.LogisticCode+'</p>'));
				var status_list_parent= $("div.package-status ul.status-list");
				status_list_parent.empty();
				$.each(jsondata.Traces,function(index,item){
					var li_text = $('<li></li>').append($('<p class="text">'+item.AcceptStation+'</p>'))
									.append($('<div class="time-list"></div>').append($('<span class="date">'+item.AcceptTime+'</span>')));
					status_list_parent.prepend(li_text);
				});
			})
		</script>
	</body>

</html>