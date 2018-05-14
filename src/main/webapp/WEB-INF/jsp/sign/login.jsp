
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8" />
<title>登陆-毕设</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/bootstrap.css" />

<!--<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
        -->
<style>
form {
	margin-top: 20%;
}

body {
	background:
		url(${pageContext.request.contextPath}/resource/images/back.jpg)
		no-repeat;
	background-size: cover;
}

label {
	color: white;
}

#login {
	opacity: 0.2;
	transition: opacity 2s;
}

#login:hover {
	opacity: 1;
}
</style>
</head>

<body>
	<div class="container">
		<form class="form-horizontal" action="content/index" method="post"
			role="form">
			<div class="form-group has-feedback">
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="usm" name="usm"
							placeholder="请输入账号/邮箱/手机号码" autofocus> <span
							class="glyphicon glyphicon-user form-control-feedback"></span>
					</div>
					<div class="col-sm-5"></div>
					<span id="uu" class="glyphicon" style="padding-top: 10px;"></span>

				</div>

			</div>
			<div class="form-group has-feedback">
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-3">
						<input type="password" class="form-control" id="pwd" name="pwd"
							placeholder="请输入密码"> <span
							class="glyphicon glyphicon-lock form-control-feedback"></span> <input
							type="hidden" name="biaoji" id="biaoji" value="-1" />
					</div>
					<span style="padding-top: 10px;" id="pp" class="glyphicon "></span>
					<div class="col-sm-5"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-4">
					<div class="checkbox" >
						<label><input type="checkbox"> 记住密码</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div id="getin" class="col-sm-offset-4 col-sm-3">
					<button id="denglu" type="button"
						class="btn btn-default btn-block btn-success">登陆</button>
				</div>
			</div>
			<div class="form-group">
				<div id="login" class="col-sm-offset-4 col-sm-3">
					<!--data-whatever="@mdo"传递值，但是必须使用js来控制值得传递-->
					<a href="login.jsp" id="zhuce" type="button"
						class="btn btn-primary btn-block" data-toggle="modal"
						data-target="#loginForm">注册</a>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-3">
					<a href="ch">忘记密码？</a>
				</div>
			</div>
			
		</form>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">异地登陆，已发送验证码至邮箱，请输入验证</h4>
					</div>
					<div class="modal-body">
						<form role="form">
							<div class="form-group">
								<label for="code">输入验证码:</label> <input
									type="text" class="form-control" id="code">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="okcode">验证</button>
						<!-- <button type="button" class="btn btn-primary">Save</button> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="text-center"
		style="position: fixed;bottom: 0;left: 41%;">
		<span>All right belong lizhenyu&copy; 2018</span>
	</footer>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/scripts/jquery-3.1.1.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/scripts/bootstrap.js"></script>
	<script>
		$(function() {
	
			$("#zhuce").mouseover(function() {
				$("#getin").animate({
					opacity : '0.3',
				}, 1500);
			});
			$("#zhuce").mouseout(
				function() {
					$("#getin").animate({
						opacity : '1',
					}, 1500);
				});
			$("#zhuce").click(function() {
				window.location.href = "register";
			});
			$("#denglu").click(function(e) {
			e.preventDefault();
				var usm = $("#usm").val();
				var pwd = $("#pwd").val();
				if (usm == "") {
					$("#uu").removeClass("glyphicon-remove");
					$("#uu").removeClass("glyphicon-ok");
					$("#uu").removeClass("text-danger");
					$("#uu").addClass("glyphicon-remove");
					$("#uu").addClass("text-danger");
				}
				if (pwd == "") {
					$("#pp").removeClass("glyphicon-remove");
					$("#pp").removeClass("glyphicon-ok");
					$("#pp").removeClass("text-danger");
					$("#pp").addClass("glyphicon-remove");
					$("#pp").addClass("text-danger");
				}
	
				if ($("#uu").hasClass("glyphicon-ok") && $("#pp").hasClass("glyphicon-ok")) {
					var server = location.pathname.split('/')[1];
					var web = "http://"+location.host+"/"+server+"/content/index";
					window.location.href = web ;
				}
			});
	
			//ajax动态查数据库之查询username
			$("#pwd").keyup(function(e) {
				lastTime = e.timeStamp;
				setTimeout(function() {
					if (lastTime - e.timeStamp == 0) {
						var usm = $("#usm").val();
						var pwd = $("#pwd").val();
						$.ajax({
							type : "post",
							url : "check",
							dataType : "text",
							data : {
								"usm" : usm,
								"pwd" : pwd
							},
							async : true,
							success : function(data) {
								//alert("sucess data is "+data+typeof(data)+" length="+data.length);
								data = JSON.parse(data);
								if (data.status === "1") {
									$("#uu").removeClass("glyphicon-remove");
									$("#uu").removeClass("glyphicon-ok");
									$("#uu").removeClass("text-danger");
									$("#uu").addClass("glyphicon-remove");
									$("#uu").addClass("text-danger");
									$("#pp").removeClass("glyphicon-remove");
									$("#pp").removeClass("glyphicon-ok");
									$("#pp").removeClass("text-danger");
									$("#pp").addClass("glyphicon-remove");
									$("#pp").addClass("text-danger");
	
								} else if(data.status === "0"){
									$("#pp").removeClass("glyphicon-remove");
									$("#pp").removeClass("glyphicon-ok");
									$("#pp").removeClass("text-danger");
									$("#pp").addClass("glyphicon-ok");
									$("#biaoji").val(data.status);
									$("#uu").removeClass("glyphicon-remove");
									$("#uu").removeClass("glyphicon-ok");
									$("#uu").removeClass("text-danger");
									$("#uu").addClass("glyphicon-ok");
								}else{
								id = data.user.id;
								$("#denglu").prop("disabled","disabled");
								var random = Math.random();
									$.ajax({
					type : "post",
					url : "getCode",
					async : true,
					data : {
								"email" : data.user.email,
								"random" : random
							},
					success : function(data) {
					
					}
				});	
				//异地登陆，验证邮箱
				$('#myModal').modal('show');
				$("#okcode").click(function(){
				var val = $("#code").val();
				$.ajax({
					type : "post",
					url : "sendCode",
					async : true,
					data : {
								"random" : random
							},
					success : function(data){
					if(data.trim().toLowerCase() == val){
					
					$.ajax({type : "post",
					url : "addUserId",
					async : true,
					data: {"id":id}});
					
					
						$("#denglu").removeAttr("disabled")
						$('#myModal').modal('hide');
						$("#pp").removeClass("glyphicon-remove");
									$("#pp").removeClass("glyphicon-ok");
									$("#pp").removeClass("text-danger");
									$("#pp").addClass("glyphicon-ok");
									$("#biaoji").val(data.status);
									$("#uu").removeClass("glyphicon-remove");
									$("#uu").removeClass("glyphicon-ok");
									$("#uu").removeClass("text-danger");
									$("#uu").addClass("glyphicon-ok");
					}else{
						
					}
					}		
				});
				});
								}
	
							},
							error : function() {
								var bewele = document.createElement("h2");
								bewele.innerHTML = "出现故障";
								bewele.setAttribute("class", "text-danger");
								bewele.style.margin = "0 auto";
								$(".container").append(bewele);
							}
						});
					}
				}, 800);
			});
	
			/* $("#usm").keyup(function(e) {
				lastTimet = e.timeStamp;
				setTimeout(function() {
					if (lastTimet - e.timeStamp == 0) {
						var usm = $("#usm").val();
						var pwd = $("#pwd").val();
	
						$.ajax({
							type : "post",
							url : "check",
							dataType : "text",
							data : {
								"usm" : usm
							},
							async : true,
							success : function(data) {
								//alert("sucess data is "+data+typeof(data)+" length="+data.length);
								if ("1" === data) {
	
									$("#uu").removeClass("glyphicon-remove");
									$("#uu").removeClass("glyphicon-ok");
									$("#uu").removeClass("text-danger");
									$("#uu").addClass("glyphicon-ok");
	
								} else {
	
									$("#uu").removeClass("glyphicon-remove");
									$("#uu").removeClass("glyphicon-ok");
									$("#uu").removeClass("text-danger");
									$("#uu").addClass("glyphicon-remove");
									$("#uu").addClass("text-danger");
								}
							},
							error : function() {
								var bewele = document.createElement("h2");
								bewele.innerHTML = "出现故障";
								bewele.setAttribute("class", "text-danger");
								bewele.style.margin = "0 auto";
								$(".container").append(bewele);
							}
						});
					}
				}, 1500);
			});
	 */
		});
	</script>

</body>

</html>