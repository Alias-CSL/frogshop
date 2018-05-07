<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>商品描述添加页面</title>

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
	width: 450px;
	height: 450px;
	cursor: pointer;
}

tr {
	text-align: center;
}
</style>


</head>

<body>
	<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit"> <span>添加商品描述图片</span> </header>
		<!-- /header -->
		<div class="larry-personal-body clearfix sku-message">
			<span>预览图片比例可能与实际不符，仅是预览效果，实例与用户上传的图片效果一样.<code>请将描述图片按序添加</code></span>
			<form class="am-form am-form-horizontal"
				enctype="multipart/form-data" method="post"
				action="<%=basePath%>uploadDetailImage">
				<input type="hidden" name="goodId" value="${goodId}" />
				<div class="bar">
					<table
						class="am-table am-table-bordered am-table-striped am-table-compact">
						<thead>
							<tr>
								<th>商品描述图片</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="am-text-middle"><img class="pic"
									src="images/uploadimg.png"> <input class="upload"
									name="images[0]" accept="image/*" type="file"
									style="display: none" /></td>
								<td><button type="button"
										class="am-btn am-btn-danger deletePic">删除</button></td>
							</tr>
						</tbody>
					</table>

				</div>
				<div>
					<button type="button" id="addMorePicture"
						class="am-btn am-btn-warning">继续添加</button>
					<input type="submit" class="am-btn am-btn-warning" value="提交" />
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