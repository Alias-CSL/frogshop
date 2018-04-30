//解析显示分页信息
function build_page_info(p,result){
	//alert("build_page_info");
	$(p + " #page_info_area").empty();
	$(p + " #page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
			result.extend.pageInfo.pages+"页,总"+
			result.extend.pageInfo.total+"条记录");
	totalRecord = result.extend.pageInfo.total;
	currentPage = result.extend.pageInfo.pageNum;
}

//3、解析显示分页条数据
function build_page_nav(p,url,userId,result){
	//page_nav_area
	//alert("build_page_nav");
	$(p+" #page_nav_area").empty();
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
			to_page(p,url,userId,1);
		});
		prePageLi.click(function(){
			to_page(p,url,userId,result.extend.pageInfo.pageNum -1);
		});
	}
	

	var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
	var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
	if(result.extend.pageInfo.hasNextPage == false){
		nextPageLi.addClass("am-disabled");
		lastPageLi.addClass("am-disabled");
	}else{
		nextPageLi.click(function(){
			to_page(p,url,userId,result.extend.pageInfo.pageNum +1);
		});
		lastPageLi.click(function(){
			to_page(p,url,userId,result.extend.pageInfo.pages);
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
			to_page(p,url,userId,item);
		});
		ul.append(numLi);
	});
	//添加下一页和末页 的提示
	ul.append(nextPageLi).append(lastPageLi);
	
	//把ul加入到nav
	var navEle = $("<nav></nav>").append(ul);
	navEle.appendTo(p+" #page_nav_area");
}

