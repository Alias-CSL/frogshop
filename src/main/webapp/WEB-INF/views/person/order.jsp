<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单管理</title>

		<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=basePath %>css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath %>css/orstyle.css" rel="stylesheet" type="text/css">



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

			<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" id="doc-my-tabs" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1" id="tab1" class="tab">所有订单</a></li>
								<li><a href="#tab2" id="tab2" class="tab">待付款</a></li>
								<li><a href="#tab3" id="tab3" class="tab">待发货</a></li>
								<li><a href="#tab4" id="tab4" class="tab">待收货</a></li>
								<li><a href="#tab5" id="tab5" class="tab">待评价</a></li>
							</ul>

							<div class="am-tabs-bd">

								<div class="am-tab-panel am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<!-- <div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">1601430</a></div>
													<span>成交时间：2015-12-20</span>
													<em>店铺：小桔灯</em>
												</div>
												<div class="order-content">
													<div class="order-left">
															
													</div>
													
												</div>
											</div> -->
										</div>
										<!-- 显示分页信息 -->
										<div class="am-g">
											<!--分页文字信息  -->
											<div class="am-u-sm-4 am-u-md-4 am-u-sm-centered" id="page_info_area"></div>
											<!-- 分页条信息 -->
											<div class="am-u-sm-8 am-u-md-8 am-u-sm-centered" id="page_nav_area">
											
											</div>
										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab2">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<!-- <div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">1601430</a></div>
													<span>成交时间：2015-12-20</span>
													<em>店铺：小桔灯</em>
												</div>
												<div class="order-content">
													<div class="order-left">
															
													</div>
													
												</div>
											</div> -->
										</div>
										<!-- 显示分页信息 -->
										<div class="am-g">
											<!--分页文字信息  -->
											<div class="am-u-sm-4 am-u-md-4 am-u-sm-centered" id="page_info_area"></div>
											<!-- 分页条信息 -->
											<div class="am-u-sm-8 am-u-md-8 am-u-sm-centered" id="page_nav_area">
											
											</div>
										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<!-- <div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">1601430</a></div>
													<span>成交时间：2015-12-20</span>
													<em>店铺：小桔灯</em>
												</div>
												<div class="order-content">
													<div class="order-left">
															
													</div>
													
												</div>
											</div> -->
										</div>
										<!-- 显示分页信息 -->
										<div class="am-g">
											<!--分页文字信息  -->
											<div class="am-u-sm-4 am-u-md-4 am-u-sm-centered" id="page_info_area"></div>
											<!-- 分页条信息 -->
											<div class="am-u-sm-8 am-u-md-8 am-u-sm-centered" id="page_nav_area">
											
											</div>
										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">1601430</a></div>
													<span>成交时间：2015-12-20</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
							
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：676.00
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																	<p class="order-info"><a href="orderinfo.html">订单详情</a></p>
																	<p class="order-info"><a href="logistics.html">查看物流</a></p>
																	<p class="order-info"><a href="#">延长收货</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	确认收货</div>
															</li>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 显示分页信息 -->
										<div class="am-g">
											<!--分页文字信息  -->
											<div class="am-u-sm-4 am-u-md-4 am-u-sm-centered" id="page_info_area"></div>
											<!-- 分页条信息 -->
											<div class="am-u-sm-8 am-u-md-8 am-u-sm-centered" id="page_nav_area">
												<!--分页 -->
												<!-- <ul class="am-pagination am-pagination-right">
													<li class="am-disabled"><a href="#">&laquo;</a></li>
													<li class="am-active"><a href="#">1</a></li>
													<li><a href="#">2</a></li>
													<li><a href="#">3</a></li>
													<li><a href="#">4</a></li>
													<li><a href="#">5</a></li>
													<li><a href="#">&raquo;</a></li>
												</ul> -->
											</div>
										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<!-- <div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">1601430</a></div>
													<span>成交时间：2015-12-20</span>
													<em>店铺：小桔灯</em>
												</div>
												<div class="order-content">
													<div class="order-left">
															
													</div>
													
												</div>
											</div> -->
										</div>
										<!-- 显示分页信息 -->
										<div class="am-g">
											<!--分页文字信息  -->
											<div class="am-u-sm-4 am-u-md-4 am-u-sm-centered" id="page_info_area"></div>
											<!-- 分页条信息 -->
											<div class="am-u-sm-8 am-u-md-8 am-u-sm-centered" id="page_nav_area">
											
											</div>
										</div>
									</div>
								</div>


							</div>
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
						<a disabled="disabled" href="#">个人资料</a>
						<ul>
							<li> <a href="information.html">个人信息</a></li>
							<li> <a href="safety.html">安全设置</a></li>
							<li> <a href="<%=basePath %>getAllAddresses?userId=${sessionScope.loginEntity.id}">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a disabled="disabled" href="#">我的交易</a>
						<ul>
							<li class="active"><a href="order.html">订单管理</a></li>
							<li> <a href="change.html">退款售后</a></li>
						</ul>
					</li>
					<li class="person">
						<a disabled="disabled" href="#">我的资产</a>
						<ul>
							<li> <a href="coupon.html">优惠券 </a></li>
							<li> <a href="bonus.html">红包</a></li>
							<li> <a href="bill.html">账单明细</a></li>
						</ul>
					</li>

					<li class="person">
						<a disabled="disabled" href="#">我的小窝</a>
						<ul>
							<li> <a href="<%=basePath %>collection.html">收藏</a></li>
							<li> <a href="foot.html">足迹</a></li>
							<li> <a href="comment.html">评价</a></li>
							<li> <a href="news.html">消息</a></li>
						</ul>
					</li>

				</ul>

			</aside>
		</div>
		<div class="clear"></div>
			<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
			  <div class="am-modal-dialog">
			    <div class="am-modal-hd">
					<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">商品评价</strong> / <small>Comment evaluation</small></div>
					</div>
					<hr/>
			    </div>
			    <div class="am-modal-bd am-u-md-12">
			     <form method="post" id="form-comment" class="am-form am-form-horizontal" action="#" >
						<input type="hidden" value="${sessionScope.userId }" name="userId" />
						<input type="hidden" name="orderNum" id="order-id"/>
						<div class="am-form-group">
						<label class="am-form-label">评价等级</label>
							<div style="float:left;">
								<input type="radio"  name="grade" value="1" style="margin-left:80px;"/><img alt="" src="<%=basePath %>images/goodreview.png" style="width:30px;height:35px;"/>
								<input type="radio"  name="grade" value="2" style="margin-left:20px;"/><img alt="" src="<%=basePath %>images/assessment.png" style="width:30px;height:35px;"/>
								<input type="radio"  name="grade" value="3" style="margin-left:20px;" /><img alt="" src="<%=basePath %>images/badreview.png" style="width:30px;height:35px;"/>
							</div>
						</div>

						<div class="am-form-group" >
							<label for="user-intro" class="am-form-label">评价内容</label>
							<div class="am-form-content detial-address-div">
								<textarea class="detial-address" rows="3" name="content" id="user-intro" placeholder="输入详细地址"></textarea>
								<small style="float: left;">300字以内写出你的评价...</small>
							</div>
						</div>
						
						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-8 am-u-sm-push-2">
								<div class="am-btn am-btn-danger" id="comment">提交</div>
								<div class="am-btn am-btn-danger  close" data-am-modal-close>取消</div>
							</div>
						</div>
					</form>
			    </div>
			    <div class="am-modal-footer">
			     
			    </div>
			  </div>
			</div>
			<div class="am-modal am-modal-confirm" tabindex="-1" id="cancel-confirm">
			  <div class="am-modal-dialog">
			    <div class="am-modal-hd">Frog Shop</div>
			    <div class="am-modal-bd">
			      你，确定要取消该订单吗？
			    </div>
			    <div class="am-modal-footer">
			      <span class="am-modal-btn close" data-am-modal-cancel>取消</span>
			      <span class="am-modal-btn" id="cancalOrder-span" data-am-modal-confirm>确定</span>
			    </div>
			  </div>
			</div>
		<script src="<%=basePath %>/js/jquery-1.7.2.min.js"></script>
		<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script src="<%=basePath %>js/page.js"></script>
		<script src="<%=basePath %>js/orderpage.js"></script>
		<script type="text/javascript">
			setBasePath("<%=basePath%>");
			$(function(){
				var userId = $("input#userId-input").val();
				//alert(userId);
				to_page("#tab1","<%=basePath%>getMyOrders",userId,1);
				$("a.tab").click(function(e){
					var tab_id = $(e.target).attr('id');
					var url ,id;
					if(tab_id == "tab1" ){//全部订单
						url="<%=basePath%>getMyOrders";
						id="#tab1";
					}else if(tab_id == "tab2" ){//待付款
						url="<%=basePath%>getOrdersWithoutPaying";
						id="#tab2";
					}else if(tab_id == "tab3" ){//代发货
						url="<%=basePath%>getOrdersWithoutSipping";
						id="#tab3";
					}else if(tab_id == "tab4" ){//待收货
						url="<%=basePath%>getMyOrdersWithoutReceipt";
						id="#tab4";
					}else if(tab_id == "tab5" ){//待评价
						url="<%=basePath%>getMyOrdersWithoutEvaluate";
						id="#tab5";
					}
					to_page(id,url,userId,1);
				});
			})
			
		</script>
	</body>

</html>