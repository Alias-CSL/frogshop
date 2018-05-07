<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>商品销售属性</title>

<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />

<link href="<%=basePath%>basic/css/demo.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/personal1.css" media="all">
<style type="text/css">
div.select-div {
	float: left;
	margin: 5px;
	width: 30%;
}

.am-form select {
	font-size: 1rem;
}
</style>

</head>

<body>
	<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit"> <span>基本内容编辑</span> </header>
		<!-- /header -->
		<div class="larry-personal-body clearfix changepwd"
			style="height:500px;">

			<form class="am-form am-form-horizontal" role="form">
				<input type="hidden" value="${categoryId }" name="categoryId"
					id="categoryId-input" /> <input type="hidden" value="${goodId }"
					name="goodId" id="goodId-input" />
				<div style="width: 100%;float: left;">
					<c:choose>
						<c:when test="${not empty attributeNames}">
							<c:forEach items="${attributeNames }" var="attributeName"
								varStatus="vs">
								<div class="select-div">
									<label for="doc-ipt-3-a" class="am-form-label">${attributeName.name }</label>
									<div class="" id="doc-ipt-3-a ">
										<select id="doc-select-1">
											<c:forEach items="${attributeName.attributeValues }"
												var="attributeValue" varStatus="vs">
												<option>${attributeValue.name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
				<div style="float: right;margin-right: 110px;">
					<button type="button" class="am-btn am-btn-warning" id="next">下一步</button>
				</div>
			</form>
		</div>
	</div>
	</section>
	<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
	<script src="<%=basePath%>js/postcall.js"></script>
	<script src="<%=basePath%>AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("button#next").click(function(){
				//alert("dsaf");
				var attributes = "{";
				$("div.select-div").each(function(index,item){
					var attributeName = $(this).find("label.am-form-label").text();
					var attributeValue = $(this).find("select").val();
					attributes += '"'+attributeName+'":"'+attributeValue+'",';
				});
				var data = attributes.substring(0,attributes.length-1)+"}";
				var categoryId = $("input#categoryId-input").val();
				var goodId = $("input#goodId-input").val();
				//alert(data);	
				//alert(categoryId);
				//alert(goodId);
				postcall('<%=basePath%>addGoodAttributes', {goodId:goodId,categoryId:categoryId,attributes:data});
			});
		})
		
	</script>
</body>

</html>