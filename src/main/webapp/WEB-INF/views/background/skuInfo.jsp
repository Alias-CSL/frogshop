<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	href="<%=basePath %>common/bootstrap/css/bootstrap.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.min.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>common/global.css" media="all">
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>css/personal1.css" media="all">
<style type="text/css">
	input:hover{
		
	}
</style>
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
					<a class="layui-btn layui-btn-danger " id="batchUpdate">批量更新</a>
				</div>
				<div class="layui-inline">
					<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
				</div>
				<div class="layui-inline">
					<div class="layui-form-mid layui-word-aux">本页面刷新后除新添加的外所有操作无效，关闭页面前未保存的数据重置</div>
				</div>
			</blockquote>

			<div
				class="layui-tab-content larry-personal-body clearfix mylog-info-box">
				<!-- 操作日志 -->
				<input type="hidden" value="${skus[0].goodId }" name="goodId" id="goodId-input"/>
				<div class="layui-tab-item layui-field-box layui-show">
					<table class="layui-table table-hover" lay-even="" lay-skin="nob">
						<thead>
							<tr>
								<th><input type="checkbox"  id="allChoose"></th>
								<th>商品规格</th>
								<th>原始价格</th>
								<th>销售价格</th>
								<th>销量</th>
								<th>库存</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							
						    <c:choose>
								<c:when test="${not empty skus}">
									<c:forEach items="${skus}" var="sku" varStatus="vs">
										<tr data-id="${sku.id }">
										<td><input type="checkbox" name="checked" ></td>
										<td>${fn:substring(sku.attributes,1,fn:length(sku.attributes)-1)}</td>
										<td> <input type="text" name="originalPrice" class="layui-input" value="${sku.originalPrice }"></td>
										<td> <input type="text" name="price" class="layui-input" value="${sku.price }"></td>
										<td>${sku.sales }</td>
										<td><input type="text" name="resource"  class="layui-input" value="${sku.resource }"></td>
										<td>
											<a class="layui-btn layui-btn-mini" id="sku_save"><i class="iconfont icon-edit"></i> 保存</a>
											<a class="layui-btn layui-btn-danger layui-btn-mini sku_del" data-id="13"><i class="layui-icon"></i> 删除</a>
										</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose> 
						</tbody>
					</table>
					<div class="larry-table-page clearfix">
						<a href="javascript:;" class="layui-btn layui-btn-small"><i
							class="iconfont icon-shanchu1"></i>删除</a>
						<div id="page" class="page"></div>
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
	</div>
	</section>
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">删除操作</div>
	    <div class="am-modal-bd">
	      你，确定要删除这条记录吗？
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
	    </div>
	  </div>
	</div>
		<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm3">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">删除操作</div>
	    <div class="am-modal-bd">
	      你，确定要删除这些记录吗？
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
	    </div>
	  </div>
	</div>
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm1">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">修改操作</div>
	    <div class="am-modal-bd">
	      你，确定要修改这条记录吗？
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
	    </div>
	  </div>
	</div>
		<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm2">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">修改操作</div>
	    <div class="am-modal-bd">
	      你，确定要修改这些记录吗？
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
	    </div>
	  </div>
	</div>
	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd">Frog Shop</div>
	    <div class="am-modal-bd">
	   		   更新成功，你很棒棒哦！
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn">确定</span>
	    </div>
	  </div>
	</div>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>common/layui/layui.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>js/skuinfo.js"></script>
	<script type="text/javascript">
		setBasePath("<%=basePath%>");
		
</script>
</body>
</html>