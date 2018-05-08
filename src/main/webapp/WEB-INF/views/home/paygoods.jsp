<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>结算页面</title>

<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />

<link href="<%=basePath %>basic/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath %>css/cartstyle.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath %>css/addstyle.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath %>css/jsstyle.css" rel="stylesheet"
	type="text/css" />


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
	<div class="concent">
		<!--地址 -->
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>
				<div class="control">
					<div class="tc-btn createAddr theme-login am-btn am-btn-danger"
						data-am-modal="{target: '#new-addrss-edit'}">使用新地址</div>
				</div>
				<div class="clear"></div>
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
												class="buy-user new-txt ">${address.contacterName} </span> <span
												class="buy-phone new-txt-rd2">${address.phone }</span>
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
			</div>
			<!--物流 -->
			<div class="logistics">
				<h3>选择物流方式</h3>
				<ul class="op_express_delivery_hot">
					<li data-value="yuantong" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position:0px -468px"></i><span
						data-value="圆通快递"></span>圆通</li>
					<li data-value="shentong" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position:0px -1008px"></i><span
						data-value="申通快递"></span>申通</li>
					<li data-value="yunda" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position:0px -576px"></i><span
						data-value="韵达快递"></span>韵达</li>
					<li data-value="zhongtong"
						class="OP_LOG_BTN op_express_delivery_hot_last "><i
						class="c-gap-right" style="background-position:0px -324px"></i><span
						data-value="中通快递"></span>中通</li>
					<li data-value="shunfeng"
						class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i
						class="c-gap-right" style="background-position:0px -180px"></i><span
						data-value="顺丰快递"></span>顺丰</li>
				</ul>
			</div>
			<div class="clear"></div>

			<%-- 	<!--支付方式-->
					<div class="logistics">
						<h3>选择支付方式</h3>
						<ul class="pay-list">
							<li class="pay card"><img src="<%=basePath %>images/wangyin.jpg" />银联<span></span></li>
							<li class="pay qq"><img src="<%=basePath %>images/weizhifu.jpg" />微信<span></span></li>
							<li class="pay taobao"><img src="<%=basePath %>images/zhifubao.jpg" />支付宝<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>
 --%>
			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-oplist">
								<div class="td-inner">配送方式</div>
							</div>
	
						</div>
					</div>
					<div class="clear"></div>
					<c:choose>
						<c:when test="${not empty carts }">
							<c:forEach items="${carts }" var="cart" varStatus="vs">
								<tr id="J_BundleList_s_1911116345_1" class="item-list">
									<div id="J_Bundle_s_1911116345_1_0" class="bundle  bundle-last">
										<div class="bundle-main">
											<ul class="item-content clearfix">
												<div class="pay-phone">
													<li class="td td-item">
														<input type="hidden" value="${cart.id }" id="cartId-input" />
														<input type="hidden" value="${cart.sku.id }" class="skuId" />
														<div class="item-pic">
															<a href="#" class="J_MakePoint"> <img
																src="${cart.sku.picture }" class="itempic J_ItemImg"
																width="80" height="80" /></a>
														</div>
														<div class="item-info">
															<div class="item-basic-info">
																<a href="<%=basePath%>good/introduction/${cart.sku.goodId}"
																	target="_blank" title="${cart.goodName }"
																	class="item-title J_MakePoint" data-point="tbcart.8.11" class="goodName">${cart.goodName }</a>
															</div>
														</div>
													 </li>
													<li class="td td-info">
														<div class="item-props">
															<span class="sku-line">${fn:replace(fn:substring(cart.sku.attributes,1,fn:length(cart.sku.attributes)-1),"\"","")}</span>
														</div>
													</li>
													<li class="td td-price">
														<div class="item-price price-promo-promo">
															<div class="price-content">
																<em class="J_Price price-now">${cart.sku.price }</em>
															</div>
														</div>
													</li>
												</div>
	
												<li class="td td-amount">
													<div class="amount-wrapper ">
														<div class="item-amount ">
															<span class="phone-title">购买数量</span>
															<div class="sl">
																<%-- <input class="min am-btn" name="" type="button" value="-" /> --%>
																<%-- <input class="text_box" name="" type="text"
																	value="${cart.count }" style="width:30px;" /> --%>
																<em class="text_box count">${cart.count }</em> 
																<!-- <input class="add am-btn" name="" type="button" value="+" /> -->
															</div>
														</div>
													</div>
												</li>
												<li class="td td-sum">
													<div class="td-inner">
														<em tabindex="0" class="J_ItemSum number">${cart.sku.price*cart.count }</em>
													</div>
												</li>
												<li class="td td-oplist">
													<div class="td-inner">
														<span class="phone-title">配送方式</span>
														<div class="pay-logis">包邮</div>
													</div>
												</li>
	
											</ul>
											<div class="clear"></div>
										</div>
								</tr>
								<div class="clear"></div>
							</c:forEach>
						</c:when>
					</c:choose>

				</div>
				<div class="clear"></div>
				<div class="pay-total">
					<!--留言-->
					<div class="order-extra">
						<div class="order-user-info">
							<div id="holyshit257" class="memo">
								<label>买家留言：</label> <input type="text"
									title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
									placeholder="选填,建议填写和卖家达成一致的说明"
									class="memo-input J_MakePoint c2c-text-default memo-close">
								<div class="msg hidden J-msg">
									<p class="error">最多输入500个字符</p>
								</div>
							</div>
						</div>

					</div>
					<!--优惠券 -->
					<div class="buy-agio">
						<li class="td td-coupon"><span class="coupon-title">优惠券</span>
							<select data-am-selected>
								<option value="a">
											<div class="c-price">
												<strong>￥8</strong>
											</div>
											<div class="c-limit">
												【消费满95元可用】
											</div>
										</option>
								<option value="b" selected>
											<div class="c-price">
												<strong>￥3</strong>
											</div>
											<div class="c-limit">
												【无使用门槛】
											</div>
										</option>
						</select></li>

						<li class="td td-bonus"><span class="bonus-title">红包</span> <select
							data-am-selected>
								<option value="a">
											<div class="item-info">
												¥50.00<span>元</span>
											</div>
											<div class="item-remainderprice">
												<span>还剩</span>10.40<span>元</span>
											</div>
										</option>
								<option value="b" selected>
											<div class="item-info">
												¥50.00<span>元</span>
											</div>
											<div class="item-remainderprice">
												<span>还剩</span>50.00<span>元</span>
											</div>
										</option>
						</select></li>

					</div>
					<div class="clear"></div>
				</div>
				<!--含运费小计 -->
				<div class="buy-point-discharge ">
					<p class="price g_price ">
						合计（含运费） <span>¥</span><em class="pay-sum">244.00</em>
					</p>
				</div>

				<!--信息 -->
				<!--
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">244.00</em>
											</span>
										</div>

									<div id="holyshit268" class="pay-address">

											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">寄送至：</span>
												<span class="buy--address-detail">
								  				 <span class="province">湖北</span>省
												<span class="city">武汉</span>市
												<span class="dist">洪山</span>区
												<span class="street">雄楚大道666号(中南财经政法大学)</span>
												</span>
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">收货人：</span>
												<span class="buy-address-detail">   
                                        		 <span class="buy-user">艾迪 </span>
												<span class="buy-phone">15871145629</span>
												</span>
											</p>
										</div> 
									</div>-->

				<div id="holyshit269" class="submitOrder">
					<div class="go-btn-wrap">
						<a id="J_Go" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>

	<div class="clear"></div>
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
	</div>
	<div class="clear"></div>
	<div class="am-modal am-modal-confirm" tabindex="-1"
		id="new-addrss-edit">
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
					<input type="hidden" value="${sessionScope.userId }" name="userId" />
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
	<div class="clear"></div>

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
		$(function(){
			var total = 0;
			$.each($("ul.item-content"),function(index,item){
				var sum = parseInt($(this).find("li.td-sum em.J_ItemSum").text());
				total += sum;
			});
			//alert(total);
			$("div.buy-point-discharge p.g_price em.pay-sum").text(total-50-3);
		})
		$("#J_Go").click(function(){
			var userId = $("input#userId-input").val();
			var addressId = $("li.defaultAddr input#addressId-input").val();
			var expressage = 10;
			var expressName = $("ul.op_express_delivery_hot li.selected span").attr("data-value");
			var total = $("div.buy-point-discharge em").text();
			//获取每个tr，然后获取每个商品的skuId、商品名、数量、
			var item_contents = $("ul.item-content");
			//alert(item_contents.length);
			var cartsData = "[";
			var goodNum = 0;
			$.each(item_contents,function(index,item){
			    var cartId  = $(this).find("input#cartId-input").val();
				var skuId  = $(this).find("input.skuId").val();
				var goodName = $(this).find("div.item-basic-info a").attr("title");
				var count = $(this).find("div.item-amount em.count").text();
				var data = '{"id":"'+cartId+'","userId":"'+userId+'","skuId":"'+skuId+'","count":"'+count+'","goodName":"'+goodName+'"},';
				cartsData += data;
				goodNum += parseInt(count);
			});
			var cartsDatas = cartsData.substring(0,cartsData.length-1)+"]";
			var datas = '{"userId":"'+userId+'","goodNum":"'+goodNum+'","addressId":"'+addressId+'","expressage":"'+expressage+'","expressName":"'+expressName+'","total":"'+total+'","carts":'+cartsDatas+'}';
			//alert(datas);
		   if(typeof(expressName) == "undefined") {
				alert("请选择快递");
			}else {
				$.ajax({
					url:"<%=basePath%>createCartOrder",
					type : "POST",
					dataType : "json",
					contentType : 'application/json;charset=utf-8', //设置请求头信息
					data:datas,
					success:function(result){
						if(result.code == 100) {
							window.location.href="<%=basePath%>goToPayBill?orderId="+result.extend.orderId;
						}else{
							
						}
					}
				}); 
			} 
 		});
	</script>
</body>

</html>