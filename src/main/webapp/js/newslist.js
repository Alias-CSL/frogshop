	layui.config({
		base : "js/"
	}).use([ 'form', 'layer', 'jquery', 'laypage' ], function() {
		var form = layui.form(),
			layer = parent.layer === undefined ? layui.layer : parent.layer,
			laypage = layui.laypage,
			$ = layui.jquery,
			basePath="http://localhost:8080/frogShop/";
		
		//加载页面数据
		var newsData = '';
		$.get("../../json/newsList.json", function(data) {
			var newArray = [];
			//单击首页“待审核文章”加载的信息
			if ($(".top_tab li.layui-this cite", parent.document).text() == "待审核文章") {
				if (window.sessionStorage.getItem("addNews")) {
					var addNews = window.sessionStorage.getItem("addNews");
					newsData = JSON.parse(addNews).concat(data);
				} else {
					newsData = data;
				}
				for (var i = 0; i < newsData.length; i++) {
					if (newsData[i].newsStatus == "待审核") {
						newArray.push(newsData[i]);
					}
				}
				newsData = newArray;
				newsList(newsData);
			} else { //正常加载信息
				newsData = data;
				if (window.sessionStorage.getItem("addNews")) {
					var addNews = window.sessionStorage.getItem("addNews");
					newsData = JSON.parse(addNews).concat(newsData);
				}
				//执行加载数据的方法
				newsList();
			}
		})
	
		//查询
		$(".search_btn").click(function() {
			var newArray = [];
			if ($(".search_input").val() != '') {
				var index = layer.msg('查询中，请稍候', {
					icon : 16,
					time : false,
					shade : 0.8
				});
				setTimeout(function() {
					$.ajax({
						url : "",
						type : "get",
						dataType : "json",
						success : function(data) {
							if (window.sessionStorage.getItem("addNews")) {
								var addNews = window.sessionStorage.getItem("addNews");
								newsData = JSON.parse(addNews).concat(data);
							} else {
								newsData = data;
							}
							for (var i = 0; i < newsData.length; i++) {
								var newsStr = newsData[i];
								var selectStr = $(".search_input").val();
								function changeStr(data) {
									var dataStr = '';
									var showNum = data.split(eval("/" + selectStr + "/ig")).length - 1;
									if (showNum > 1) {
										for (var j = 0; j < showNum; j++) {
											dataStr += data.split(eval("/" + selectStr + "/ig"))[j] + "<i style='color:#03c339;font-weight:bold;'>" + selectStr + "</i>";
										}
										dataStr += data.split(eval("/" + selectStr + "/ig"))[showNum];
										return dataStr;
									} else {
										dataStr = data.split(eval("/" + selectStr + "/ig"))[0] + "<i style='color:#03c339;font-weight:bold;'>" + selectStr + "</i>" + data.split(eval("/" + selectStr + "/ig"))[1];
										return dataStr;
									}
								}
								//文章标题
								if (newsStr.newsName.indexOf(selectStr) > -1) {
									newsStr["newsName"] = changeStr(newsStr.newsName);
								}
								//发布人
								if (newsStr.newsAuthor.indexOf(selectStr) > -1) {
									newsStr["newsAuthor"] = changeStr(newsStr.newsAuthor);
								}
								//审核状态
								if (newsStr.newsStatus.indexOf(selectStr) > -1) {
									newsStr["newsStatus"] = changeStr(newsStr.newsStatus);
								}
								//浏览权限
								if (newsStr.newsLook.indexOf(selectStr) > -1) {
									newsStr["newsLook"] = changeStr(newsStr.newsLook);
								}
								//发布时间
								if (newsStr.newsTime.indexOf(selectStr) > -1) {
									newsStr["newsTime"] = changeStr(newsStr.newsTime);
								}
								if (newsStr.newsName.indexOf(selectStr) > -1 || newsStr.newsAuthor.indexOf(selectStr) > -1 || newsStr.newsStatus.indexOf(selectStr) > -1 || newsStr.newsLook.indexOf(selectStr) > -1 || newsStr.newsTime.indexOf(selectStr) > -1) {
									newArray.push(newsStr);
								}
							}
							newsData = newArray;
							newsList(newsData);
						}
					})
	
					layer.close(index);
				}, 2000);
			} else {
				layer.msg("请输入需要查询的内容");
			}
		})
	
		//添加文章
		//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
		$(window).one("resize", function() {
			$(".newsAdd_btn").click(function() {
				var index = layui.layer.open({
					title : "添加文章",
					type : 2,
					content : "newsAdd.html",
					success : function(layero, index) {
						setTimeout(function() {
							layui.layer.tips('点击此处返回文章列表', '.layui-layer-setwin .layui-layer-close', {
								tips : 3
							});
						}, 500)
					}
				})
				layui.layer.full(index);
			})
		}).resize();
	
		//推荐文章
		$(".recommend").click(function() {
			var $checkbox = $(".news_list").find('tbody input[type="checkbox"]:not([name="show"])');
			if ($checkbox.is(":checked")) {
				var index = layer.msg('推荐中，请稍候', {
					icon : 16,
					time : false,
					shade : 0.8
				});
				setTimeout(function() {
					layer.close(index);
					layer.msg("推荐成功");
				}, 2000);
			} else {
				layer.msg("请选择需要推荐的文章");
			}
		})
	
		//审核文章
		$(".audit_btn").click(function() {
			var $checkbox = $('.news_list tbody input[type="checkbox"][name="checked"]');
			var $checked = $('.news_list tbody input[type="checkbox"][name="checked"]:checked');
			if ($checkbox.is(":checked")) {
				var index = layer.msg('审核中，请稍候', {
					icon : 16,
					time : false,
					shade : 0.8
				});
				setTimeout(function() {
					for (var j = 0; j < $checked.length; j++) {
						for (var i = 0; i < newsData.length; i++) {
							if (newsData[i].newsId == $checked.eq(j).parents("tr").find(".news_del").attr("data-id")) {
								//修改列表中的文字
								$checked.eq(j).parents("tr").find("td:eq(3)").text("审核通过").removeAttr("style");
								//将选中状态删除
								$checked.eq(j).parents("tr").find('input[type="checkbox"][name="checked"]').prop("checked", false);
								form.render();
							}
						}
					}
					layer.close(index);
					layer.msg("审核成功");
				}, 2000);
			} else {
				layer.msg("请选择需要审核的文章");
			}
		})
	
		//批量删除
		$(".batchDel").click(function() {
			var $checkbox = $('.news_list tbody input[type="checkbox"][name="checked"]');
			var $checked = $('.news_list tbody input[type="checkbox"][name="checked"]:checked');
			if ($checkbox.is(":checked")) {
				layer.confirm('确定删除选中的信息？', {
					icon : 3,
					title : '提示信息'
				}, function(index) {
					var index = layer.msg('删除中，请稍候', {
						icon : 16,
						time : false,
						shade : 0.8
					});
					setTimeout(function() {
						var ids ="";
						//删除数据
						$.each($checked,function(index,item){
							var parent = $(this).parents("tr");
							var goodId = parent.find("input.goodId").val();
							ids += goodId+",";
						});
						var data = ids.substr(0, ids.length-1);
						//alert(data);
						//发送ajax，批量删除
						$.ajax({
							url:basePath+"deleteGoods",
							data:"ids="+data,
							type:"POST",
							success:function(result) {
								if(result.code == 100) {
									$.each($checked,function(index,item){
										 $(this).parents("tr").remove();
									});
									$('.news_list thead input[type="checkbox"]').prop("checked", false);
									layer.close(index);
									form.render();
									layer.close(index);
									layer.msg("删除成功");
								}
							}
						});
						
					}, 2000);
				})
			} else {
				layer.msg("请选择需要删除的文章");
			}
		})
	
		//全选
		form.on('checkbox(allChoose)', function(data) {
			var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
			child.each(function(index, item) {
				item.checked = data.elem.checked;
			});
			form.render('checkbox');
		});
	
		//通过判断文章是否全部选中来确定全选按钮是否选中
		form.on("checkbox(choose)", function(data) {
			var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
			var childChecked = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"]):checked')
			if (childChecked.length == child.length) {
				$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = true;
			} else {
				$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = false;
			}
			form.render('checkbox');
		})
	
		//是否展示
		form.on('switch(isShow)', function(data) {
			var index = layer.msg('修改中，请稍候', {
				icon : 16,
				time : false,
				shade : 0.8
			});
			var parent = $(data.elem).parents().parents().parents();
			var goodId = $(data.elem).parents().siblings("input.goodId").val();//加上.siblings("input.goodId")可以避免多个checkbox存在的情况，发送点击其中一个，而只触发第一个
			var put ;
			//alert(goodId);
			//alert($(data.elem).siblings("div.layui-form-switch").hasClass("layui-form-onswitch"));
			if($(data.elem).siblings("div.layui-form-switch").hasClass("layui-form-onswitch")){
				put = 1;
			}else{
				put = 2;
			}
			$.ajax({
				url:basePath+"putawayGood",
				data:"goodId="+goodId+"&status="+put,
				type:"post",
				success:function(result) {
					if(result.code = 100){//上下架更新成功
						setTimeout(function() {
							layer.close(index);
							layer.msg("商品上下架状态修改成功！");
						}, 2000);
					}else{
						setTimeout(function() {
							layer.close(index);
							layer.msg("操作失败，请重新操作！");
						}, 2000);
					}
				}
			});
			
		})
		
		//操作
		$("body").on("click", ".news_edit", function() { //编辑
			//var div_doc_modal_1 =$("#doc-modal-1");
	 
		})
	
		$("body").on("click", ".news_collect", function() { //收藏.
			if ($(this).text().indexOf("已收藏") > 0) {
				layer.msg("取消收藏成功！");
				$(this).html("<i class='layui-icon'>&#xe600;</i> 收藏");
			} else {
				layer.msg("收藏成功！");
				$(this).html("<i class='iconfont icon-star'></i> 已收藏");
			}
		})
		//删除单条记录
		$("body").on("click", ".news_del", function() { //删除
			var _this = $(this);
			var parent = _this.parents("tr");
			layer.confirm('确定删除此信息？', {
				icon : 3,
				title : '提示信息'
			}, function(index) {
				//_this.parents("tr").remove();
				var goodId = parent.find("input.goodId").val();
				$.ajax({
					url:basePath+"delOneGood",
					data:"goodId="+goodId,
					type:"POST",
					success:function(result) {
						if(result.code == 100) {
							parent.remove();
							layer.close(index);
						}
					}
				});
			});
		})
	
		function newsList(that) {
			//渲染数据
			function renderDate(data, curr) {
				var dataHtml = '';
				if (!that) {
					currData = newsData.concat().splice(curr * nums - nums, nums);
				} else {
					currData = that.concat().splice(curr * nums - nums, nums);
				}
				if (currData.length != 0) {
					for (var i = 0; i < currData.length; i++) {
						dataHtml += '<tr>'
							+ '<td><input type="checkbox" name="checked" lay-skin="primary" lay-filter="choose"></td>'
							+ '<td align="left">' + currData[i].newsName + '</td>'
							+ '<td>' + currData[i].newsAuthor + '</td>';
						if (currData[i].newsStatus == "待审核") {
							dataHtml += '<td style="color:#f00">' + currData[i].newsStatus + '</td>';
						} else {
							dataHtml += '<td>' + currData[i].newsStatus + '</td>';
						}
						dataHtml += '<td>' + currData[i].newsLook + '</td>'
							+ '<td><input type="checkbox" name="show" lay-skin="switch" lay-text="是|否" lay-filter="isShow"' + currData[i].isShow + '></td>'
							+ '<td>' + currData[i].newsTime + '</td>'
							+ '<td>'
							+ '<a class="layui-btn layui-btn-mini news_edit"><i class="iconfont icon-edit"></i> 编辑</a>'
							+ '<a class="layui-btn layui-btn-normal layui-btn-mini news_collect"><i class="layui-icon">&#xe600;</i> 收藏</a>'
							+ '<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="' + data[i].newsId + '"><i class="layui-icon">&#xe640;</i> 删除</a>'
							+ '</td>'
							+ '</tr>';
					}
				} else {
					dataHtml = '<tr><td colspan="8">暂无数据</td></tr>';
				}
				return dataHtml;
			}
	
			//分页
			var nums = 13; //每页出现的数据量
			if (that) {
				newsData = that;
			}
			laypage({
				cont : "page",
				pages : Math.ceil(newsData.length / nums),
				jump : function(obj) {
					$(".news_content").html(renderDate(newsData, obj.curr));
					$('.news_list thead input[type="checkbox"]').prop("checked", false);
					form.render();
				}
			})
		}
		
		
		
		//发送ajax请求，获取商品数据
		var url = basePath+"getAllGoods";
		to_page("", url, "", 1);
		//属性查询商品,或者跳转到指定页面
		function to_page(p, url, userId, pageNum) {
			$.ajax({
				url : url,
				data : "pageNum=" + pageNum,
				type : "GET",
				success : function(result) {
					//1、解析并显示商品数据
					build_good_info("", result);
					//2、解析并显示分页信息
					build_page_info("", result);
					//3、解析显示分页条数据
					build_page_nav("", url, "", result);
					form.render('checkbox');
				}
			});
		}
		//显示商品信息
		function build_good_info(p, result) {
			//将原有的商品数据清空
			var parentTbody = $("tbody.news_content");
			parentTbody.empty();
			//alert(result.code);
			if (result.code == 100) {
				//alert("build_good_info");
				var goods = result.extend.pageInfo.list;
				$.each(goods, function(index, good) {
					var input_hidden = $('<input type="hidden" name="goodId" class="goodId" value="'+good.id+'"/>');
					var tr = $('<tr></tr>');
					var td_checked = $('<td><input name="checked" lay-skin="primary" lay-filter="choose" type="checkbox"><div class="layui-unselect layui-form-checkbox"><span>勾选</span><i class="layui-icon"></i></div></td>');
					var td_goodName = $('<td align="left">' + good.goodName + '</td>');
					var td_stauts;
					if (good.stocks > 0) {
						td_stauts = $('<td>正常</td>');
					} else {
						td_stauts = $('<td>断货</td>');
					}
					var td_stocks = $('<td>' + good.stocks + '</td>');
					var td_totalSale = $('<td>' + good.totalSales + '</td>');
					var td_putaway;
					if (good.status == 1) {
						td_putaway = $('<td><input name="show" lay-skin="switch" lay-text="是|否" lay-filter="isShow" checked="" class="isShow" type="checkbox"><div class="layui-unselect layui-form-switch layui-form-onswitch"><i></i></div></td>');
					} else {
						td_putaway = $('<td><input name="show" lay-skin="switch" lay-text="是|否" lay-filter="isShow" class="isShow" type="checkbox"><div class="layui-unselect layui-form-switch"><i></i></div></td>');
					}
					var td_enteringTime = $('<td>' + format(good.enteringTime) + '</td>');
					var td_operation = $('<td><a class="layui-btn layui-btn-mini news_edit" href="'+basePath+'myloginfo?goodId='+good.id+'"><i class="iconfont icon-edit"></i> 库存管理</a><a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="1"><i class="layui-icon"></i> 删除</a></td>');
					tr.append(input_hidden).append(td_checked).append(td_goodName).append(td_stauts)
						.append(td_stocks).append(td_totalSale).append(td_putaway).append(td_enteringTime).append(td_operation)
					parentTbody.append(tr);
				});
	
			} else {
				var tip = $("<h3>未找到相关数据</h3>");
				parentTbody.append(tip);
			}
			;
		}
		//格式化日期
		function add0(m) {
			return m < 10 ? '0' + m : m
		}
		function format(timestamp) {
			//timestamp是整数，否则要parseInt转换,不会出现少个0的情况  
	
			var time = new Date(timestamp);
			var year = time.getFullYear();
			var month = time.getMonth() + 1;
			var date = time.getDate();
			var hours = time.getHours();
			var minutes = time.getMinutes();
			var seconds = time.getSeconds();
			return year + '-' + add0(month) + '-' + add0(date) + ' ' + add0(hours) + ':' + add0(minutes) + ':' + add0(seconds);
		}
		//解析显示分页信息
		function build_page_info(p,result){
			//alert("build_page_info");
			$(p + " #page_info_area").empty();
			//alert($(p + " #page_info_area").text());
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
			//alert("sdffs");
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
	})