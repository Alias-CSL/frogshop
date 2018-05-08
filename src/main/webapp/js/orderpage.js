var basePath;
function setBasePath(urlPrefix){
	basePath = urlPrefix;
}
			//通过用户id获取所有订单,或者跳转到指定页面,data参数包含用户id与页码
			function to_page(p,url,userId,pn) {		
				//alert(data);
				$.ajax({
					url :url,
					data : "userId="+userId+"&pn="+pn,
					type : "GET",
					success : function(result) {
						//alert("sfs");
						//1、解析并显示商品数据
						build_order_info(p,result);
						//2、解析并显示分页信息
						build_page_info(p,result);
						//3、解析显示分页条数据
						build_page_nav(p,url,userId,result);
					}
				});
			}
			//更新订单数据
			function build_order_info(p,result) {
				
				//将原有的订单数据清空
				var parentUl = $(p+" div.order-list");
				parentUl.empty();
				//alert(result.code);
				if(result.code == 100) {
					//alert("build_good_info");
					var orders = result.extend.pageInfo.list;
					$.each(orders,function(index,order){
						var div_order_status = $('<div class="order-status"></div>');
						var div_order_title = $('<div class="order-title"></div>')
												.append($('<div class="dd-num">订单编号：<a href="javascript:;">'+order.orderNum+'</a></div>'));
						if(order.dealDate != null) {
							div_order_title.append($('<span>成交时间：'+format(order.dealDate)+'</span>'));
						}else{
							div_order_title.append($('<span>下单时间：'+format(order.createDate)+'</span>'));
						}					
						var div_order_content = $('<div class="order-content"></div');
						var div_order_left = $('<div class="order-left"></div>'); 
						//显示购买的商品
						$.each(order.orderGoods,function(i,orderGood){
							var goodAttr = orderGood.sku.attributes.replace(/\"|{|}/g,'');
							var ul_item_list  = $('<ul class="item-list"></ul>');
							var li_td_item = $('<li class="td td-item"></li>')
											.append($('<div class="item-pic"><a href="#" class="J_MakePoint"><img src="'+orderGood.sku.picture+'" class="itempic J_ItemImg"></a></div>'))
											.append($('<div class="item-info"><div class="item-basic-info"><a href="'+basePath+'good/introduction/'+ orderGood.sku.goodId+'"><p>'+orderGood.goodName+'</p><p class="info-little">'+goodAttr+'<br/>包装：裸装 </p></a></div></div>'))
											.append($('<input type="hidden" class="skuId" value="'+orderGood.sku.id+'"/>'));
							var li_td_price = $('<li class="td td-price"><div class="item-price">'+orderGood.sku.price+'</div></li>');
							var li_td_number = $('<li class="td td-number"><div class="item-number"><span>×</span>'+orderGood.goodNum+'</div></li>');
							var li_td_operation = $('<li class="td td-operation"><div class="item-operation"><a href="refund.html">退款/退货</a></div></li>');
							ul_item_list.append(li_td_item).append(li_td_price).append(li_td_number).append(li_td_operation);
							div_order_left.append(ul_item_list);
						});
						var div_order_right = $('<div class="order-right"></div>');
						var li_td_amount = $('<li class="td td-amount"></li>')
											.append($('<div class="item-amount">合计：'+order.total+'<p>含运费：<span>'+order.expressage+'</span></p></div>'));
						var div_move_right=$('<div class="move-right"></div>')
						var li_td_status = $('<li class="td td-status"></li>');
						var li_td_change = $('<li class="td td-change"></li>');
						var div_item_status = $('<div class="item-status"></div>');
						//订单状态：1.未付款，2.未发货，3.待收货，4.待评价，5退款/售后
						if(order.status == 1){
							div_item_status.append($('<p class="Mystatus">等待买家付款</p><p class="order-info"><a href="#" id="cancelOrder" data-am-modal="{target: \'#cancel-confirm\'}">取消订单</a></p>'));
							li_td_status.append(div_item_status);
							li_td_change.append($('<a href="pay.html"><div class="am-btn am-btn-danger anniu">一键支付</div></a>'));
						}else if(order.status == 2) {
							div_item_status.append($('<p class="Mystatus">买家已付款</p><p class="order-info"><a href="orderinfo.html">订单详情</a></p>'));
							li_td_change.append($('<div class="am-btn am-btn-danger anniu">提醒发货</div>'));
							li_td_status.append(div_item_status);
						}else if(order.status == 3) {
							div_item_status.append($('<p class="Mystatus">卖家已发货</p>'))
											.append($('<p class="order-info"><a href="orderinfo.html">订单详情</a></p>'))
											.append($('<p class="order-info"><a href="'+basePath+'logistics?orderId='+order.id+'">查看物流</a></p>'))
											.append($('<p class="order-info"><a href="#">延长收货</a></p>'));
							li_td_status.append(div_item_status);		
							li_td_change.append($('<div class="am-btn am-btn-danger anniu" id="confirm-receipt">确认收货</div>'));	
						}else if(order.status == 4) {
							div_item_status.append($('<p class="Mystatus">交易成功</p>'))
							.append($('<p class="order-info"><a href="orderinfo.html">订单详情</a></p>'))
							.append($('<p class="order-info"><a href="'+basePath+'logistics?orderId='+order.id+'">查看物流</a></p>'));
							li_td_status.append(div_item_status);		
							li_td_change.append($('<a href="#" class="comment-good"><div class="am-btn am-btn-danger anniuv "  data-am-modal="{target: \'#my-confirm\'}">评价商品</div></a>'));	
						}else if(order.status == 5){
							div_item_status.append($('<p class="Mystatus">交易成功</p>'))
							.append($('<p class="order-info"><a href="orderinfo.html">订单详情</a></p>'))
							.append($('<p class="order-info"><a href="'+basePath+'logistics?orderId='+order.id+'">查看物流</a></p>'));
							li_td_status.append(div_item_status);
							li_td_change.append($('<a href="#" class="comment-good"><div class="am-btn am-btn-danger anniuv ">退货申请</div></a>'));	
						}else if(order.status == 6){
							div_item_status.append($('<p class="Mystatus">订单已取消</p>'))
							.append($('<p class="order-info"><a href="logistics.html">查看订单详情</a></p>'));
							li_td_status.append(div_item_status);
						}
						div_move_right.append(li_td_status).append(li_td_change);
						div_order_right.append(li_td_amount).append(div_move_right).append($('<input type="hidden" class="orderNum" value="'+order.orderNum+'"/>')).append($('<input type="hidden" class="orderId" value="'+order.id+'"/>'));
						div_order_content.append(div_order_left).append(div_order_right);
						div_order_status.append(div_order_title).append(div_order_content);
						parentUl.append(div_order_status);
					});
				}else{
					var tip = $("<h3>未找到相关数据</h3>");
					parentUl.append(tip);
				};
			}
			
			$("a.comment-good").live("click",function(){
				var parent = $(this);
				var orderNum = $(this).parent().parent().parent().find("input.orderNum").val();
				//alert(orderNum)
				$("#my-confirm input#order-id").val(orderNum);
				$("div#comment").click(function(){
					var data = $("form#form-comment").serialize();
					//alert(data);
					//var datas = encodeURI(encodeURI(data));
					$.ajax({
						url:basePath+"commentTheGood",
						data:data,
						type:"post",
						success:function(result){
							if(result.code == 100) {//评价成功
								parent.empty();
								parent.append($('<a href="#" class="comment-good"><div class="am-btn am-btn-danger anniuv ">退货申请</div></a>'));
							}
						}
					});
					$("div.close").click();
				});
			});
			$("a#cancelOrder").live("click",function(){
				var parent = $(this);
				var parent_div =  $(this).parent().parent().parent().parent().parent();
				//alert("dsf");
				var orderId = parent_div.find("input.orderId").val();
				//alert(orderId);
				$("span#cancalOrder-span").click(function(){
					$.ajax({
						url:basePath+"cancelOrder",
						data:"orderId="+orderId,
						type:"post",
						success:function(result){
							if(result.code == 100) {//评价成功
								var parent_div_status = parent.parent().parent();
								parent_div_status.empty();
								parent_div_status.append($('<p class="Mystatus">订单已取消</p>'))
								.append($('<p class="order-info"><a href="logistics.html">查看订单详情</a></p>'));
								parent_div.find("li.td-change").empty();
							}
						}
					});
					$("div.close").click();
				});
			});
			$("div#confirm-receipt").live("click",function(){
				var parent = $(this).parent();
				var orderId = $(this).parent().parent().parent().find("input.orderId").val();
				$.ajax({
					url:basePath+"confiemRecept",
					data:"orderId="+orderId,
					type:"post",
					success:function(result){
						if(result.code == 100) {//评价成功
							parent.empty();
							parent.append($('<a href="#" class="comment-good"><div class="am-btn am-btn-danger anniuv "  data-am-modal="{target: \'#my-confirm\'}">评价商品</div></a>'));
							parent.parent().find("div.item-status").empty().append($('<p class="Mystatus">交易成功</p>'))
							.append($('<p class="order-info"><a href="orderinfo.html">订单详情</a></p>'))
							.append($('<p class="order-info"><a href="logistics.html">查看物流</a></p>'));
						}
					}
				});
			});