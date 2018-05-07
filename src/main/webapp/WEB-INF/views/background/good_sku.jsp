<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>商品规格属性添加页面</title>

<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />

<link href="<%=basePath %>basic/css/demo.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>css/personal1.css" media="all">

<style type="text/css">
.bar {
	width: 80%;
}

div.sku-message {
	width: 80%;
	margin: 0 auto;
}

.pic {
	width: 50px;
	height: 50px;
	cursor: pointer;
}

.am-form input[type="text"] {
	font-size: 1rem;
}
</style>


</head>

<body>
	<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit"> <span>基本内容编辑</span> </header>
		<!-- /header -->
		<div class="larry-personal-body clearfix sku-message">
			<span>商品属性请以<code>"属性名":"属性值"</code>的格式输入,若有多个属性，以<code>,</code>为分割
			</span>
			<form method="post" action="<%=basePath %>uploadMultipartFile.do"
				enctype="multipart/form-data">
				<div class="bar">
					<input type="hidden" name="goodId" value="${goodId}" />
					<table
						class="am-table am-table-bordered am-table-striped am-table-compact">
						<thead>
							<tr>
								<th>商品属性</th>
								<th>原价</th>
								<th>价格</th>
								<th>库存</th>
								<th>图片</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="am-text-middle"><input type="text"
									name="skus[0].attributes" class="attributes"
									placeholder=' "尺码":"M"，"颜色":"红色"' /></td>
								<td class="am-text-middle"><input type="text"
									name="skus[0].originalPrice" class="originalPrice" /></td>
								<td class="am-text-middle"><input type="text"
									name="skus[0].price" class="price" /></td>
								<td class="am-text-middle"><input type="text"
									name="skus[0].resource" class="resource" /></td>
								<td class="am-text-middle"><img class="pic"
									src="images/uploadimg.png"> <input class="upload"
									name="skus[0].picture" accept="image/*" type="file"
									style="display: none" /></td>
								<td><button type="button"
										class="am-btn am-btn-danger delete">删除</button></td>
							</tr>

						</tbody>
					</table>

				</div>
				<div>
					<button type="button" id="addMore" class="am-btn am-btn-warning">继续添加</button>
					<input type="submit" class="am-btn am-btn-warning" vlaue="提交">
				</div>
			</form>
		</div>
	</div>
	</section>
	<script src="<%=basePath %>js/jquery-1.7.2.min.js"></script>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/imgupload.js"></script>
</body>

</html>