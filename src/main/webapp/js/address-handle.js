var basePath ;
function setBasePath(url) {
	basePath = url;
}

$(".new-addr-btn .edit-address").live("click",function(event) {
	var parent = $(this).parent().parent();
	parent.addClass("choosed").siblings().removeClass("choosed");
	var buy_user = parent.find("span.buy-user").text();
	var buy_phone = parent.find("span.buy-phone").text();
	var province = parent.find("span.province").text();
	var city = parent.find("span.city").text();
	var dist = parent.find("span.dist").text();
	var street = parent.find("span.street").text();
	alert(street);
	var id = parent.find("input:hidden").val();
	//alert(id);
	//alert(street);
	$("#username").val(buy_user);
	$("#user-phone").val(buy_phone);
	$(".edit-address select.buy-city").append('<option>'+city+'</option>');
	$(".edit-address select.buy-dist").append('<option>'+dist+'</option>');
	$(".detial-address-div .detial-address").text(street);
	$("form#form-change input#address-id").val(id);
	//alert($("form#form-change input#address-id").val());
	//通过使用ajax获取省份
	//var select_province = $(".edit-address select.buy-province");
	getAllProvince($(".edit-address select.buy-province"),$(".edit-address select.buy-city"),basePath+"getAllProvince",basePath+"getCitiesByProvinceId",province,city);
	//var cityId = $(".edit-address select.buy-city").attr("value");
	getAddressMessage($(".edit-address select.buy-dist"),basePath+"getDistByCityName",dist,city);
	//城市选项栏点击事件
	clickHandle($(".edit-address select.buy-city"),$(".edit-address select.buy-dist"),"",basePath+"getDistByCityId",dist);
	//省份选项栏点击事件
	clickHandle($(".edit-address select.buy-province"),$(".edit-address select.buy-city"),$(".edit-address select.buy-dist"),basePath+"getCitiesByProvinceId",city);
	//触发修改按钮点击事件
$("#changeAddress").click(function(){
	var data = $("form#form-change").serialize();
	//alert(data);
	//var datas = encodeURI(encodeURI(data));
	$.ajax({
		url:basePath+"changeAddress",
		data:data,
		type:"post",
		success:function(result){
			if(result.code == 100) {//添加成功
				var address = result.extend.modifyAddress;
				var buy_user = parent.find("span.buy-user").text(address.contacterName);
				var buy_phone = parent.find("span.buy-phone").text(address.phone);
				var province = parent.find("span.province").text(address.province);
				var city = parent.find("span.city").text(address.city);
				var dist = parent.find("span.dist").text(address.districts);
				var street = parent.find("span.street").text(address.address);
				var id = parent.find("input:hidden").val(address.id);
			}
		}
	});
	//$("#my-confirm").modal('close');
	$("div.close").click();
});	
});
$("div.createAddr").click(function(){
	showAddresMessage();
});
//三级联动，获取省份城市地区
function showAddresMessage() {
	getAllProvince($(".edit-address select.new-buy-province"),$(".edit-address select.new-buy-city"),basePath+"getAllProvince",basePath+"getCitiesByProvinceId","广东省","");
	//var cityId = $(".edit-address select.buy-city").attr("value");
	//getAddressMessage($(".edit-address select.new-buy-dist"),"<%=basePath%>getDistByCityName","","");
	//城市选项栏点击事件
	clickHandle($(".edit-address select.new-buy-city"),$(".edit-address select.new-buy-dist"),"",basePath+"getDistByCityId","");
	//省份选项栏点击事件
	clickHandle($(".edit-address select.new-buy-province"),$(".edit-address select.new-buy-city"),$(".edit-address select.new-buy-dist"),basePath+"getCitiesByProvinceId","");

}


