<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head lang="en">
		<meta charset="UTF-8">
		<title>注册</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.min.css" />
		<link href="<%=basePath %>css/dlstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

	</head>

	<body>

		<div class="login-boxtitle">
			<a href="home/demo.html"><img alt="" src="<%=basePath %>images/logobig.png" /></a>
		</div>

		<div class="res-banner">
			<div class="res-main">
				<div class="login-banner-bg"><span></span><img src="<%=basePath %>images/big.jpg" /></div>
				<div class="login-box">

						<div class="am-tabs" id="doc-my-tabs">
							<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
								<li class="am-active" name="email-panel"><a href="">邮箱注册</a></li>
								<li name="phone-panel"><a href="">手机号注册</a></li>
							</ul>

							<div class="am-tabs-bd">
							<div class="am-tab-panel am-active email-panel">
								<div class="div-message">
								    <span class="message" style="color:red;"></span>
								</div>
									<form method="post" action="<%=basePath%>emailRegister">
				<div class="user-name user-data">

								    <label for="username"><i class="am-icon-user "></i></label>
								    <input type="text" name="username" class="username" placeholder="请输入用户名">
                 </div>		
							   <div class="user-email user-data">
										<label for="email"><i class="am-icon-envelope-o"></i></label>
										<input type="email" name="email" class="email" placeholder="请输入邮箱账号">
                 </div>										
                 <div class="user-pass user-data">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="password" class="password" placeholder="设置密码">
                 </div>										
                 <div class="user-pass user-data">
								    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								    <input type="password" name="passwordRepeat" class="passwordRepeat" placeholder="确认密码">
                 </div>	
              	<div class="user-pass reader-div am-checkbox">
						<input type="checkbox" class="onError reader-me" /> <p>点击表示您同意商城《服务协议》</p>		
				</div>
				<div class="user-pass am-cf">
					<input type="submit" name="" value="注册" class="send am-btn am-btn-primary am-btn-sm am-fl am-disabled" >
				</div>
                 </form>
                 </div>
								
								<div class="am-tab-panel phone-panel">
								<div class="div-message">
								    <span class="message" style="color:red;"></span>
								</div>
								
									<form method="post" action="<%=basePath%>phoneRegister">
				<div class="user-name user-data">
								    <label for="username"><i class="am-icon-user "></i></label>
								    <input type="text" name="username" class="username" placeholder="请输入用户名"/>
                 </div>							
                 <div class="user-phone user-data">
								    <label for="phone"><i class="am-icon-mobile-phone am-icon-sm"></i></label>
								    <input type="tel" name="phoneNum" class="phone" placeholder="请输入手机号">
                 </div>		

										<div class="verification  user-data">
											<label for="code"><i class="am-icon-code-fork"></i></label>
											<input type="tel" name="code" class="verify-code" id="code" placeholder="请输入验证码"/>
											<button type="button" class="am-btn am-btn-primary" id="dyMobileButton" style="font-size: 15px;">获取验证码</button>
										</div>
                 <div class="user-pass user-data">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="password" class="password" placeholder="设置密码">
                 </div>										
                 <div class="user-pass user-data">
								    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								    <input type="password" name="passwordRepeat" class="passwordRepeat" placeholder="确认密码">
                 </div>	
                <div class="user-pass reader-div am-checkbox">
						<input type="checkbox" class="onError reader-me" /> <p>点击表示您同意商城《服务协议》</p>		
				</div>
				<div class="am-cf">
						<input type="submit" name="" value="注册" class="send am-btn am-btn-primary am-btn-sm am-fl am-disabled" >
				</div>
									</form>
								</div>
							</div>
						</div>

				</div>
			</div>
			
					<div class="footer ">
						<div class="footer-hd ">
							<p>
								<a href="# ">恒望科技</a>
								<b>|</b>
								<a href="# ">商城首页</a>
								<b>|</b>
								<a href="# ">支付宝</a>
								<b>|</b>
								<a href="# ">物流</a>
							</p>
						</div>
						<div class="footer-bd ">
							<p>
								<a href="# ">关于恒望</a>
								<a href="# ">合作伙伴</a>
								<a href="# ">联系我们</a>
								<a href="# ">网站地图</a>
								<em>© 2015-2025 Hengwang.com 版权所有</em>
							</p>
						</div>
					</div>
					<script type="text/javascript">
					 function buttonCountdown($el, msNum, timeFormat) {
				        var text = $el.data("text") || $el.text(),
				                timer = 0;
				        $el.prop("disabled", true).addClass("disabled").addClass('am-disabled')
				                .on("bc.clear", function () {
				                    clearTime();
				                });
				
				        (function countdown() {
				            var time = showTime(msNum)[timeFormat];
				            $el.text(time + '后失效');
				            if (msNum <= 0) {
				                msNum = 0;
				                clearTime();
				            } else {
				                msNum -= 1000;
				                timer = setTimeout(arguments.callee, 1000);
				            }
				        })();
				
				        function clearTime() {
				            clearTimeout(timer);
				            $el.prop("disabled", false).removeClass("disabled").removeClass("am-disabled").text(text);
				        }
				
				        function showTime(ms) {
				        var d = Math.floor(ms / 1000 / 60 / 60 / 24),
				                h = Math.floor(ms / 1000 / 60 / 60 % 24),
				                m = Math.floor(ms / 1000 / 60 % 60),
				                s = Math.floor(ms / 1000 % 60),
				                ss = Math.floor(ms / 1000);
				
				        return {
				            d: d + "天",
				            h: h + "小时",
				            m: m + "分",
				            ss: ss + "秒",
				            "d:h:m:s": d + "天" + h + "小时" + m + "分" + s + "秒",
				            "h:m:s": h + "小时" + m + "分" + s + "秒",
				            "m:s": m + "分" + s + "秒"
				        };
				    }
				        return this;
				    }
				
				    //使用演示 显示为 秒
				    $("#dyMobileButton").on("click",function(){
				    	var phoneNum = $("div.user-phone input").val();
				    	if(phoneNum != "" && !$("div.user-phone input").hasClass('error')){
				        	//發送ajax，獲取驗證碼
				        	
				        	$.ajax({
								url :"<%=basePath%>getVerifyCode",
								data : "phoneNum="+phoneNum,
								type : "GET",
								success : function(result) {
									/* if(result.code == 200) {
										$(".phone-panel .message").text("验证码获取失败，请重新获取！");
										$("#test1").trigger("bc.clear");
									}else{ */
							        	
									//}
								}	
							});
							buttonCountdown($(this), 1000 * 60 * 1, "ss");
				    	}else{
				    		$(".phone-panel .message").text("请输入手机号码！");
						}
				    });
				
						$(function(){
							$('#doc-my-tabs').tabs();
							
							
							//将提示消息清空
							$("div#doc-my-tabs a").click(function() {
								$("div#doc-my-tabs").find("input").each(function(index, el) {
									if($(this).val() == "注册") {
										return true;
									}else{
									$(this).val("").removeClass("error");
									}
								});
								$(".message").each(function() {
									$(this).text("");
								});
							});
							//选项卡点击事件
							$("div#doc-my-tabs a").on('myClick', function() {
								var name = $(this).parent().attr("name");
								$("div."+name+" span.message").text("");
								//用户名文本框失去焦点后
								$("div."+name+" .username").bind('input propertychange', function() {
									  //验证用户名
									var username = this.value;
									var username_input = $(this);
									var message =  $(".message");
						            if( username =="" || username.length < 6 ){
						                var errorMsg = "请输入至少6位的用户名.";
						                username_input.addClass('error');
						                message.text(errorMsg);
						           	}else{
  					                    username_input.removeClass('error');
  					                    message.text("");
						           		//发送ajax请求，判断用户名是否已经注册
						           		var url = "<%=basePath%>existsTheUsername";
						           		$.ajax({
											url :url,
											data : "username="+username,
											type : "GET",
											success : function(result) {
												if(result.code == 200) {
													username_input.addClass("error");
													message.text("用户名已存在！");
												}
											}
										});
						            }
						            varify("div."+name);
								});
								//邮箱文本框失去焦点后
								$("div."+name+" .email").bind('input propertychange', function() {
									var email =  this.value;
									var email_input = $(this);
									var message = $(".message");
									  //验证邮箱
						            if( email =="" || ( email !="" && !/.+@.+\.[a-zA-Z]{2,4}$/.test(email) ) ){
					                    var errorMsg = '请输入正确的E-Mail地址.';
					                    email_input.addClass('error');
						                message.text(errorMsg);
					                }else{
					                   email_input.removeClass('error');
					                   message.text("");
										//发送ajax请求，判断用户名是否已经注册
						           		$.ajax({
											url :"<%=basePath%>existsTheEmail",
											data : "email="+email,
											type : "GET",
											success : function(result) {
												if(result.code == 200) {
													email_input.addClass("error");
													message.text("邮箱已被注册！");
												}
											}
										});						                
					                }
					                varify("div."+name);
								});
								//验证手机号码文本框失去焦点后
								$("div."+name+" .phone").bind('input propertychange', function() {
									var phone =  this.value;
									var phone_input = $(this);
									var message = $(".message");
									//验证手机
						            if( phone=="" || ( phone !="" && !/^1[34578]\d{9}$/.test(phone) )){
					                    var errorMsg = '请输入正确的手机号码.';
					                    phone_input.addClass('error');
						                message.text(errorMsg);
					                }else{
					                    phone_input.removeClass('error');
					                     message.text("");
					                    //发送ajax请求，判断用户名是否已经注册
						           		$.ajax({
											url :"<%=basePath%>existsThePhoneNum",
											data : "phoneNum="+phone,
											type : "GET",
											success : function(result) {
												if(result.code == 200) {
													phone_input.addClass("error");
													message.text("手机号码已存在！");
												}
											}
										});		
					                }
					                varify("div."+name);
								});
								//验证手机验证码文本框失去焦点后
								$("div."+name+" .verify-code").bind('input propertychange', function() {
									  //验证邮箱
						            if( this.value=="" || ( this.value!="" && !/\d{4}$/.test(this.value) )){
					                      var errorMsg = '请输入正确的验证码.';
					                       $(this).addClass('error');
						                $(".message").text(errorMsg);
					                }else{
					                     // var okMsg = '输入正确.';
					                    $(this).removeClass('error');
						                $(".message").text("");			     
					                }
					                varify("div."+name);
								});
								//确认密码框文本框失去焦点后
								$("div."+name+" .passwordRepeat").bind('input propertychange', function() {
									var password = $("div."+name+" .password").val();
									  //比对密码是否相同
						            if(password=="" || this.value != password){
					                    var errorMsg = '两个密码不同，请重新输入.';
					                    	$(this).addClass('error');
						                $(".message").text(errorMsg);
					                }else{
					                     // var okMsg = '输入正确.';
					                     $(".message").text("");
					                        $(this).removeClass('error');
						               // $(".message").text(okMsg);
						                
					                }
					                varify("div."+name);
								});
							 	$("div."+name+" .password").bind('input propertychange', function() {
									var passwordRepeat = $("div."+name+" .passwordRepeat").val();
									var password = this.value;
									if(passwordRepeat!= "" && password != null && password != "" && password != "设置密码") {
										//alert(password);
										 if(passwordRepeat=="" || this.value != passwordRepeat){
						                    var errorMsg = '两个密码不同，请重新输入.';
						                    $(this).addClass('error');
							                $(".message").text(errorMsg);
						                }else{
						                     // var okMsg = '输入正确.';
						                     $(".message").text("");
						                     $(this).removeClass('error');
							                //$(".message").text(okMsg);
							                
						                }
									}
					                varify("div."+name);
								});
								//checkbox点击事件
								$("div."+name+" .reader-me").click(function(){
									if($(this).is(':checked')){
										$(this).removeClass("onError");
										
									}else{
										$(this).addClass("onError");
										
									}
									//alert("sdfs");
									varify("div."+name);
								});
							});
							$("div#doc-my-tabs a").trigger("myClick");
						})
						//判断所有表单是否都正确填写
						function varify(id) {
							//	alert("true");
							var flag = false;
							if($(id+" .reader-me").is(':checked')){
								$(id+" div.user-data input").each(function() {
									if($(this).val() == "" || $(this).hasClass('error')){
										//alert("false");
										$(id+" input.send").addClass('am-disabled');
										flag = false;
										return false;
									}
									flag = true;
								});
									//alert("true");
								if(flag == true){
									$(id+" input.send").removeClass('am-disabled');	
								}
							}else{
								$(id+" input.send").addClass('am-disabled');	
							}
						}
					</script>
	</body>

</html>