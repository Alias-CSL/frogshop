<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>个人信息</title>
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
	href="<%=basePath %>common/global.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>css/personal1.css" media="all">
<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<section class="layui-larry-box">
	<div class="larry-personal">
		<div class="layui-tab">
			<blockquote class="layui-elem-quote news_search">

				<div class="layui-inline">
					<div class="layui-input-inline">
						<input value="" placeholder="请输入关键字"
							class="layui-input search_input" type="text">
					</div>
					<a class="layui-btn search_btn">查询</a>
				</div>
				<div class="layui-inline">
					<a href="http://localhost:8080/frogShop/addGood.html"  class="layui-btn layui-btn-normal newsAdd_btn">添加商品</a>
				</div>
				<div class="layui-inline">
					<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
				</div>
				<div class="layui-inline">
					<div class="layui-form-mid layui-word-aux">本页面刷新后所有操作无效，关闭页面所有未提交数据无效</div>
				</div>
			</blockquote>

			<!-- 操作日志 -->
			<div class="layui-form news_list">
				<table class="layui-table">
					<colgroup>
						<col width="50">
						<col>
						<col width="9%">
						<col width="9%">
						<col width="9%">
						<col width="9%">
						<col width="9%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th><input name="" lay-skin="primary" lay-filter="allChoose"
								id="allChoose" type="checkbox">
								<div class="layui-unselect layui-form-checkbox"
									lay-skin="primary">
									<i class="layui-icon"></i>
								</div></th>
							<th style="text-align:left;">商品标题</th>
							<th>商品状态</th>
							<th>库存</th>
							<th>总销量</th>
							<th>是否上架</th>
							<th>发布时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody class="news_content">


					</tbody>
				</table>
				<div class="larry-table-page clearfix">
					<a href="javascript:;" class="layui-btn layui-btn-small"><i
						class="iconfont icon-shanchu1"></i>删除</a>
					<div id="page" class="page"></div>
				</div>
				<!-- 显示分页信息 -->
				<div class="am-g">
					<!--分页文字信息  -->
					<div class="am-u-sm-4 am-u-md-4 am-u-sm-centered"
						id="page_info_area"></div>
					<!-- 分页条信息 -->
					<div class="am-u-sm-8 am-u-md-8 am-u-sm-centered"
						id="page_nav_area">
						<!--分页 -->
						<!-- <ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul> -->
					</div>
				</div>
			</div>
			<!-- 登录日志 -->
			<div class="layui-tab-item layui-field-box">
				<table class="layui-table table-hover" lay-even="" lay-skin="nob">
					<thead>
						<tr>
							<th><input type="checkbox" id="selected-all"></th>
							<th>ID</th>
							<th>管理员账号</th>
							<th>状态</th>
							<th>最后登录时间</th>
							<th>上次登录IP</th>
							<th>登录IP</th>
							<th>IP所在位置</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td>110</td>
							<td>admin</td>
							<td>后台登录成功</td>
							<td>2016-12-19 14:26:03</td>
							<td>127.0.0.1</td>
							<td>127.0.0.1</td>
							<td>Unknown</td>
						</tr>
					</tbody>
				</table>
				<div class="larry-table-page clearfix">
					<a href="javascript:;" class="layui-btn layui-btn-small"><i
						class="iconfont icon-shanchu1"></i>删除</a>
					<div id="page2" class="page"></div>
				</div>
			</div>
		</div>
	</div>
	</section>
	
<div class="am-modal am-modal-no-btn" tabindex="-1" id="doc-modal-1">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">商品Sku管理
      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
    </div>
    <div class="am-modal-bd">
      
    </div>
  </div>
</div>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>common/layui/layui.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/newslist.js"></script>
	<script type="text/javascript">
	
</script>
</body>
</html>