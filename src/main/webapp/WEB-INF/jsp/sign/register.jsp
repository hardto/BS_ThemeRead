<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>注册-毕设</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/bootstrap.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/scripts/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/scripts/bootstrap.js"></script>
<style>
body {
	width: 100%;
	height: 100%;
}

#jss {
	margin-top: 10%;
}
</style>
</head>

<body
	style="background:#fff url(../resource/images/login.jpg) no-repeat left top;background-size: 100%;opacity: 0.4;">
	<div id="jss" class="container-fluid">
		<form class="form-horizontal" role="form"
			action="info" method="post">
			
			<div class="form-group">
				<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="email">邮箱:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="请输入您的邮箱">
				</div>
				<!--title="错误信息"-->
				<span id="tooltipa" data-toggle="popover" data-content="邮箱格式不准确 ">&nbsp;</span>
				<div class="col-sm-5"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="phone">手机号码:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="phone" name="phone"
						placeholder="请输入您的手机号码">
				</div>
				<span id="tooltipb" data-toggle="popover"
					data-content="请确保输入的是一个有效号码">&nbsp;</span>
				<div class="col-sm-5"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="pwd">密码:</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="pwd" name="password"
						placeholder="必须大于6位且包含英文和数字">
				</div>
				<span id="tooltipc" data-toggle="popover"
					data-content="密码必须大于6位且包含英文和数字">&nbsp;</span>
				<div class="col-sm-5"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="repwd">确认密码:</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="repwd"
						placeholder="请重新输入您的密码">
				</div>
				<span id="tooltipd" data-toggle="popover" data-content="两次密码输入不一致">&nbsp;</span>
				<div class="col-sm-5"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="indentifier">验证码:</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="indentifier"
						placeholder="请输入验证码">
				</div>

				<input id="getcode" type="button" class="btn btn-info" value="获取验证码" /> <span id="tooltipe"
					data-toggle="popover" data-content="验证码不正确">&nbsp;</span>
			</div>
			<div class="form-group">
				<div class="col-sm-2"></div>
				<label class="control-label col-sm-2" for="acco">账号:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="acco" name="account"
						placeholder="请输入您的账号">
				</div>
				<div class="col-sm-5"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">

					<input id="register" type="button" class="btn btn-block btn-info"
						value="注&nbsp;册" />
				</div>
				<div class="col-sm-4"></div>
			</div>

		</form>
	</div>

	<!--<img src="servlet/VerificationServlet "/>-->
	<script>
		$(function() {
			$("body").animate({
				opacity : 1
			}, 2000);
			$("#getcode").click(function() {
			$("#getcode").prop("disabled","disabled");
			random = Math.random();
				var email = $("input:eq(0)").val();
				var phone = $("input:eq(1)").val();
				if(/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test(email) && /^1[3|4|5|8|7][0-9]\d{4,8}$/.test(phone)){
								$.ajax({
					type : "post",
					url : "getCodee",
					async : true,
					data : {
								"email" : email,
								"phone" : phone,
								"random" : random
							},
					success : function(data) {
						if("-1" == data){
							window.alert("手机或邮箱已被注册");
							$("div[class*=form-group]").eq(0).removeClass("has-error").removeClass("has-success").addClass("has-error");
							$("div[class*=form-group]").eq(1).removeClass("has-error").removeClass("has-success").addClass("has-error");
							$("#getcode").removeAttr("disabled");
						}else{
							/* $("div[class*=form-group]").eq(0).removeClass("has-error").removeClass("has-success").addClass("has-success");
							$("div[class*=form-group]").eq(1).removeClass("has-error").removeClass("has-success").addClass("has-success"); */
							window.alert("邮件已经发送");
						}
					}
				});	
				}else{
				if(!/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test(email)){
					$('#tooltipa').popover("show");
					$("div[class*=form-group]").eq(0).removeClass("has-error").removeClass("has-success").addClass("has-error");
					setInterval(function() {
						$('#tooltipa').popover("hide");
					}, 2000);
				}
				if(! /^1[3|4|5|8|7][0-9]\d{4,8}$/.test(phone)){
					$('#tooltipb').popover("show");
					$("div[class*=form-group]").eq(1).removeClass("has-error").removeClass("has-success").addClass("has-error");
					setInterval(function() {
						$('#tooltipb').popover("hide");
					}, 2000);
				}	
					
				}
			});
			$("#register").click(function(e) {
				var email = $("input:eq(0)").val();
				var phone = $("input:eq(1)").val();
				var pwd = $("input:eq(2)").val();
				var repwd = $("input:eq(3)").val();
				if (!/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test(email)) {
					$('#tooltipa').popover("show");
					$("div[class*=form-group]").eq(0).removeClass("has-error").removeClass("has-success").addClass("has-error");
					setInterval(function() {
						$('#tooltipa').popover("hide");
					}, 2000);
				} else {
					$('#tooltipa').popover("hide");
					$("div[class*=form-group]").eq(0).removeClass("has-error").removeClass("has-success").addClass("has-success");
				}
	
				if (!/^1[3|4|5|8|7][0-9]\d{4,8}$/.test(phone)) {
					$('#tooltipb').popover("show");
					$("div[class*=form-group]").eq(1).removeClass("has-error").removeClass("has-success").addClass("has-error");
					setInterval(function() {
						$('#tooltipb').popover("hide");
					}, 2000);
				} else {
					$('#tooltipb').popover("hide");
					$("div[class*=form-group]").eq(1).removeClass("has-error").removeClass("has-success").addClass("has-success");
				}
	
				if (!(/\d+/.test(pwd) && /[a-zA-Z]+/.test(pwd) && pwd.length > 6)) {
					$('#tooltipc').popover("show");
					$("div[class*=form-group]").eq(2).removeClass("has-error").removeClass("has-success").addClass("has-error");
					setInterval(function() {
						$('#tooltipc').popover("hide");
					}, 2000);
				} else {
					$('#tooltipc').popover("hide");
					$("div[class*=form-group]").eq(2).removeClass("has-error").removeClass("has-success").addClass("has-success");
				}
	
				if (repwd != pwd || repwd == "") {
					$('#tooltipd').popover("show");
					$("div[class*=form-group]").eq(3).removeClass("has-error").removeClass("has-success").addClass("has-error");
					setInterval(function() {
						$('#tooltipd').popover("hide");
					}, 2000);
				} else {
					$('#tooltipd').popover("hide");
					$("div[class*=form-group]").eq(3).removeClass("has-error").removeClass("has-success").addClass("has-success");
				}
				
				$.ajax({
					type : "post",
					url : "sendCode",
					async : false,
					data : {
								"random" : random
							},
					success : function(data) {
	
						var identifier = $("input:eq(4)").val().toLowerCase();
						data = data.trim().toLowerCase();
						if (identifier != data) {
	
							$('#tooltipe').popover("show");
							$("div[class*=form-group]").eq(4).removeClass("has-error").removeClass("has-success").addClass("has-error");
						} else {
							$('#tooltipe').popover("hide");
							$("div[class*=form-group]").eq(4).removeClass("has-error").removeClass("has-success").addClass("has-success");
						}
						var i = 0;
						$.each($("div[class*=form-group]"), function(index, ele) {
							if ($(ele).hasClass("has-error")) {
								i++;
							}
						});
						if (i == 0)
							$("form").submit();
					},
				});
	
			});
	
		});
	</script>
</body>

</html>