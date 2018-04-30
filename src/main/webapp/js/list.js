// JavaScript Document
var basePath,goodId,userId;
//设置用户id
/*function setUserId(id) {
	userId = id;
}*/
//设置网址基本地址
function setBasePath(url){
	basePath = url;
	//alert(basePath);
}
//设置商品id
function setGoodId(id){
	goodId = id;
	//alert(basePath);
}
//添加到收藏夹
$("#collectGood").click(function(){
	var userId = $("input#userId-input").val();
	//alert(userId);
	var goodId = $("input#goodId").val();
	//alert(goodId);
	$.ajax({
		url:basePath+"addToCollection",
		data:"userId="+userId+"&goodId="+goodId,
		type:"post",
		success:function(result){
			if(result.code == 100) {//加入成功
				alert("收藏成功");
			}else if(result.code == 200) {//之前加入过
				alert("您已收藏了！");
			}
		}
	}); 
});
//获取评论页面
function to_page(p,url,userId,pageNum) {
	var datas = "pageNum="+pageNum+"&goodId="+goodId;
	$.ajax({
		url :basePath+"getEvaluate",
		data : datas,
		type : "GET",
		success : function(result) {
			//1、解析并显示商品数据
			build_evalaute_info(result);
			//2、解析并显示分页信息
			build_page_info("",result);
			//3、解析显示分页条数据
			build_page_nav("",basePath,"",result);
		}
	});
}
//更新评论数据
function build_evalaute_info(result) {
//	/alert(result);
	//将原有的商品数据清空
	var parentUl = $("ul#comments-list");
	parentUl.empty();
	//alert(result.code);
	if(result.code == 100) {
		//alert("build_good_info");
		var evaluates = result.extend.pageInfo.list;
		//设置评价总数
		$("span#total-comment").text( "评价("+result.extend.pageInfo.total+")");
		$("span#total-comment-span").text( result.extend.pageInfo.total);
		$.each(evaluates,function(index,evaluate){
			var userImageA = $('<a href=""><img class="am-comment-avatar" src="'+basePath+'images/hwbn40x40.jpg" /></a>');
			var commentMainDiv = $('<div class="am-comment-main"></div>');
			var commentHeader = $('<header class="am-comment-hd"></div>')
									.append($('<div class="am-comment-meta"></div>')
											.append($('<a href="#link-to-user" class="am-comment-author">'+evaluate.user.userName+'</a>'))
											.append("   评论于    ")
											.append($('<time datetime="YYYY-MM-DDThh:mm:ss">'+evaluate.createTime+'</time>')));
			var commentBody = $('<div class="am-comment-bd"></div>')
								.append($('<div class="tb-rev-item " data-id="255776406962"></div>')
										.append('<div class="J_TbcRate_ReviewContent tb-tbcr-content ">'+evaluate.content+'</div>'));
			commentMainDiv.append(commentHeader).append(commentBody);
			var parentLi = $('<li class="am-comment"></li>').append(userImageA).append(commentMainDiv);
			parentUl.append(parentLi);
		});
	}else{
		var tip = $("<h3>未找到相关数据</h3>");
		parentUl.append(tip);
	};
}
//判断受否选择了所有产品规格
function isAllSelected(){
	var flag = false;
	var str = "";
	$(".theme-options").each(function(){
		var i = $(this);
		var title = i.find("div.cart-title").text();
		
		var hasSelected = i.find("ul>li.selected");
		if(hasSelected.length == 1) {
			flag = true;
			var value = hasSelected.text();
			str = str+ "\"" + title + "\":\"" + value + "\",";
			//alert(str);
			return true;
		}else{
			flag = false;
			//alert("false");
			return false;
		}
	});	
	var datas = "goodId="+goodId+"&attr={"+str.substring(0, str.length - 1)+ "}" ;
	var data = encodeURI(encodeURI(datas));
	if(flag == true) {//如果商品属性全都有选的话，发送ajax请求，获取对应商品规格库存
		$.ajax({
			url :basePath+"getStockMessage",
			data : data,
			type : "GET",
			success : function(result) {
				if(result.code == 100) {
					//更新对应商品规格的库存
					
					var resource = result.extend.sku.resource;
					//alert(resource);
					$("span#stock").text(resource);
					$("#sku-input").val(result.extend.sku.id);
					alert($("#sku-input").val());
				}
			}
		});
	}
	if(flag == false) {//请求获取总库存
		$.ajax({
			url :basePath+"getTotalStockMessage",
			data : "goodId="+goodId,
			type : "GET",
			success : function(result) {
				if(result.code == 100) {
					//更新对应商品规格的库存
					var resource = result.extend.good.stocks;
					//alert(resource);
					$("span#stock").text(resource);
					$("#sku-input").val(" ");
					//alert($("#sku-input").val());
				}
			}
		});
	}
}
//购买商品点击事件
function buy_good() {
	var skuId = $("#sku-input").val();
	var goodNum = $("input#text_box").val();
	var userId = $("#userId-input").val();
	var goodName = $("h1#h1-goodName").text().trim();
	alert(goodName);
	alert(skuId);
	if(userId === " " || userId === "" || (typeof userId === "undefined") ) {//用户未登录
		window.location.href=basePath+"login.html";
		
	}else if(!(skuId === " ") && !(skuId === "" )) {//转发购买请求
		//get请求
		//alert(skuId +","+goodNum);
		//window.location.href=basePath+"buyTheGood?skuId="+skuId+"&goodNum="+goodNum+"&userId="+userId;
/*		$.ajax({
			url:basePath+"buyTheGood",
			data:"skuId="+skuId+"&goodNum="+goodNum+"&userId="+userId,
			type:"GET",
			success:function(result) {
				
			}
		});*/
		postcall(basePath+'buyTheGood', {skuId :skuId,count:goodNum,userId:userId,goodName:goodName});
		$("#sku-input").val(" ");
	}else{
		//alert("请选择商品规格");
		$("div.am-modal-bd").text("您未选择商品规格，请选择商品规格后再行购买！");
		$('#my-confirm').modal('toggle');//提示用户选择商品属性再购买
	}
}

