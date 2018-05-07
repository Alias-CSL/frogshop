<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>商品类目</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>common/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>common/global.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>css/personal1.css" media="all">
<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">


<style>
ul {
	border: 1px #CBCBCB solid;
	width: 400px;
	height: 300px;
	float: left;
	margin: 5px;
	overflow: scroll;
}

li {
	list-style-type: none;
	cursor: pointer;
}

.select-box ul.first li, .select-box ul.second li {
	background: url(images/arrow.png) no-repeat 332px center;
}

.layui-input-block {
	margin: 0 auto;
}

.next {
	margin-left: 730px;
}

.selected {
	color: red;
}
</style>

</head>
<body>
	<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit"> <span>选择商品类目</span> </header>
		<!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<ol class="am-breadcrumb">
				<!-- 			  <li><a href="#">首页</a></li>
			  <li><a href="#">分类</a></li>
			  <li class="am-active">内容</li> -->
			</ol>
			<div class="select-box">
				<div class="wrap">
					<ul class="first">

					</ul>
					<ul class="second">

					</ul>
					<!--     <ul class="third">
                           
                    </ul> -->
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button type="button" class="am-btn am-btn-warning next">下一步</button>
				</div>
			</div>
		</div>
	</div>
	</section>
	<script type="text/javascript"
		src="<%=basePath %>common/layui/layui.js"></script>
	<script src="<%=basePath %>/js/jquery-1.7.2.min.js"
		type="text/javascript"></script>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	<script type="text/javascript">
//发送ajax获取父类目信息
	$(document).ready(function() {
	sendAjax("first", "<%=basePath%>getFirstCategories", "");
		<%-- $.ajax({
			url:"<%=basePath%>getFirstCategories",
			type:"get",
			success:function(result){
				if(result.code == 100) {//数据返回成功
					var parent = $("ul.first");
					parent.empty();
					var categories = result.extend.categories;
					$.each(categories,function(index,category){
						parent.append($('<li title="'+category.id+'" class="first-li">'+category.displayName+'</li>'));
					});
				}
			}
		}); --%>
		
	})
	
	$("li.first-li").live("click", function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		var categoryId = $(this).attr("title");
		$("ol.am-breadcrumb").empty();
		$("ol.am-breadcrumb").append('<li><a href="#" >'+$(this).text()+'</a></li>');
		//alert(categoryId);
		sendAjax("second", "<%=basePath%>getSecondCategories", "categoryId=" + categoryId);
	});

	$("li.second-li").live("click", function() {
		$(this).addClass("selected").siblings('li').removeClass("selected");
		$("ol.am-breadcrumb li").removeClass("am-active");
		if($("ol.am-breadcrumb li").length >= 2){
			$("ol.am-breadcrumb li:last-child").remove();
		}
		$("ol.am-breadcrumb").append('<li><a href="#" >'+$(this).text()+'</a></li>');
		var categoryId = $(this).attr("title");
		//alert(categoryId);
		<%-- sendAjax("third", "<%=basePath%>getThirdCategories", "categoryId=" + categoryId); --%>
	}); 
	$("button.next").click(function(){
		var categoryId = $("ul.second").find("li.selected").attr("title");
		//alert(categoryId);
		window.location.href = "<%=basePath%>editGoodBasemMessage?categoryId="+categoryId;
	});
	function sendAjax(p,url , data) {
		$.ajax({
			url:url,
			data:data,
			type:"get",
			success:function(result){
				if(result.code == 100) {//数据返回成功
					var parent = $("ul."+p);
					parent.empty();
					var categories = result.extend.categories;
					$.each(categories,function(index,category){
						parent.append($('<li title="'+category.id+'" class="'+p+'-li">'+category.displayName+'</li>'));
					});
				}
			}
		});
	}
</script>
</body>
</html>