$("#saveAddress").click(function(){
	var data = $("form#form-create").serialize();
	alert(data);
	//var datas = encodeURI(encodeURI(data));
	$.ajax({
		url:basePath+"addNewAddress",
		data:data,
		type:"post",
		success:function(result){
			if(result.code == 100) {//添加成功
				var address = result.extend.newAddress;
				var parent = $("div.address ul");
				var per_border = $('<div class="per-border"></div>');
				var addresslist = $('<li class="user-addresslist"></li>')
									.append($('<input type="hidden" value="'+address.id+'" name="id" id="addressId-input"/>'));
				var address_left = $('<div class="address-left"></div>');
				var div_user =$('<div class="user DefaultAddr"></div>').append($('<p class="new-tit new-p-re"></p>').append($('<span class="buy-address-detail"></span>').append('<span class="new-txt buy-user">'+address.contacterName+' </span>').append($('<span class="new-txt-rd2 buy-phone">'+address.phone+'</span>'))));
				var default_address =$('<div class="default-address DefaultAddr new-mu_l2a new-p-re"></div>').append($('<p class="new-mu_l2cw"></p>').append($('<span class="buy-line-title buy-line-title-type title">收货地址：</span>'))
						.append($('<span class="buy--address-detail"></span>')
								.append($('<span class="province">'+address.province+'</span>'))
								.append($('<span class="city">'+address.city+'</span>'))
								.append($('<span class="dist">'+address.districts+'</span>'))
								.append($('<span class="street">'+address.address+'</span>'))));
				var deftip = $('<ins class="deftip hidden">默认地址</ins>');
				var address_right = $('<div class="address-right"></div>').append('<a href="../person/address.html"><span class="am-icon-angle-right am-icon-lg"></span></a>');
				var div_clear = $('<div class="clear"></div>');
				var div_addr_btn = $('<div class="new-addr-btn"></div>')
										.append('<a href="#" >设为默认</a>')
										.append('<span class="new-addr-bar hidden">|</span>')
										.append('<a href="#" class="edit-address"  data-am-modal="{target: \'#my-confirm\'}"><i class="am-icon-edit"></i>编辑</a>')
										.append('<span class="new-addr-bar">|</span>')
										.append('<a href="javascript:void(0);" class="delete-btn" id="delete-address"><i class="am-icon-trash"></i>删除</a>');
				addresslist.append(address_left.append(div_user).append(default_address).append(deftip))
						   .append(address_right)
						   .append(div_clear)
						   .append(div_addr_btn);	
				parent.append(per_border).append(addresslist);
			}
		/* $("#new-addrss-edit").modal({
			closable:false
		}); */
			$("div.close").click();
		}
	});
	
});
$(".delete-btn").live("click",function(){
	alert("sdfsd");
	var parent =  $(this).parent().parent();
	var id = parent.find("input:hidden").val();
	alert(id);
	$.ajax({
		url:basePath+"removeAddress",
		type:"get",
		data:"id="+id,
		success:function(result){
			if(result.code == 100) {//删除成功
				parent.remove();	
			}
		}
	});
});
var defaultAddressId = $("li.defaultAddr").find("input:hidden").val();
$(".save-default-btn").live("click",function(){
	var lastDefaultLi =  $("ul li.defaultAddr");
	var parent =  $(this).parent().parent();
	var id = parent.find("input:hidden").val();
	alert(id);
	alert(defaultAddressId);
	$.ajax({
		url:basePath+"saveAsDefaultAddress",
		type:"post",
		data:"id="+id+"&defaultAddressId="+defaultAddressId,
		success:function(result){
			if(result.code == 100) {//设置默认地址成功
				parent.addClass("defaultAddr");
				lastDefaultLi.removeClass("defaultAddr");
				$("ul#user-addresses li").each(function (index, item) { 
						item.hasClass("defaultAddr").find("ins").removeClass("hidden");
				});
			}
		}
	});
});
$("#J_Go").click(function(){
	var skuId  = $("input#skuId").val();
	var userId = $("input#userId-input").val();
	var addressId = $("li.defaultAddr input#addressId-input").val();
	var expressage = 10;
	var goodName = $("div.item-basic-info a").attr("title");
	var expressName = $("ul.op_express_delivery_hot li.selected span").attr("data-value");
	var goodNum = $("input.text_box").val();
	var total = $("div.buy-point-discharge em").text();
	if(typeof(expressName) == "undefined") {
		alert("请选择快递");
	}else {
		postcall(basePath+"createOrder", {skuId :skuId,userId:userId,addressId:addressId,expressage:expressage,expressName:expressName,goodNum:goodNum,total:total,goodName:goodName});			
	}
});