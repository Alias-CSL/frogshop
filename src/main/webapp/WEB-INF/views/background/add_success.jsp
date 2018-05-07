<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'add_success.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />

<link href="<%=basePath%>basic/css/demo.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/personal1.css" media="all">
</head>

<body>
	<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit"> <span>商品添加成功</span> </header>
		<!-- /header -->
		<div class="larry-personal-body clearfix sku-message">
			<h2>添加成功</h2>
			<button class="addMore am-btn am-btn-warning">继续添加</button>
		</div>
	</div>
	</section>
	<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
	<script src="<%=basePath%>AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/imgupload.js"></script>
	<script type="text/javascript">
          
          $("button.addMore").click(function() {
           window.location.href="<%=basePath%>addGood.html";
          });
        </script>
</body>
</html>
