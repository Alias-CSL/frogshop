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
</style>

</head>
<body>
	<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit"> <span>基本内容编辑</span> </header>
		<!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-5"
				action="<%=basePath %>addGoodMessge" method="post">
				<input type="hidden" name="categoryId" value="${categoryId}" /> <input
					type="hidden" name="enteringPersonId"
					value="${sessionScope.loginEntity.id }">
				<div class="layui-form-item">
					<label class="layui-form-label">商品名称</label>
					<div class="layui-input-block">
						<input type="text" name="goodName" autocomplete="off"
							class="layui-input" value="admin">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">市场价</label>
					<div class="layui-input-block">
						<input type="text" name="originalPrice" autocomplete="off"
							class="layui-input ">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">总库存</label>
					<div class="layui-input-block">
						<input type="text" name="stocks" autocomplete="off"
							class="layui-input" value="Larry">
					</div>
				</div>

				<div class="layui-form-item">
					<div class="layui-input-block">
						<input type="submit" class="layui-btn layui-btn-danger"
							lay-submit="" value="下一步"></input>
					</div>
				</div>
			</form>
		</div>
	</div>
	</section>
	<script type="text/javascript"
		src="<%=basePath %>common/layui/layui.js"></script>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js"
		type="text/javascript"></script>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	<script type="text/javascript">
//发送ajax获取类目信息
</script>
</body>
</html>