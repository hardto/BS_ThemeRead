<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>具体类别-毕设</title>
<link
	href="${pageContext.request.contextPath}/resource/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="${pageContext.request.contextPath}/resource/scripts/jquery-1.11.1.min.js"></script>
<!-- Custom Theme files -->
<link
	href="${pageContext.request.contextPath}/resource/css/content/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
 <link href="http://libs.baidu.com/fontawesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Training Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<link
	href="${pageContext.request.contextPath}/resource/css/content/lrtk.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/scripts/content/lrtk.js"></script>
<script type="application/x-javascript">addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!--Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Asap:400,700'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Kreon:400,700,300'
	rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- //end-smoth-scrolling -->
<script
	src="${pageContext.request.contextPath}/resource/scripts/bootstrap.min.js"></script>
<style type="text/css">
.banner {
	margin-top: -50px;
}
.fa-heart{
color:red

}
</style>
</head>
<body onload="addTime()">
	<!--header start here-->
	<div class="banner">
		<div class="container">
			<div class="header">
				<div class="col-md-7 logo">
					<a href="index.html"><h1>Theme-Reading</h1></a>
				</div>
				<div class="col-md-5 details">
					<!-- <h2 class="pull-right" style="letter-spacing: 15px">主题阅读</h2> -->
					<form action="others" method="post"
						class="navbar-form navbar-left form-inline">
						<div class="form-group has-feedback">
							<input style="padding-left: 30px;" type="text"
								class="form-control" name="music" placeholder="请输入检索信息"
								id="music"> <span style="color: #000000;"
								class="glyphicon glyphicon-search form-control-feedback"></span>
						</div>
						<button type="submit" class="btn btn-success" id="musicsubmit">检索</button>
					</form>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="top-nav">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="home"><a href="index" style="letter-spacing: 5px">首页</a></li>
						<li class=""><a href="index#collection"
							style="letter-spacing: 5px">收藏</a></li>
						<li class=""><a href="all" style="letter-spacing: 5px">所有</a></li>
						<li class=""><a href="others" style="letter-spacing: 5px">其他</a></li>
						<li class=""><a href="robot">Robe</a></li>
						<li class="dropdown">
						<a href="" style="letter-spacing: 5px" class="dropdown-toggle" data-toggle="dropdown">
							我的<span style="color: #CCCCCC;"class="caret"></span>
						</a>
						 <ul class="dropdown-menu">
                        	<li><a href="mine#section1">个人信息</a></li>
                        	<li class="divider"></li>
                        	<li><a href="mine#section2">反馈</a></li>
                        	<li class="divider"></li>
                        	<li><a href="javascript:void(0)" id="exit">退出</a></li>
                    	</ul>
					</li>
					</ul>
				</div>
			</div>
			<div class="banner-bottom">
				<div class="bann-para" id="recommend"></div>
				<a href="#">Read More</a>
			</div>
		</div>
	</div>
	<!--header strat here-->
	<!--welcome start here-->
	<div class="welcome">
		<div class="container">
			<div class="wel-main">
				<div class="wel-top">
					<h3>具体种类</h3>
				</div>
				<div class="wel-bottom">
					<div class="common">
						<ul>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resource/scripts/jquery.tmpl.js"></script>



	<script type="text/x-jquery-tmpl" id="t3">
			<!--//模板在jsp中需要转义-->
			<h2>${'${'}mainTitle}</h2>
				<p>${'${'}subTitle}
				</p>
</script>
	<script type="text/x-jquery-tmpl" id="t1">
	                    	                        <li class="listbox mr20">
                            <div class="listimg"><a href="title?type=${'${'}name}" title="" 
                                                    target="_blank"><img src="${pageContext.request.contextPath}/${'${'}col}"
                                                                         class="attachment-thumbnail wp-post-image"
                                                                         alt="${'${'}name}"/></a>

                                <div class="summary">
                                    <div class="summarytxt">
                                        <p>${'${'}descs}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="listinfo">
                                <div class="listtitle"><a href="title?type=${'${'}name}"
                                                          title="" target="_blank">${'${'}descs}</a>
                                </div>
                                <div class="listtag">
                                     <a href="title?type=${'${'}name}" rel="tag">${'${'}name}</a>
                                     <i class="fa fa-heart-o heart"  trans="${'${'}id}"></i>


                                </div>
                                <div class="listdate"></div>
                            </div>
                        </li>
