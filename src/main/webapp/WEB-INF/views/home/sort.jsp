<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>全部分类</title>
<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath %>basic/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath %>css/sortstyle.css" rel="stylesheet"
	type="text/css" />
<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
</head>

<body>
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
										<li><a href="<%=basePath %>person/index.html">账号管理</a></li>
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
						<a href="<%=basePath %>" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="<%=basePath %>person/index.html" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="<%=basePath %>myCart/${sessionScope.loginEntity.id}" target="_top"><i
							class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a>
					</div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="<%=basePath %>collection.html" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
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



	<!--主体-->

	<div id="nav" class="navfull">
		<div class="area clearfix">
			<div class="category-content" id="guide_2">
				<div class="long-title">
					<span class="all-goods">全部分类</span><span id="meauBack"><a
						href="home.html">返回</a></span>
				</div>
				<div class="category">
					<ul class="category-list" id="js_climit_li">
						<li class="appliance js_toggle relative first selected">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="<%=basePath %>images/cake.png"></i><a
										class="ml-22" title="点心">点心/蛋糕</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">

											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="<%=basePath %>images/TJ.jpg">
												</dl>
											</div>

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

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="<%=basePath %>images/cookies.png"></i><a
										class="ml-22" title="饼干、膨化">饼干/膨化</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="<%=basePath %>images/TJ.jpg">
												</dl>
											</div>
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

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="<%=basePath %>images/meat.png"></i><a
										class="ml-22" title="熟食、肉类">熟食/肉类</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="<%=basePath %>images/TJ.jpg">
												</dl>
											</div>
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

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="<%=basePath %>images/bamboo.png"></i><a
										class="ml-22" title="素食、卤味">素食/卤味</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="<%=basePath %>images/TJ.jpg">
												</dl>
											</div>
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

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="<%=basePath %>images/nut.png"></i><a
										class="ml-22" title="坚果、炒货">坚果/炒货</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="<%=basePath %>images/TJ.jpg">
												</dl>
											</div>
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

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="<%=basePath %>images/candy.png"></i><a
										class="ml-22" title="糖果、蜜饯">糖果/蜜饯</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="<%=basePath %>images/TJ.jpg">
												</dl>
											</div>
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

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="<%=basePath %>images/chocolate.png"></i><a
										class="ml-22" title="巧克力">巧克力</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="<%=basePath %>images/TJ.jpg">
												</dl>
											</div>
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

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="<%=basePath %>images/fish.png"></i><a
										class="ml-22" title="海味、河鲜">海味/河鲜</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="<%=basePath %>images/TJ.jpg">
												</dl>
											</div>
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

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="<%=basePath %>images/tea.png"></i><a
										class="ml-22" title="花茶、果茶">花茶/果茶</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="<%=basePath %>images/TJ.jpg">
												</dl>
											</div>
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

										</div>
									</div>
								</div>
							</div> <b class="arrow"></b>
						</li>
						<li class="appliance js_toggle relative last">
							<div class="category-info">
								<h3 class="category-name b-category-name">
									<i><img src="<%=basePath %>images/package.png"></i><a
										class="ml-22" title="品牌、礼包">品牌/礼包</a>
								</h3>
								<em>&gt;</em>
							</div>
							<div class="menu-item menu-in top">
								<div class="area-in">
									<div class="area-bg">
										<div class="menu-srot">
											<div class="brand-side">
												<dl class="dl-sort">
													<dt>
														<span>为您推荐</span>
													</dt>
													<img src="<%=basePath %>images/TJ.jpg">
												</dl>
											</div>
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
	<script type="text/javascript">
			$(document).ready(function() {
		$("li").click(function() {		
		     	$(this).addClass("selected").siblings().removeClass("selected");
	       })
		})
		</script>
	<div class="clear"></div>
	<!--引导 -->
	<div class="navCir">
		<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
		<li class="active"><a href="sort.html"><i
				class="am-icon-list"></i>分类</a></li>
		<li><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="<%=basePath %>person/index.html"><i
				class="am-icon-user"></i>我的</a></li>
	</div>
</body>

</html>
