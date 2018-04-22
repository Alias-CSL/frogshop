var searchUrl,pageUrl,basePath;
var totalRecord,currentPage;
var categoryId,categoryName;
//设置类目名与类目Id
function setCategoryValue(id,name) {
	categoryId = id;
	categoryName = name;
	//alert(categoryId);
	//alert(categoryName);
}
//设置网址基本地址
function setBasePath(url){
	basePath = url;
	//alert(basePath);
}
//设置查询地址
function setSearchUrl(url){
	searchUrl = url;
	//alert(searchUrl);
}
//设置分页获取地址
function setPageUrl(url){
	pageUrl = url;
//	alert(pageUrl);
}
//属性查询商品,或者跳转到指定页面
function to_page(pageNum) {
	var dds = $("li.select-result dl#selected-dl dd.selected");
	var str = "";
	var content = "";
	$.each(dds, function(index, item) {

		var id = item.id;
		var attrName = $("dl[title='" + id + "']>dt").attr("title"); //获取属性名
		var attrValue = item.title; //属性值

		str = str + "\"" + attrName + "\":\"" + attrValue + "\",";

	});
	var datas;
	var categoryId = $("div#category-div").attr("title");
	if(str==""){//如果没有商品筛选属性
		datas="pageNum="+pageNum+"&id="+categoryId	;
	}else{//如果有商品筛选属性，则结合类目id进行筛选
		datas ="pageNum="+pageNum+"&id="+categoryId+"&attr="+"[{"+ str.substring(0, str.length - 1) + "}]";
	}
	
	var data = encodeURI(encodeURI(datas));
	//alert(data);
	$.ajax({
		url :basePath+"getGoods",
		data : data,
		type : "GET",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(result) {
			//1、解析并显示商品数据
			build_good_info(result);
			//2、解析并显示分页信息
			build_page_info(result);
			//3、解析显示分页条数据
			build_page_nav(result);
		}
	});
}

//跳转到指定的页码
/*function to_page(pn) {
	$.ajax({
		url:pageUrl,
		data:"pn"+pn,
		type:"GET",
		success:function(result) {
			//1、解析并显示商品数据
			build_good_info(result);
			//2、解析并显示分页信息
			build_page_info(result);
			//3、解析显示分页条数据
			build_page_nav(result);
		}
	});
}*/
//更新商品数据
function build_good_info(result) {
	
	//将原有的商品数据清空
	var parentUl = $("ul#goods_ul");
	parentUl.empty();
	//alert(result.code);
	if(result.code == 100) {
		//alert("build_good_info");
		var goods = result.extend.pageInfo.list;
		$.each(goods,function(index,good){
			var ImgA = $('<a href="'+basePath+'good/introduction/'+ good.id+'"><img src="'+ good.descPictures[0].descPicture+'"  height="218" width="218"/></a>');
			var titleP = $('<p class="title fl"><a href="'+basePath+'good/introduction/'+ good.id+'">'+good.goodName+'</a></p>');
			var price = $('<p class="price fl"><b>¥</b><strong>'+good.originalPrice+'</strong></p>');
			var sales = $('<p class="number fl">销量<span>'+good.totalSales+'</span></p>');
			var divParent = $('<div class="i-pic limit"></div>')
			.append(ImgA)
			.append(titleP)
			.append(price)
			.append(sales);
			var parentLi = $("<li></li>").append(divParent);
			parentUl.append(parentLi);
		});
	}else{
		var tip = $("<h3>未找到相关数据</h3>");
		parentUl.append(tip);
	};

}
/*//解析显示分页信息
function build_page_info(result){
	//alert("build_page_info");
	$("#page_info_area").empty();
	$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
			result.extend.pageInfo.pages+"页,总"+
			result.extend.pageInfo.total+"条记录");
	totalRecord = result.extend.pageInfo.total;
	currentPage = result.extend.pageInfo.pageNum;
}

//3、解析显示分页条数据
function build_page_nav(result){
	//page_nav_area
	//alert("build_page_nav");
	$("#page_nav_area").empty();
	var ul = $("<ul></ul>").addClass("am-pagination am-pagination-centered");
	
	//构建元素
	var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
	var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
	if(result.extend.pageInfo.hasPreviousPage == false){
		firstPageLi.addClass("am-disabled");
		prePageLi.addClass("am-disabled");
	}else{
		//为元素添加点击翻页的事件
		firstPageLi.click(function(){
			to_page(1);
		});
		prePageLi.click(function(){
			to_page(result.extend.pageInfo.pageNum -1);
		});
	}
	

	var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
	var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
	if(result.extend.pageInfo.hasNextPage == false){
		nextPageLi.addClass("am-disabled");
		lastPageLi.addClass("am-disabled");
	}else{
		nextPageLi.click(function(){
			to_page(result.extend.pageInfo.pageNum +1);
		});
		lastPageLi.click(function(){
			to_page(result.extend.pageInfo.pages);
		});
	}
	
	
	
	//添加首页和前一页 的提示
	ul.append(firstPageLi).append(prePageLi);
	//1,2，3遍历给ul中添加页码提示,此处需要修改，因为页码过多不可能全部显示
	$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
		
		var numLi = $("<li></li>").append($("<a></a>").append(item));
		if(result.extend.pageInfo.pageNum == item){
			numLi.addClass("am-active");
		}
		numLi.click(function(){
			to_page(item);
		});
		ul.append(numLi);
	});
	//添加下一页和末页 的提示
	ul.append(nextPageLi).append(lastPageLi);
	
	//把ul加入到nav
	var navEle = $("<nav></nav>").append(ul);
	navEle.appendTo("#page_nav_area");
}
*/

