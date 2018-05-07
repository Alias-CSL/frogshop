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

<title>首页</title>

<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />

<link href="<%=basePath %>basic/css/demo.css" rel="stylesheet"
	type="text/css" />

<link href="<%=basePath %>css/hmstyle.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath %>css/skin.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>
	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<c:choose>
							<c:when test="${sessionScope.loginFlag}">
								<div class="am-dropdown" data-am-dropdown>
									<button class="am-btn am-round  am-dropdown-toggle"
										data-am-dropdown-toggle
										style="background:none;font-size:15px;">
										<i class="am-icon-user am-icon-fw"></i>${sessionScope.loginEntity.userName}
										<span class="am-icon-caret-down"></span>
									</button>
									<ul class="am-dropdown-content">
										<!--  <li class="am-dropdown-header">标题</li> -->
										<li><a href="<%=basePath%>/logout">账号管理</a></li>
										<li><a href="<%=basePath%>/logout">退出</a></li>
									</ul>
								</div>
								<input type="hidden" value="${sessionScope.loginEntity.id}"
									id="userId-input" />
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
						<a id="mc-menu-hd" href="<%=basePath %>myCart.html" target="_top"><i
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
				<img src="<%=basePath %>images/logo.png" />
			</div>
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
	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="introduction.html"><img
						src="<%=basePath %>images/ad1.jpg" /></a></li>
				<li class="banner2"><a><img
						src="<%=basePath %>images/ad2.jpg" /></a></li>
				<li class="banner3"><a><img
						src="<%=basePath %>images/ad3.jpg" /></a></li>
				<li class="banner4"><a><img
						src="<%=basePath %>images/ad4.jpg" /></a></li>

			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="shopNav">
		<div class="slideall">

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
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>

			<!--侧边导航 -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">

						<div class="category">
							<ul class="category-list" id="js_climit_li">
								<li class="appliance js_toggle relative first">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-24" title="点心">男装&nbsp;/&nbsp;女装&nbsp;/&nbsp;内衣</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="女装">女装</span>
															</dt>
															<dd>
																<a title="羽绒服" href="#"><span>羽绒服</span></a>
															</dd>
															<dd>
																<a title="毛呢外套" href="#"><span>毛呢外套</span></a>
															</dd>
															<dd>
																<a title="毛衣" href="#"><span>毛衣</span></a>
															</dd>
															<dd>
																<a title="针织衫" href="#"><span>针织衫</span></a>
															</dd>
															<dd>
																<a title="棉衣" href="#"><span>棉衣</span></a>
															</dd>
															<dd>
																<a title="连衣裙" href="#"><span>连衣裙</span></a>
															</dd>
															<dd>
																<a title="气场外套" href="#"><span>气场外套</span></a>
															</dd>
															<dd>
																<a title="风衣" href="#"><span>风衣</span></a>
															</dd>
															<dd>
																<a title="裤子" href="#"><span>裤子</span></a>
															</dd>
															<dd>
																<a title="卫衣" href="#"><span>卫衣</span></a>
															</dd>
															<dd>
																<a title="T恤" href="#"><span>T恤</span></a>
															</dd>
															<dd>
																<a title="阔腿裤" href="#"><span>阔腿裤</span></a>
															</dd>
															<dd>
																<a title="衬衫" href="#"><span>衬衫</span></a>
															</dd>
															<dd>
																<a title="牛仔裤" href="#"><span>牛仔裤</span></a>
															</dd>
															<dd>
																<a title="半身裙" href="#"><span>半身裙</span></a>
															</dd>
															<dd>
																<a title="大码女装" href="#"><span>大码女装</span></a>
															</dd>
															<dd>
																<a title="时尚套装" href="#"><span>时尚套装</span></a>
															</dd>
															<dd>
																<a title="西装" href="#"><span>西装</span></a>
															</dd>
															<dd>
																<a title="打底衫" href="#"><span>打底衫</span></a>
															</dd>
															<dd>
																<a title="夹克" href="#"><span>夹克</span></a>
															</dd>
															<dd>
																<a title="皮衣" href="#"><span>皮衣</span></a>
															</dd>
															<dd>
																<a title="皮草" href="#"><span>皮草</span></a>
															</dd>
															<dd>
																<a title="妈妈装" href="#"><span>妈妈装</span></a>
															</dd>
															<dd>
																<a title="夹克" href="#"><span>夹克</span></a>
															</dd>
															<dd>
																<a title="民族舞台" href="#"><span>民族舞台</span></a>
															</dd>
															<dd>
																<a title="腔调" href="#"><span>腔调</span></a>
															</dd>
															<dd>
																<a title="甜美风" href="#"><span>甜美风</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="男装">男装</span>
															</dt>
															<dd>
																<a title="潮牌馆" href="#"><span>潮牌馆</span></a>
															</dd>
															<dd>
																<a title="原创设计" href="#"><span>原创设计</span></a>
															</dd>
															<dd>
																<a title="风格好店" href="#"><span>风格好店</span></a>
															</dd>
															<dd>
																<a title="T恤" href="#"><span>T恤</span></a>
															</dd>
															<dd>
																<a title="衬衫" href="#"><span>衬衫</span></a>
															</dd>
															<dd>
																<a title="夹克" href="#"><span>夹克</span></a>
															</dd>
															<dd>
																<a title="外套" href="<%=basePath %>man/coat/64"><span>外套</span></a>
															</dd>
															<dd>
																<a title="卫衣" href="#"><span>卫衣</span></a>
															</dd>
															<dd>
																<a title="明星网红" href="#"><span>明星网红</span></a>
															</dd>
															<dd>
																<a title="休闲裤" href="#"><span>休闲裤</span></a>
															</dd>
															<dd>
																<a title="牛仔裤" href="#"><span>牛仔裤</span></a>
															</dd>
															<dd>
																<a title="风衣" href="#"><span>风衣</span></a>
															</dd>
															<dd>
																<a title="西装" href="#"><span>西装</span></a>
															</dd>
															<dd>
																<a title="牛仔外套" href="#"><span>牛仔外套</span></a>
															</dd>
															<dd>
																<a title="棒球服" href="#"><span>棒球服</span></a>
															</dd>
															<dd>
																<a title="针织衫" href="#"><span>针织衫</span></a>
															</dd>
															<dd>
																<a title="运动外套" href="#"><span>运动外套</span></a>
															</dd>
															<dd>
																<a title="运动裤" href="#"><span>运动裤</span></a>
															</dd>
															<dd>
																<a title="九分裤" href="#"><span>九分裤</span></a>
															</dd>
															<dd>
																<a title="专柜大牌" href="#"><span>专柜大牌</span></a>
															</dd>
															<dd>
																<a title="POLO衫" href="#"><span>POLO衫</span></a>
															</dd>
															<dd>
																<a title="皮衣" href="#"><span>皮衣</span></a>
															</dd>
															<dd>
																<a title="套装" href="#"><span>套装</span></a>
															</dd>
															<dd>
																<a title="穿搭攻略" href="#"><span>穿搭攻略</span></a>
															</dd>
															<dd>
																<a title="开衫" href="#"><span>开衫</span></a>
															</dd>
															<dd>
																<a title="马甲" href="#"><span>马甲</span></a>
															</dd>
															<dd>
																<a title="呢大衣" href="#"><span>呢大衣</span></a>
															</dd>
														</dl>

													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>内衣</span>
															</dt>
															<dd>
																<a rel="nofollow" title="保暖内衣" target="_blank" href="#"
																	rel="nofollow"><span class="red">保暖内衣</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="丝绒睡衣" target="_blank" href="#"
																	rel="nofollow"><span>丝绒睡衣</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="内裤女" target="_blank" href="#"
																	rel="nofollow"><span class="red">内裤女</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="文胸" target="_blank" href="#"
																	rel="nofollow"><span>文胸</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="内裤男" target="_blank" href="#"
																	rel="nofollow"><span class="red">内裤男</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="长袖睡衣" target="_blank" href="#"
																	rel="nofollow"><span class="red">长袖睡衣</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="保暖内衣" target="_blank" href="#"
																	rel="nofollow"><span class="red">保暖内衣</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="丝绒睡衣" target="_blank" href="#"
																	rel="nofollow"><span>丝绒睡衣</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="内裤女" target="_blank" href="#"
																	rel="nofollow"><span class="red">内裤女</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="文胸" target="_blank" href="#"
																	rel="nofollow"><span>文胸</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="内裤男" target="_blank" href="#"
																	rel="nofollow"><span class="red">内裤男</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="长袖睡衣" target="_blank" href="#"
																	rel="nofollow"><span class="red">长袖睡衣</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-24" title="点心">鞋靴&nbsp;/&nbsp;箱包&nbsp;/&nbsp;配件</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="饼干">饼干</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="薯片">薯片</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">虾条</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="YYKCLOT" target="_blank"
																	href="#" rel="nofollow"><span class="red">YYKCLOT</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="池氏品牌男装" target="_blank"
																	href="#" rel="nofollow"><span class="red">池氏品牌男装</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="男装日志" target="_blank" href="#"
																	rel="nofollow"><span>男装日志</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="索比诺官方旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>索比诺官方旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="onTTno傲徒" target="_blank"
																	href="#" rel="nofollow"><span class="red">onTTno傲徒</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="玛狮路男装旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>玛狮路男装旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="劳威特品牌男装" target="_blank"
																	href="#" rel="nofollow"><span>劳威特品牌男装</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="卡斯郎世家批发城" target="_blank"
																	href="#" rel="nofollow"><span class="red">卡斯郎世家批发城</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-24" title="点心">童装玩具&nbsp;/&nbsp;孕产&nbsp;/&nbsp;用品</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="猪肉脯">猪肉脯</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="牛肉丝">牛肉丝</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="小香肠">小香肠</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="花颜巧语 " target="_blank" href="#"
																	rel="nofollow"><span class="red">花颜巧语 </span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="糖衣小屋" target="_blank" href="#"
																	rel="nofollow"><span>糖衣小屋</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="卡拉迪克  " target="_blank"
																	href="#" rel="nofollow"><span class="red">卡拉迪克
																</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="暖春童话 " target="_blank" href="#"
																	rel="nofollow"><span>暖春童话 </span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="华盛童装批发行 " target="_blank"
																	href="#" rel="nofollow"><span>华盛童装批发行 </span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="奈仕华童装旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>奈仕华童装旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="斑蒂尼BONDYNI" target="_blank"
																	href="#" rel="nofollow"><span class="red">斑蒂尼BONDYNI</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="猫儿朵朵 " target="_blank" href="#"
																	rel="nofollow"><span>猫儿朵朵 </span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="童衣阁" target="_blank" href="#"
																	rel="nofollow"><span class="red">童衣阁</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-24" title="点心">家电&nbsp;/&nbsp;数码&nbsp;/&nbsp;手机</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="豆干">豆干</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="干笋">干笋</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="鸭脖">鸭脖</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="歌芙品牌旗舰店" target="_blank"
																	href="#" rel="nofollow"><span class="red">歌芙品牌旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="爱丝蓝内衣厂" target="_blank"
																	href="#" rel="nofollow"><span>爱丝蓝内衣厂</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="香港优蓓尔防辐射" target="_blank"
																	href="#" rel="nofollow"><span>香港优蓓尔防辐射</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="蓉莉娜内衣批发" target="_blank"
																	href="#" rel="nofollow"><span>蓉莉娜内衣批发</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-24" title="点心">美妆&nbsp;/&nbsp;洗护&nbsp;/&nbsp;保健品</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">坚果</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">锅巴</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="呵呵嘿官方旗舰店" target="_blank"
																	href="#" rel="nofollow"><span class="red">呵呵嘿官方旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#"
																	rel="nofollow"><span>格瑞旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="飞彦大厂直供" target="_blank"
																	href="#" rel="nofollow"><span class="red">飞彦大厂直供</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="红e·艾菲妮" target="_blank"
																	href="#" rel="nofollow"><span>红e·艾菲妮</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="本真旗舰店" target="_blank" href="#"
																	rel="nofollow"><span class="red">本真旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="杭派女装批发网" target="_blank"
																	href="#" rel="nofollow"><span class="red">杭派女装批发网</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="华伊阁旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>华伊阁旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="独家折扣旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>独家折扣旗舰店</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-24" title="点心">珠宝&nbsp;/&nbsp;眼镜&nbsp;/&nbsp;手表</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="糖果">糖果</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蜜饯">蜜饯</span>
															</dt>
															<dd>
																<a title="猕猴桃干" href="#"><span>猕猴桃干</span></a>
															</dd>
															<dd>
																<a title="糖樱桃" href="#"><span>糖樱桃</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="YYKCLOT" target="_blank"
																	href="#" rel="nofollow"><span class="red">YYKCLOT</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="池氏品牌男装" target="_blank"
																	href="#" rel="nofollow"><span class="red">池氏品牌男装</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="男装日志" target="_blank" href="#"
																	rel="nofollow"><span>男装日志</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="索比诺官方旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>索比诺官方旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="onTTno傲徒" target="_blank"
																	href="#" rel="nofollow"><span class="red">onTTno傲徒</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="卡斯郎世家批发城" target="_blank"
																	href="#" rel="nofollow"><span class="red">卡斯郎世家批发城</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-24" title="点心">运动&nbsp;/&nbsp;户外&nbsp;/&nbsp;乐器</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">巧克力</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">果冻</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="花颜巧语 " target="_blank" href="#"
																	rel="nofollow"><span class="red">花颜巧语 </span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="糖衣小屋" target="_blank" href="#"
																	rel="nofollow"><span>糖衣小屋</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="卡拉迪克  " target="_blank"
																	href="#" rel="nofollow"><span class="red">卡拉迪克
																</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="暖春童话 " target="_blank" href="#"
																	rel="nofollow"><span>暖春童话 </span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="华盛童装批发行 " target="_blank"
																	href="#" rel="nofollow"><span>华盛童装批发行 </span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="奈仕华童装旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>奈仕华童装旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="斑蒂尼BONDYNI" target="_blank"
																	href="#" rel="nofollow"><span class="red">斑蒂尼BONDYNI</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="童衣阁" target="_blank" href="#"
																	rel="nofollow"><span class="red">童衣阁</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-24" title="点心">游戏&nbsp;/&nbsp;动漫&nbsp;/&nbsp;影视</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="海带丝">海带丝</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="小鱼干">小鱼干</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="鱿鱼丝">鱿鱼丝</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a rel="nofollow" title="歌芙品牌旗舰店" target="_blank"
																	href="#" rel="nofollow"><span class="red">歌芙品牌旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="爱丝蓝内衣厂" target="_blank"
																	href="#" rel="nofollow"><span>爱丝蓝内衣厂</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="炫点服饰" target="_blank" href="#"
																	rel="nofollow"><span>炫点服饰</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="雪茵美内衣厂批发" target="_blank"
																	href="#" rel="nofollow"><span>雪茵美内衣厂批发</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="金钻夫人" target="_blank" href="#"
																	rel="nofollow"><span>金钻夫人</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="伊美莎内衣" target="_blank" href="#"
																	rel="nofollow"><span class="red">伊美莎内衣</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="粉客内衣旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>粉客内衣旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="泽芳行旗舰店" target="_blank"
																	href="#" rel="nofollow"><span>泽芳行旗舰店</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="彩婷" target="_blank" href="#"
																	rel="nofollow"><span class="red">彩婷</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="黛兰希" target="_blank" href="#"
																	rel="nofollow"><span>黛兰希</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="香港优蓓尔防辐射" target="_blank"
																	href="#" rel="nofollow"><span>香港优蓓尔防辐射</span></a>
															</dd>
															<dd>
																<a rel="nofollow" title="蓉莉娜内衣批发" target="_blank"
																	href="#" rel="nofollow"><span>蓉莉娜内衣批发</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-24" title="点心">美食&nbsp;/&nbsp;生鲜&nbsp;/&nbsp;零食</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">蛋糕</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="蛋糕">点心</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a title="今生只围你" target="_blank" href="#" rel="nofollow"><span>今生只围你</span></a>
															</dd>
															<dd>
																<a title="忆佳人" target="_blank" href="#" rel="nofollow"><span
																	class="red">忆佳人</span></a>
															</dd>
															<dd>
																<a title="斐洱普斯" target="_blank" href="#" rel="nofollow"><span
																	class="red">斐洱普斯</span></a>
															</dd>
															<dd>
																<a title="聚百坊" target="_blank" href="#" rel="nofollow"><span
																	class="red">聚百坊</span></a>
															</dd>
															<dd>
																<a title="朵朵棉织直营店" target="_blank" href="#"
																	rel="nofollow"><span>朵朵棉织直营店</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div> <b class="arrow"></b>
								</li>
								<li class="appliance js_toggle relative last">
									<div class="category-info">
										<h3 class="category-name b-category-name">
											<a class="ml-24" title="点心">鲜花&nbsp;/&nbsp;宠物&nbsp;/&nbsp;农资</a>
										</h3>
										<em>&gt;</em>
									</div>
									<div class="menu-item menu-in top">
										<div class="area-in">
											<div class="area-bg">
												<div class="menu-srot">
													<div class="sort-side">
														<dl class="dl-sort">
															<dt>
																<span title="大包装">大包装</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
														<dl class="dl-sort">
															<dt>
																<span title="两件套">两件套</span>
															</dt>
															<dd>
																<a title="蒸蛋糕" href="#"><span>蒸蛋糕</span></a>
															</dd>
															<dd>
																<a title="脱水蛋糕" href="#"><span>脱水蛋糕</span></a>
															</dd>
															<dd>
																<a title="瑞士卷" href="#"><span>瑞士卷</span></a>
															</dd>
															<dd>
																<a title="软面包" href="#"><span>软面包</span></a>
															</dd>
															<dd>
																<a title="马卡龙" href="#"><span>马卡龙</span></a>
															</dd>
															<dd>
																<a title="千层饼" href="#"><span>千层饼</span></a>
															</dd>
															<dd>
																<a title="甜甜圈" href="#"><span>甜甜圈</span></a>
															</dd>
															<dd>
																<a title="蒸三明治" href="#"><span>蒸三明治</span></a>
															</dd>
															<dd>
																<a title="铜锣烧" href="#"><span>铜锣烧</span></a>
															</dd>
														</dl>
													</div>
													<div class="brand-side">
														<dl class="dl-sort">
															<dt>
																<span>实力商家</span>
															</dt>
															<dd>
																<a title="琳琅鞋业" target="_blank" href="#" rel="nofollow"><span>琳琅鞋业</span></a>
															</dd>
															<dd>
																<a title="宏利鞋业" target="_blank" href="#" rel="nofollow"><span>宏利鞋业</span></a>
															</dd>
															<dd>
																<a title="比爱靓点鞋业" target="_blank" href="#"
																	rel="nofollow"><span>比爱靓点鞋业</span></a>
															</dd>
															<dd>
																<a title="浪人怪怪" target="_blank" href="#" rel="nofollow"><span>浪人怪怪</span></a>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
									</div>

								</li>
							</ul>
						</div>
					</div>

				</div>
			</div>


			<!--轮播-->

			<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>



			<!--小导航 -->
			<div class="am-g am-g-fixed smallnav">
				<div class="am-u-sm-3">
					<a href="sort.html"><img
						src="<%=basePath %>images/navsmall.jpg" />
						<div class="title">商品分类</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="<%=basePath %>images/huismall.jpg" />
						<div class="title">大聚惠</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="<%=basePath %>images/mansmall.jpg" />
						<div class="title">个人中心</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="<%=basePath %>images/moneysmall.jpg" />
						<div class="title">投资理财</div> </a>
				</div>
			</div>

			<!--走马灯 -->

			<div class="marqueen">
				<span class="marqueen-title">商城头条</span>
				<div class="demo">

					<ul>
						<li class="title-first"><a target="_blank" href="#"> <img
								src="<%=basePath %>images/TJ2.jpg"></img> <span>[特惠]</span>商城爆品1分秒
						</a></li>
						<li class="title-first"><a target="_blank" href="#"> <span>[公告]</span>商城与广州市签署战略合作协议
								<img src="<%=basePath %>images/TJ.jpg"></img>
								<p>XXXXXXXXXXXXXXXXXX</p>
						</a></li>

						<div class="mod-vip">
							<div class="m-baseinfo">
								<a href="<%=basePath %>person/index.html"> <img
									src="<%=basePath %>images/getAvatar.do.jpg">
								</a> <em> Hi,<span class="s-name">小叮当</span> <a href="#"><p>点击更多优惠活动</p></a>
								</em>
							</div>
							<div class="member-logout">
								<a class="am-btn-warning btn" href="login.html">登录</a> <a
									class="am-btn-warning btn" href="register.html">注册</a>
							</div>
							<div class="member-login">
								<a href="#"><strong>0</strong>待收货</a> <a href="#"><strong>0</strong>待发货</a>
								<a href="#"><strong>0</strong>待付款</a> <a href="#"><strong>0</strong>待评价</a>
							</div>
							<div class="clear"></div>
						</div>

						<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
						<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
						<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券
								买1送1！</a></li>

					</ul>
					<div class="advTip">
						<img src="<%=basePath %>images/advTip.jpg" />
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
	</div>
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">

			<!--今日推荐 -->

			<div class="am-g am-g-fixed recommendation">
				<div class="clock am-u-sm-3"">
					<img src="<%=basePath %>images/2016.png "></img>
					<p>
						今日<br>推荐
					</p>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>真的有鱼</h3>
						<h4>开年福利篇</h4>
					</div>
					<div class="recommendationMain one">
						<a href="introduction.html"><img
							src="<%=basePath %>images/tj.png "></img></a>
					</div>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>囤货过冬</h3>
						<h4>让爱早回家</h4>
					</div>
					<div class="recommendationMain two">
						<img src="<%=basePath %>images/tj1.png "></img>
					</div>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>浪漫情人节</h3>
						<h4>甜甜蜜蜜</h4>
					</div>
					<div class="recommendationMain three">
						<img src="<%=basePath %>images/tj2.png "></img>
					</div>
				</div>

			</div>
			<div class="clear "></div>
			<!--热门活动 -->

			<div class="am-container activity ">
				<div class="shopTitle ">
					<h4>活动</h4>
					<h3>每期活动 优惠享不停</h3>
					<span class="more "> <a href="# ">全部活动<i
							class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
					</span>
				</div>
				<div class="am-g am-g-fixed ">
					<div class="am-u-sm-3 ">
						<div class="icon-sale one "></div>
						<h4>秒杀</h4>
						<div class="activityMain ">
							<img src="<%=basePath %>images/activity1.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

					<div class="am-u-sm-3 ">
						<div class="icon-sale two "></div>
						<h4>特惠</h4>
						<div class="activityMain ">
							<img src="<%=basePath %>images/activity2.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

					<div class="am-u-sm-3 ">
						<div class="icon-sale three "></div>
						<h4>团购</h4>
						<div class="activityMain ">
							<img src="<%=basePath %>images/activity3.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

					<div class="am-u-sm-3 last ">
						<div class="icon-sale "></div>
						<h4>超值</h4>
						<div class="activityMain ">
							<img src="<%=basePath %>images/activity.jpg "></img>
						</div>
						<div class="info ">
							<h3>春节送礼优选</h3>
						</div>
					</div>

				</div>
			</div>
			<div class="clear "></div>


			<div id="f1">
				<!--甜点-->

				<div class="am-container ">
					<div class="shopTitle ">
						<h4>甜品</h4>
						<h3>每一道甜品都有一个故事</h3>
						<div class="today-brands ">
							<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a> <a
								href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
						</span>
					</div>
				</div>

				<div class="am-g am-g-fixed floodFour">
					<div class="am-u-sm-5 am-u-md-4 text-one list ">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# ">
							<div class="outer-con ">
								<div class="title ">开抢啦！</div>
								<div class="sub-title ">零食大礼包</div>
							</div> <img src="<%=basePath %>images/act1.png " />
						</a>
						<div class="triangle-topright"></div>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two sug">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/2.jpg" /></a>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/1.jpg" /></a>
					</div>


					<div class="am-u-sm-3 am-u-md-2 text-three big">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/5.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three sug">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/3.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/4.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three last big ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/5.jpg" /></a>
					</div>

				</div>
				<div class="clear "></div>
			</div>


			<div id="f2">
				<!--坚果-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>坚果</h4>
						<h3>酥酥脆脆，回味无穷</h3>
						<div class="today-brands ">
							<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
								href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
						</span>
					</div>
				</div>
				<div class="am-g am-g-fixed floodThree ">
					<div class="am-u-sm-4 text-four list">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# "> <img src="<%=basePath %>images/act1.png " />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
							</div>
						</a>
						<div class="triangle-topright"></div>
					</div>
					<div class="am-u-sm-4 text-four">
						<a href="# "> <img src="<%=basePath %>images/6.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-4 text-four sug">
						<a href="# "> <img src="<%=basePath %>images/7.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

					<div class="am-u-sm-6 am-u-md-3 text-five big ">
						<a href="# "> <img src="<%=basePath %>images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five ">
						<a href="# "> <img src="<%=basePath %>images/8.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five sug">
						<a href="# "> <img src="<%=basePath %>images/9.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five big">
						<a href="# "> <img src="<%=basePath %>images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

				</div>

				<div class="clear "></div>
			</div>


			<div id="f3">
				<!--甜点-->

				<div class="am-container ">
					<div class="shopTitle ">
						<h4>甜品</h4>
						<h3>每一道甜品都有一个故事</h3>
						<div class="today-brands ">
							<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a> <a
								href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
						</span>
					</div>
				</div>

				<div class="am-g am-g-fixed floodFour">
					<div class="am-u-sm-5 am-u-md-4 text-one list ">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# ">
							<div class="outer-con ">
								<div class="title ">开抢啦！</div>
								<div class="sub-title ">零食大礼包</div>
							</div> <img src="<%=basePath %>images/act1.png " />
						</a>
						<div class="triangle-topright"></div>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two sug">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/2.jpg" /></a>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/1.jpg" /></a>
					</div>


					<div class="am-u-sm-3 am-u-md-2 text-three big">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/5.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three sug">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/3.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/4.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three last big ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/5.jpg" /></a>
					</div>

				</div>
				<div class="clear "></div>
			</div>


			<div id="f4">
				<!--坚果-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>坚果</h4>
						<h3>酥酥脆脆，回味无穷</h3>
						<div class="today-brands ">
							<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
								href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
						</span>
					</div>
				</div>
				<div class="am-g am-g-fixed floodThree ">
					<div class="am-u-sm-4 text-four list">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# "> <img src="<%=basePath %>images/act1.png " />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
							</div>
						</a>
						<div class="triangle-topright"></div>
					</div>
					<div class="am-u-sm-4 text-four">
						<a href="# "> <img src="<%=basePath %>images/6.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-4 text-four sug">
						<a href="# "> <img src="<%=basePath %>images/7.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

					<div class="am-u-sm-6 am-u-md-3 text-five big ">
						<a href="# "> <img src="<%=basePath %>images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five ">
						<a href="# "> <img src="<%=basePath %>images/8.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five sug">
						<a href="# "> <img src="<%=basePath %>images/9.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five big">
						<a href="# "> <img src="<%=basePath %>images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

				</div>

				<div class="clear "></div>
			</div>


			<div id="f5">
				<!--甜点-->

				<div class="am-container ">
					<div class="shopTitle ">
						<h4>甜品</h4>
						<h3>每一道甜品都有一个故事</h3>
						<div class="today-brands ">
							<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a> <a
								href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
						</span>
					</div>
				</div>

				<div class="am-g am-g-fixed floodFour">
					<div class="am-u-sm-5 am-u-md-4 text-one list ">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# ">
							<div class="outer-con ">
								<div class="title ">开抢啦！</div>
								<div class="sub-title ">零食大礼包</div>
							</div> <img src="<%=basePath %>images/act1.png " />
						</a>
						<div class="triangle-topright"></div>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two sug">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/2.jpg" /></a>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/1.jpg" /></a>
					</div>


					<div class="am-u-sm-3 am-u-md-2 text-three big">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/5.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three sug">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/3.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/4.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three last big ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/5.jpg" /></a>
					</div>

				</div>
				<div class="clear "></div>
			</div>


			<div id="f6">
				<!--坚果-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>坚果</h4>
						<h3>酥酥脆脆，回味无穷</h3>
						<div class="today-brands ">
							<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
								href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
						</span>
					</div>
				</div>
				<div class="am-g am-g-fixed floodThree ">
					<div class="am-u-sm-4 text-four list">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# "> <img src="<%=basePath %>images/act1.png " />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
							</div>
						</a>
						<div class="triangle-topright"></div>
					</div>
					<div class="am-u-sm-4 text-four">
						<a href="# "> <img src="<%=basePath %>images/6.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-4 text-four sug">
						<a href="# "> <img src="<%=basePath %>images/7.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

					<div class="am-u-sm-6 am-u-md-3 text-five big ">
						<a href="# "> <img src="<%=basePath %>images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five ">
						<a href="# "> <img src="<%=basePath %>images/8.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five sug">
						<a href="# "> <img src="<%=basePath %>images/9.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five big">
						<a href="# "> <img src="<%=basePath %>images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

				</div>

				<div class="clear "></div>
			</div>



			<div id="f7">
				<!--甜点-->

				<div class="am-container ">
					<div class="shopTitle ">
						<h4>甜品</h4>
						<h3>每一道甜品都有一个故事</h3>
						<div class="today-brands ">
							<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a> <a
								href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
						</span>
					</div>
				</div>

				<div class="am-g am-g-fixed floodFour">
					<div class="am-u-sm-5 am-u-md-4 text-one list ">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# ">
							<div class="outer-con ">
								<div class="title ">开抢啦！</div>
								<div class="sub-title ">零食大礼包</div>
							</div> <img src="<%=basePath %>images/act1.png " />
						</a>
						<div class="triangle-topright"></div>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two sug">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/2.jpg" /></a>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/1.jpg" /></a>
					</div>


					<div class="am-u-sm-3 am-u-md-2 text-three big">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/5.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three sug">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/3.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/4.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three last big ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/5.jpg" /></a>
					</div>

				</div>
				<div class="clear "></div>
			</div>

			<div id="f8">
				<!--坚果-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>坚果</h4>
						<h3>酥酥脆脆，回味无穷</h3>
						<div class="today-brands ">
							<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
								href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
						</span>
					</div>
				</div>
				<div class="am-g am-g-fixed floodThree ">
					<div class="am-u-sm-4 text-four list">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# "> <img src="<%=basePath %>images/act1.png " />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
							</div>
						</a>
						<div class="triangle-topright"></div>
					</div>
					<div class="am-u-sm-4 text-four">
						<a href="# "> <img src="<%=basePath %>images/6.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-4 text-four sug">
						<a href="# "> <img src="<%=basePath %>images/7.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

					<div class="am-u-sm-6 am-u-md-3 text-five big ">
						<a href="# "> <img src="<%=basePath %>images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five ">
						<a href="# "> <img src="<%=basePath %>images/8.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five sug">
						<a href="# "> <img src="<%=basePath %>images/9.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five big">
						<a href="# "> <img src="<%=basePath %>images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

				</div>

				<div class="clear "></div>
			</div>

			<div id="f9">
				<!--甜点-->

				<div class="am-container ">
					<div class="shopTitle ">
						<h4>甜品</h4>
						<h3>每一道甜品都有一个故事</h3>
						<div class="today-brands ">
							<a href="# ">桂花糕</a> <a href="# ">奶皮酥</a> <a href="# ">栗子糕 </a> <a
								href="# ">马卡龙</a> <a href="# ">铜锣烧</a> <a href="# ">豌豆黄</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
						</span>
					</div>
				</div>

				<div class="am-g am-g-fixed floodFour">
					<div class="am-u-sm-5 am-u-md-4 text-one list ">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# ">
							<div class="outer-con ">
								<div class="title ">开抢啦！</div>
								<div class="sub-title ">零食大礼包</div>
							</div> <img src="<%=basePath %>images/act1.png " />
						</a>
						<div class="triangle-topright"></div>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two sug">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/2.jpg" /></a>
					</div>

					<div class="am-u-sm-7 am-u-md-4 text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/1.jpg" /></a>
					</div>


					<div class="am-u-sm-3 am-u-md-2 text-three big">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/5.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three sug">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/3.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/4.jpg" /></a>
					</div>

					<div class="am-u-sm-3 am-u-md-2 text-three last big ">
						<div class="outer-con ">
							<div class="title ">小优布丁</div>
							<div class="sub-title ">¥4.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="<%=basePath %>images/5.jpg" /></a>
					</div>

				</div>
				<div class="clear "></div>
			</div>


			<div id="f10">
				<!--坚果-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4>坚果</h4>
						<h3>酥酥脆脆，回味无穷</h3>
						<div class="today-brands ">
							<a href="# ">腰果</a> <a href="# ">松子</a> <a href="# ">夏威夷果 </a> <a
								href="# ">碧根果</a> <a href="# ">开心果</a> <a href="# ">核桃仁</a>
						</div>
						<span class="more "> <a href="# ">更多美味<i
								class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
						</span>
					</div>
				</div>
				<div class="am-g am-g-fixed floodThree ">
					<div class="am-u-sm-4 text-four list">
						<div class="word">
							<a class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a> <a
								class="outer" href="#"><span class="inner"><b
									class="text">核桃</b></span></a> <a class="outer" href="#"><span
								class="inner"><b class="text">核桃</b></span></a> <a class="outer"
								href="#"><span class="inner"><b class="text">核桃</b></span></a>
						</div>
						<a href="# "> <img src="<%=basePath %>images/act1.png " />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
							</div>
						</a>
						<div class="triangle-topright"></div>
					</div>
					<div class="am-u-sm-4 text-four">
						<a href="# "> <img src="<%=basePath %>images/6.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-4 text-four sug">
						<a href="# "> <img src="<%=basePath %>images/7.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

					<div class="am-u-sm-6 am-u-md-3 text-five big ">
						<a href="# "> <img src="<%=basePath %>images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five ">
						<a href="# "> <img src="<%=basePath %>images/8.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five sug">
						<a href="# "> <img src="<%=basePath %>images/9.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>
					<div class="am-u-sm-6 am-u-md-3 text-five big">
						<a href="# "> <img src="<%=basePath %>images/10.jpg" />
							<div class="outer-con ">
								<div class="title ">雪之恋和风大福</div>
								<div class="sub-title ">¥13.8</div>
								<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
							</div>
						</a>
					</div>

				</div>

				<div class="clear "></div>
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
						<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a>
						<a href="# ">网站地图</a> <a href="<%=basePath%>backgoundLogin.html">后台登陆</a>
						<em>© 2015-2025 Barathrum.cn 版权所有</em>
					</p>
				</div>
			</div>

		</div>
	</div>
	<!--引导 -->
	<div class="navCir">
		<li class="active"><a href="home.html"><i
				class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="<%=basePath %>person/index.html"><i
				class="am-icon-user"></i>我的</a></li>
	</div>


	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item ">
					<a href="# "> <span class="setting "></span>
					</a>
					<div class="ibar_login_box status_login ">
						<div class="avatar_box ">
							<p class="avatar_imgbox ">
								<img src="<%=basePath %>images/no-img_mid_.jpg " />
							</p>
							<ul class="user_info ">
								<li>用户名sl1903</li>
								<li>级&nbsp;别普通会员</li>
							</ul>
						</div>
						<div class="login_btnbox ">
							<a href="# " class="login_order ">我的订单</a> <a href="# "
								class="login_favorite ">我的收藏</a>
						</div>
						<i class="icon_arrow_white "></i>
					</div>

				</div>
				<div id="shopCart " class="item ">
					<a href="# "> <span class="message "></span>
					</a>
					<p>购物车</p>
					<p class="cart_num ">0</p>
				</div>
				<div id="asset " class="item ">
					<a href="# "> <span class="view "></span>
					</a>
					<div class="mp_tooltip ">
						我的资产 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="foot " class="item ">
					<a href="# "> <span class="zuji "></span>
					</a>
					<div class="mp_tooltip ">
						我的足迹 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="brand " class="item ">
					<a href="#"> <span class="wdsc "><img
							src="<%=basePath %>images/wdsc.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我的收藏 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="broadcast " class="item ">
					<a href="# "> <span class="chongzhi "><img
							src="<%=basePath %>images/chongzhi.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我要充值 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div class="quick_toggle ">
					<li class="qtitem "><a href="# "><span class="kfzx "></span></a>
						<div class="mp_tooltip ">
							客服中心<i class="icon_arrow_right_black "></i>
						</div></li>
					<!--二维码 -->
					<li class="qtitem "><a href="#none "><span
							class="mpbtn_qrcode "></span></a>
						<div class="mp_qrcode " style="display:none; ">
							<img src="<%=basePath %>images/weixin_code_145.png " /><i
								class="icon_arrow_white "></i>
						</div></li>
					<li class="qtitem "><a href="#top " class="return_top "><span
							class="top "></span></a></li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop " class="quick_links_pop hide "></div>

			</div>

		</div>
		<div id="prof-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>我</div>
		</div>
		<div id="shopCart-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>购物车</div>
		</div>
		<div id="asset-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>资产</div>

			<div class="ia-head-list ">
				<a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">优惠券</div>
				</a> <a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">红包</div>
				</a> <a href="# " target="_blank " class="pl money ">
					<div class="num ">￥0</div>
					<div class="text ">余额</div>
				</a>
			</div>

		</div>
		<div id="foot-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>足迹</div>
		</div>
		<div id="brand-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>收藏</div>
		</div>
		<div id="broadcast-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>充值</div>
		</div>
	</div>
	<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
	<script type="text/javascript "
		src="<%=basePath %>basic/js/quick_links.js "></script>
</body>

</html>