<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<!-- 			<div class="layui-inline">
					<a class="layui-btn layui-btn-danger " id="batchUpdate">批量更新</a>
				</div>
				<div class="layui-inline">
					<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
				</div> -->
				<div class="layui-inline">
					<div class="layui-form-mid layui-word-aux">本页面刷新后除新添加的外所有操作无效，关闭页面前未保存的数据重置</div>
				</div>
			</blockquote>

			<div
				class="layui-tab-content larry-personal-body clearfix mylog-info-box">
				<!-- 操作日志 -->
				<div class="layui-tab-item layui-field-box layui-show">
					<table class="layui-table table-hover" lay-even="" lay-skin="nob">
						<colgroup>
				            <col width="20">
				            <col width="29%">
				            <col width="9%">
				            <col width="7%">
				            <col width="7%">
				            <col width="8%">
				            <col width="13%">
				            <col width="7%">
				        </colgroup>
						<thead>
							<tr>
								<th>订单编码</th>
								<th>收货信息</th>
								<th>下单时间</th>
								<th>数量</th>
								<th>总额</th>
								<th>快递</th>
								<th>快递编码</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						    <c:choose>
								<c:when test="${not empty orders}">
									<c:forEach items="${orders}" var="order" varStatus="vs">
										
										<tr data-id="${order.id }">
										<td>${order.orderNum }</td>
										<td>${order.address.province} ${order.address.city} ${order.address.address} ${order.address.contacterName} ${order.address.phone}</td>
										<td><fmt:formatDate value="${order.createDate }" pattern="yyyy/MM/dd/ HH:mm"/></td>
										<td>${order.goodNum }</td>
										<td> ${order.total }</td>
										<td> ${order.expressName }</td>
										<td id="expressNum-td"><input type="text" name="expressNum"  class="layui-input"></td>
										<td id="operate-td">
											<a class="layui-btn layui-btn-mini good_shipped"><i class="iconfont icon-edit"></i> 发货</a>
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
	    <div class="am-modal-hd">发货操作</div>
	    <div class="am-modal-bd">
	      你，确定要发货吗？
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
	   		   发货成功，你很棒棒哦！
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

	<script type="text/javascript">
		$(function(){
/* 			$('#my-confirm').on('closed.modal.amui', function() {
			  $(this).removeData('amui.modal');
			}); */
			$("a.good_shipped").on("click",function(){
				var parent = $(this);
				var orderId = parent.parents("tr").attr("data-id");
				var expressNum = parent.parents("tr").find("input[name='expressNum']").val();
				var data = "orderId=" + orderId + "&expressNum=" + expressNum
				alert(data);
				$('#my-confirm').modal({
			        onConfirm: function(options) {
			            $.ajax({
							url:"<%=basePath%>orderShipped",
							data:data,
							type:"post",
							success:function(result){
								if(result.code == 100) {
									parent.parents("tr").remove();
									$('#my-confirm').removeData('amui.modal');
									$("#my-alert").modal();
								}
							}
						});
			        },
			        // closeOnConfirm: false,
			        onCancel: function() {
			          
			        }
			      });
			});
		})
	</script>
</body>
</html>