$(document).ready(function() {

	var hh = document.documentElement.clientHeight;
	var ls = document.documentElement.clientWidth;
	if (ls < 640) {

		$(".select dt").click(function() {
			if ($(this).next("div").css("display") == 'none') {
				$(".theme-popover-mask").height(hh);
				$(".theme-popover").css("position", "fixed");
				$(this).next("div").slideToggle("slow");
				$(".select div").not($(this).next()).hide();
			} else {
				$(".theme-popover-mask").height(0);
				$(".theme-popover").css("position", "static");
				$(this).next("div").slideUp("slow");
				;
			}

		})


		$(".eliminateCriteria").live("click", function() {
			$(".dd-conent").hide();
		})

		$(".select dd").live("click", function() {
			$(".theme-popover-mask").height(0);
			$(".theme-popover").css("position", "static");
			$(".dd-conent").hide();
		});
		$(".theme-popover-mask").live("click", function() {
			$(".theme-popover-mask").height(0);
			$(".theme-popover").css("position", "static");
			$(".dd-conent").hide();
		});

	}


	$("span.love").click(function() {
		$(this).toggleClass("active");
	});

	$(".select-dl dd").click(function() {
		
		$(this).addClass("selected").siblings().removeClass("selected");
		var id = $(this).parent().parent().attr("title"); //获取dl的title属性值
		//var copyThisA = $(this).clone();
		//$(".select-result dl").append(copyThisA.attr("id", id));
		if ($(this).hasClass("selecst-all")) {
			$("#" + id).remove();
		} else {
			var copyThisA = $(this).clone();
			if ($("#" + id).length > 0) { //该属性已经有选择值了，替换
				//$("#"+id+" a").html($(this).text());
				$("#" + id).remove();
				$(".select-result dl").append(copyThisA.attr("id", id));
			} else { //没有则直接加入
				$(".select-result dl").append(copyThisA.attr("id", id));
			}
		}
		
		//调用函数，进行对所选属性查询商品
		to_page(1);
	});
	$("#selected-dl dd.selected").live("click", function() {
		//alert("dsfa");
		$(this).remove();
		
		var attri = $(this).attr("title");

		var id = $(this).attr("id");
		$("dl[title='" + id + "'] .select-all").addClass("selected").siblings().removeClass("selected");
		to_page(1);
	});


	/*$("#select1 dd").click(function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectA").remove();
		} else {
			var copyThisA = $(this).clone();
			if ($("#selectA").length > 0) {
				$("#selectA a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisA.attr("id", "selectA"));

			}
		}
	});

	$("#select2 dd").click(function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectB").remove();
		} else {
			var copyThisB = $(this).clone();
			if ($("#selectB").length > 0) {
				$("#selectB a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisB.attr("id", "selectB"));
			}
		}
	});

	$("#select3 dd").click(function() {
		//为点击的option添加selected类，删除拥有selected类的同辈option	
		$(this).addClass("selected").siblings().removeClass("selected");
		if ($(this).hasClass("select-all")) {
			$("#selectC").remove();
		} else {
			var copyThisC = $(this).clone();
			if ($("#selectC").length > 0) {
				$("#selectC a").html($(this).text());
			} else {
				$(".select-result dl").append(copyThisC.attr("id", "selectC"));
			}
		}
	});

	$("#selectA").live("click", function() {
		$(this).remove();
		$("#select1 .select-all").addClass("selected").siblings().removeClass("selected");
	});

	$("#selectB").live("click", function() {
		$(this).remove();
		$("#select2 .select-all").addClass("selected").siblings().removeClass("selected");
	});

	$("#selectC").live("click", function() {
		$(this).remove();
		$("#select3 .select-all").addClass("selected").siblings().removeClass("selected");
	});*/

	$(".select dd").live("click", function() {
		if ($(".select-result dd").length > 1) {
			$(".select-no").hide();
			$(".eliminateCriteria").show();
			$(".select-result").show();
		} else {
			$(".select-no").show();
			$(".select-result").hide();

		}
	});

	$(".eliminateCriteria").live("click", function() {
		$("dd.selected").remove();

		$(".select-all").addClass("selected").siblings().removeClass("selected");
		$(".eliminateCriteria").hide();
		$(".select-no").show();
		$(".select-result").hide();

	});



});