/*//虚拟表单的形式提交post请求
function postcall( url, params, target){  
    var tempform = document.createElement("form");  
    tempform.action = url;  
    tempform.method = "post";  
    tempform.style.display="none"  
    if(target) {  
        tempform.target = target;  
    }  
  
    for (var x in params) {  
        var opt = document.createElement("input");  
        opt.name = x;  
        opt.value = params[x];  
        tempform.appendChild(opt);  
    }  
  
    var opt = document.createElement("input");  
    opt.type = "submit";  
    tempform.appendChild(opt);  
    document.body.appendChild(tempform);  
    tempform.submit();  
    document.body.removeChild(tempform);  
}  
 */
//添加商品到购物车点击事件
function add_cart() {
	var skuId = $("#sku-input").val();
	var goodNum = $("input#text_box").val();
	var userId = $("#userId-input").val();
	alert(skuId+","+goodNum+","+userId);
	if(userId === " " || userId === "" || (typeof userId === "undefined") ) {//用户未登录
		window.location.href=basePath+"login.html";
		
	}
	else if(!(skuId === " ") && !(skuId === "" )) {//转发购买请求
		$.ajax({
			url :basePath+"addToCart",
			data : "skuId="+skuId+"&goodNum="+goodNum+"&userId="+userId,
			type : "POST",
			success : function(result) {
				if(result.code == 100) {
					$("div.am-modal-bd").text("已将商品加入购物车，可在购物车查看详情！");
					$('#my-confirm').modal('toggle');//提示用户选择商品属性再购买
				}else{
					$("div.am-modal-bd").text("添加失败，请重新操作！");
					$('#my-confirm').modal('toggle');//提示用户选择商品属性再购买
				}
			}
		});	
		
	}else{
		//alert("请选择商品规格");
		$("div.am-modal-bd").text("您未选择商品规格，请选择商品规格后再加入购物车！");
		$('#my-confirm').modal('toggle');//提示用户选择商品属性再购买
	}
}
//商品规格选择
$(function() {
	var flag = true;
	$(".theme-options").each(function() {
		var i = $(this);
		var p = i.find("ul>li");
		p.click(function() {
			if (!!$(this).hasClass("selected")) {
				$(this).removeClass("selected");

			} else {
				$(this).addClass("selected").siblings("li").removeClass("selected");
				
			}
			isAllSelected();
		});
	})

})


//弹出规格选择
$(document).ready(function() {
	var $ww = $(window).width();
	if ($ww <1025) {
		$('.theme-login').click(function() {
			$(document.body).css("position", "fixed");
			$('.theme-popover-mask').show();
			$('.theme-popover').slideDown(200);

		})

		$('.theme-poptit .close,.btn-op .close').click(function() {
			$(document.body).css("position", "static");
			//					滚动条复位
			$('.theme-signin-left').scrollTop(0);

			$('.theme-popover-mask').hide();
			$('.theme-popover').slideUp(200);
		})

	}
})

//导航固定
$(document).ready(function() {
	var $ww = $(window).width();
	var dv = $('ul.am-tabs-nav.am-nav.am-nav-tabs'),
		st;

	if ($ww < 623) {

				var tp =$ww+363;
				$(window).scroll(function() {
					st = Math.max(document.body.scrollTop || document.documentElement.scrollTop);
					if (st >= tp) {
						if (dv.css('position') != 'fixed') dv.css({
							'position': 'fixed',
							top: 53,
							'z-index': 1000009
						});

					} else if (dv.css('position') != 'static') dv.css({
						'position': 'static'
					});
				});
				//滚动条复位（需要减去固定导航的高度）

				$('.introduceMain ul li').click(function() {
					sts = tp;
					$(document).scrollTop(sts);
				});
       } else {

		dv.attr('otop', dv.offset().top); //存储原来的距离顶部的距离
		var tp = parseInt(dv.attr('otop'))+36;
		$(window).scroll(function() {
			st = Math.max(document.body.scrollTop || document.documentElement.scrollTop);
			if (st >= tp) {
             
					if (dv.css('position') != 'fixed') dv.css({
						'position': 'fixed',
						top: 0,
						'z-index': 998
					});

				//滚动条复位	
				$('.introduceMain ul li').click(function() {
					sts = tp-35;
					$(document).scrollTop(sts);
				});

			} else if (dv.css('position') != 'static') dv.css({
				'position': 'static'
			});
		});



	}
});



$(document).ready(function() {
	//优惠券
	$(".hot span").click(function() {
		$(".shopPromotion.gold .coupon").toggle();
	})




	//获得文本框对象
	var t = $("#text_box");
	//初始化数量为1,并失效减
	$('#min').attr('disabled', true);
	//数量增加操作
	$("#add").click(function() {
			t.val(parseInt(t.val()) + 1)
			if (parseInt(t.val()) != 1) {
				$('#min').attr('disabled', false);
			}

		})
		//数量减少操作
	$("#min").click(function() {
		t.val(parseInt(t.val()) - 1);
		if (parseInt(t.val()) == 1) {
			$('#min').attr('disabled', true);
		}

	})

})