</script>
	<script type="text/javascript">
	
		$(document).ready(function(e) {
	 	
	
		var server = location.pathname.split('/')[1];
		var web = "http://" + location.host + "/" + server + "/content/specialTypes";
		var web0 = "http://" + location.host + "/" + server + "/content/addCollect";
		var web01 = "http://" + location.host + "/" + server + "/content/getCollects";
		var reset = "http://"+location.host+"/"+server+"/content/logout";
	
	
	$("#exit").click(function(){
		 $.ajax({
            type: "post",
            url: reset,
            timeout : 3000,
            async: false,
            success: function(data){
            
            }});
            window.location.href=indexUrl;
	});
	
	
	
		$(document).on("click","i.heart",function(){
		var coid = $(this).attr("trans");
		 $.ajax({
				type : "post",
				url : web0,
				timeout : 3000,
				async : false,
				data : {"type" : coid},
				success : function(data) {
				}
			});
		
		debugger;
		if( $("li.heart").hasClass('fa fa-heart-o')){
		   $(this).removeClass('fa fa-heart-o');
		   $(this).addClass('fa fa-heart');
		  
		}else{
		    $(this).removeClass('fa fa-heart');
		   $(this).addClass('fa fa-heart-o');
		
		}
		window.location.reload();
			});	 
		
		
		
		
			
			var param = location.search;
			var pid = param.split("=")[1];
			var web2 = "http://" + location.host + "/" + server + "/content/getRecommend";
			console.log(web2);
			$.ajax({
				type : "post",
				url : web2,
				timeout : 3000,
				async : false,
				dataType : "json",
				success : function(data) {
					debugger;
					$("#t3").tmpl(data).appendTo($("#recommend"));
					$("#recommend+a").prop("href", "readRecommend?id=" + data.id);
				}
			});
			$("#musicsubmit").click(function(e) {
				window.location = "http://" + location.host + "/" + server + "/content/others?music=" + $("#music").val();
				e.preventDefault()
			});
			$.ajax({
				type : "post",
				url : web,
				timeout : 3000,
				async : false,
				dataType : "json",
				data : {
					"id" : pid
				},
				success : function(data) {
					$("#t1").tmpl(data.types).appendTo($(".common ul"));
				}
			});
			$.ajax({
				type : "post",
				url : web01,
				timeout : 3000,
				async : false,
				success : function(data) {
				var shuzu = data.types;
				debugger;
				for(var j=0;j<shuzu.length;j++){
					if(shuzu[j].col == "0"){
						jiahong(shuzu[j].typeId);			
						
					}
				}
				}
			});
	
	
		});
		function addTime() {
			var d = new Date();
			$(".listdate").html(d.getFullYear() + " - " + (d.getMonth() + 1));
			$('.listimg').hover(function() {
				$(".summary", this).stop().animate({
					top : '110px'
				}, {
					queue : false,
					duration : 180
				});
			}, function() {
				$(".summary", this).stop().animate({
					top : '165px'
				}, {
					queue : false,
					duration : 180
				});
			});
			var eles = $(".listtitle a");
			for (var i = 0; i < eles.length; i++) {
				if (eles[i].text.length > 17) {
					eles[i].innerHTML = eles[i].text.substring(0, 15) + "...";
				}
			}
		}
		function jiahong(id){
		debugger;
			$.each($("i.heart"),function(n,v){
			if($(v).attr("trans") == id){
			$(v).removeClass("fa-heart-o");
			$(v).addClass('fa fa-heart');
			}
			});
		}
	</script>

</body>
</html>