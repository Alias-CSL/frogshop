<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>购物车页面</title>

<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath%>basic/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/cartstyle.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/optstyle.css" rel="stylesheet"
	type="text/css" />
		<style type="text/css">
			div.J_SelectAll{
				margin-left: 10px;
		</style>
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
			<img src="<%=basePath%>images/logo.png" />
		</div>
		<div class="logoBig">
			<li><img src="<%=basePath%>images/logobig.png" /></li>
		</div>

		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form>
				<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off"/>
				<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit"/>
			</form>
		</div>
	</div>

	<div class="clear"></div>
	<!--购物车 -->
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class=" J_SelectAll">
							<!-- <input class="check-all check" name="select-all" value="true"
								type="checkbox"> -->
						</div>
					</div>
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
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>

			<tr class="item-list">
				<div class="bundle  bundle-last ">
					<div class="bundle-main">
						<c:choose>
							<c:when test="${not empty carts}">
								<c:forEach items="${carts}" var="cart" varStatus="vs">
									<ul class="item-content clearfix">
										<li class="td td-chk">
											<div class="cart-checkbox cart-checkbox1">
												<input class="check" name="items" data-cartId="${cart.id }" data-skuId="${cart.sku.id }" type="checkbox"/> 
												<label for="J_CheckBox_170037950254"></label>
											</div>
										</li>
										<li class="td td-item">
											<div class="item-pic">
												<a href="<%=basePath %>good/introduction/${cart.sku.goodId}" target="_blank" data-title="${cart.goodName }" class="J_MakePoint" data-point="tbcart.8.12"> 
													<img src="${cart.sku.picture }" class="itempic J_ItemImg" width="80" height="80"/>
												</a>
											</div>
											<div class="item-info">
												<div class="item-basic-info">
													<a  href="<%=basePath %>good/introduction/${cart.sku.goodId}" target="_blank" title="${cart.goodName }"
														class="item-title J_MakePoint" data-point="tbcart.8.11">${cart.goodName }</a>
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
													<div class="price-line">
														<em class="price-original">${cart.sku.originalPrice}</em>
													</div>
													<div class="price-line">
														<em class="J_Price price-now" tabindex="0">${cart.sku.price}</em>
													</div>
												</div>
											</div>
										</li>
										<li class="td td-amount">
											<div class="amount-wrapper ">
												<div class="item-amount ">
													<div class="sl">
														<input class="min am-btn" name="" type="button" value="-" />
														<input class="text_box" name="" type="text" value="${cart.count}"
															style="width:30px;" /> <input class="add am-btn" name=""
															type="button" value="+" />
													</div>
												</div>
											</div>
										</li>
										<li class="td td-sum">
											<div class="td-inner">
												<em tabindex="0" class="J_ItemSum number">${cart.count * cart.sku.price }</em>
											</div>
										</li>
										<li class="td td-op">
											<div class="td-inner">
												<a title="移入收藏夹" class="btn-fav" href="#"> 移入收藏夹</a> <a
													href="javascript:;" class="delete"> 删除</a>
											</div>
										</li>
									</ul>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>
			</tr>
		</div>
		<div class="clear"></div>

		<div class="float-bar-wrapper">
			<div id="J_SelectAll2" class="select-all J_SelectAll">
				<div class="cart-checkbox">
					<input class="check-all check" id="J_SelectAllCbx2"
						name="select-all" value="true" type="checkbox"> <label
						for="J_SelectAllCbx2"></label>
				</div>
				<span>全选</span>
			</div>
			<div class="operations">
				<a href="#" hidefocus="true" class="deleteAll">删除</a> <a href="#"
					hidefocus="true" class="J_BatchFav">移入收藏夹</a>
			</div>
			<div class="float-bar-right">
				<div class="amount-sum">
					<span class="txt">已选商品</span> <em id="J_SelectedItemsCount">0</em><span
						class="txt">件</span>
					<div class="arrow-box">
						<span class="selected-items-arrow"></span> <span class="arrow"></span>
					</div>
				</div>
				<div class="price-sum">
					<span class="txt">合计:</span> <strong class="price">¥<em
						id="J_Total">0.00</em></strong>
				</div>
				<div class="btn-area">
					<a href="javascript:;" id="J_Go" class="submit-btn submit-btn-disabled"
						aria-label="请注意如果没有选择宝贝，将无法结算"> <span>结&nbsp;算</span></a>
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
	</div>
	<!-- 模态框 -->
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">Frog Shop</div>
	    <div class="am-modal-bd">
	      你，确定要删除这条记录吗？
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
	    </div>
	  </div>
	</div>
	<!--引导 -->
	<div class="navCir">
		<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li class="active"><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="<%=basePath%>person/index.html"><i
				class="am-icon-user"></i>我的</a></li>
	</div>
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath %>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/page.js"></script>
	<script type="text/javascript">
		$("li.td-op a.delete").click(function(){
			//var parent = $(this).parents("ul");
			 $('#my-confirm').modal({
		        relatedTarget: this,
		        onConfirm: function(options) {
		        	var parent = $(this.relatedTarget).parents("ul");
				    var cartId = $(this.relatedTarget).parents("ul").find("li div.cart-checkbox input.check").attr("data-cartid");
				    $.ajax({
				    	url:"<%=basePath%>deleteCart",
				    	type:"POST",
				    	data:"cartId="+cartId,
				    	success:function(result) {
				    		if(result.code == 100) {
				    			parent.remove();
				    		}
				    	}
				    });         
		        },
		        // closeOnConfirm: false,
		        onCancel: function() {
		          //alert('算求，不弄了');
		        }
		      });
		});
		$("#J_Go").click(function(){
			var userId = $("#userId-input").val();
			//alert(userId);
			var childChecked = $('div.cart-checkbox1 input[type="checkbox"]:checked');
			var cartIds = "";
			$.each(childChecked,function(index,item){
				var parent = $(this).parents("ul");
				var cartId = parent.find("li div.cart-checkbox input.check").attr("data-cartid");
				//alert(sum);
				cartIds = cartIds+cartId+",";
			});
			var data = cartIds.substring(0,cartIds.length-1);
			window.location.href="<%=basePath%>goToPay?cartIds="+data+"&userId="+userId;
			
		}); 
		$(".add").click(function(){
          var t=$(this).siblings('input.text_box');
         t.val(parseInt(t.val())+1);
         var num = parseInt(t.val());
         // alert(num);
         var item_content  = $(this).parents("ul");
         var price = item_content.find("li.td-price em.price-now").text();
         //alert(price);
         item_content.find("li.td-sum em").text(price*num);
         var ul_parent = $(this).parents("ul");
          var cartId = ul_parent.find("li div.cart-checkbox input.check").attr("data-cartid");
         sendAjax(cartId,num);
         countSum();
        });
      $(".min").click(function(){
		var t=$(this).siblings('input.text_box');
         t.val(parseInt(t.val())-1);
         if(parseInt(t.val())< 1){
          t.val(1);
          }
         var num = parseInt(t.val());
         //alert(num);
        var item_content  = $(this).parents("ul");
          var price = item_content.find("li.td-price em.price-now").text();
         item_content.find("li.td-sum em").text(price*num);
         var ul_parent = $(this).parents("ul");
         var cartId = ul_parent.find("li div.cart-checkbox input.check").attr("data-cartid");
         sendAjax(cartId,num);
         countSum();
       });
       //发送ajax更改商品选购数量
       function sendAjax(cartId,count) {
       	$.ajax({
       		url:"<%=basePath%>changeGoodNum",
       		data:"cartId="+cartId+"&count="+count,
       		type:"POST",
       		success:function(result) {
       			if(result.code == 100) {
       				alert("修改成功");
       			}
       		}
       	});
       }
       //计算选中商品总数与总额
		function countSum() {
			var childChecked = $('div.cart-checkbox1 input[type="checkbox"]:checked');
			var totalSum = 0;
			//alert(childChecked.length);
			$.each(childChecked,function(index,item){
				var parent = $(this).parents("ul");
				var sum = parent.find("li.td-sum em").text();
				//alert(sum);
				totalSum += parseInt(sum);
			});
			//alert(totalSum);
			$("em#J_Total").text(totalSum);
			$("em#J_SelectedItemsCount").text(childChecked.length);
		}
		//判断ckeckbox是否全部被选中了
		$("div.cart-checkbox1 input[type='checkbox']").click(function(){

			var child = $("div.cart-checkbox1 input[type='checkbox']");
			var childChecked = $('div.cart-checkbox1 input[type="checkbox"]:checked');
			if (childChecked.length == child.length) {
					$("input[name='select-all']").attr("checked", true);
				} else {
					$("input[name='select-all']").attr("checked", false);
				}
				countSum();
		});
		//全选按钮
		$("input[name='select-all']").change(function(data){
			var value = $(this).prop("checked");
			//alert(value);
			var child = $('div.cart-checkbox1 input[type="checkbox"]');
			//alert(child.length);
			child.each(function(index, item) {
				$(this).attr("checked",value);
			}); 
			countSum();
		});
/* 		$(function() {
			var userId = "${sessionScope.loginEntity.id}";
			alert(userId);
			//发送ajax获取购物车商品信息
			to_page()
	
		})
		function to_page(p, url, userId, pageNum) {
	
			//alert(data);
			$.ajax({
				url : basePath + "getGoods",
				data : data,
				type : "GET",
				success : function(result) {
					//1、解析并显示购物车商品数据
					build_cartGood_info(p, result);
					//2、解析并显示分页信息
					build_page_info(p, result);
					//3、解析显示分页条数据
					build_page_nav(p, url, userId, result);
				}
			});
		} */
	</script>
</body>

</html>