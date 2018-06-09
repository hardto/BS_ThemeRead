<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>会员首页-毕设</title>
<link href="${pageContext.request.contextPath}/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/resource/scripts/jquery-1.11.1.min.js"></script>
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/resource/css/content/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Training Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Asap:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Kreon:400,700,300' rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
<!-- //end-smoth-scrolling -->
<script src="${pageContext.request.contextPath}/resource/scripts/bootstrap.min.js"></script>
<style type="text/css">
 .banner {
            margin-top: 0px;
        }
</style>
</head>
<body>
<!--header start here-->
<div class="banner">
	<div class="container">
		<div class="header">
			<div class="col-md-5 logo">
				<a href="index.html"><h1>Theme-Reading</h1></a>
			</div>
			<div class="col-md-5 details">
				<!-- <h2 class="pull-right" style="letter-spacing: 15px">主题阅读</h2> -->
				<form action="others" method="post" class="navbar-form navbar-left form-inline">
                        <div class="form-group has-feedback">
                            <input style="padding-left: 30px;" type="text" class="form-control" name="music" placeholder="缓存检索，请输入类别" id="music">
                        	<span style="color: #000000;" class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                        <button type="submit" class="btn btn-success" id="musicsubmit">检索</button>
                </form>
				<div class="clearfix"> </div>
			</div>
			<div class="col-md-2 logo" style="margin-top:25px">
				<h4>欢迎您，<a href="mine#section1">${sessionScope.USERNAME}</a></h4>
			</div>
			<div class="clearfix"> </div>
		</div>
		<div class="top-nav">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="home"><a href="index" style="letter-spacing: 5px">首页</a></li>
					<li class=""><a href="index#collection" style="letter-spacing: 5px">收藏</a></li>
					<li class=""><a href="all" style="letter-spacing: 5px">所有</a></li>
					<li class=""><a href="others" style="letter-spacing: 5px">其他</a></li>
					<li class=""><a href="robot" >Robe</a></li>
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
			<div class="bann-para" id="recommend">
				<!-- <h2>Though hundreds of thousands had done their very best to disfigure the small piece of land on which they were crowded together, by paying the ground with stones, scraping away every vestige of vegetation, cutting down the trees, turning away birds and beasts,
					and filling the air with the smoke of naphtha and coal, still spring was spring, even in the town.</h2>
				<p>尽管出土的小草都被清除。
					尽管煤炭和石油燃烧的浓烟四处弥漫。
					尽管树木被滥伐，鸟兽被驱逐。
					即使在这样的城市里，春天仍然是春天.
				</p> -->
			</div>
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
				<h3>智能推送，火热类别</h3>
			</div>
			<div class="wel-bottom">
				<div class="col-md-6 wel-left" id="left1">
					<%-- <div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w6.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w2.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div> --%>
				</div>
				<div class="col-md-6 wel-right" id="right1">
					<%-- <div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w3.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w5.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div> --%>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
</div>
<!--welcome end here-->
<!--testimonial start here-->
<div class="testimo" id="collection" name="collection">
	<div class="container">
		<div class="testimo-main">
			<h3>为您呈现最好的阅读体验</h3>
			<p>下面是您收藏过的类别</p>
		</div>
	</div>
</div>
<!--testimonial end here-->
<!--our admissions start here-->
<div class="admission">
	<div class="container">
		<div class="admissions-main">
			<div class="admission-top">
				<h3>收藏类别</h3>
			</div>
			<div class="admission-bottom">
				<div class="col-md-6 wel-left" id="left2">
					<%-- <div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w6.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w2.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div> --%>
				</div>
				<div class="col-md-6 wel-right" id="right2">
					<%-- <div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w3.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w5.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div> --%>
				</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
			<div class="admission-top" style="margin-top:150px">
				<h3>收藏文章</h3>
			</div>
			<div class="admission-bottom">
				<div class="col-md-6 wel-left" id="left3">
					<%-- <div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w6.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w2.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div> --%>
				</div>
				<div class="col-md-6 wel-right" id="right3">
					<%-- <div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w3.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="wel-block">
						<div class="wel-img">
							<img src="${pageContext.request.contextPath}/resource/images/w5.jpg" alt="" class="img-responsive">
						</div>
						<div class="wel-text">
							<h4>Temporibus autem</h4>
							<p>To take a trivial example, which of us ever undertakes laborious physical exercise</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div> --%>
				</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
			
		</div>
	</div>
</div>
<!--our admissions end here-->
<!--copy right-->
<div class="copy-rights">
	<div class="container">
		<div class="copy-rights-main">
			<p>Copyright &copy; 2018.designed by li zhenyu</p>
		</div>
	</div>
</div>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/scripts/jquery.tmpl.js"></script>
<script type="text/x-jquery-tmpl" id="t1">
					<div class="wel-block">
						<div class="wel-img">
							<a href="categories?id=${'${'}id}" ><img src="${pageContext.request.contextPath}/${'${'}col}" alt="" class="img-responsive"></a>
						</div>
						<div class="wel-text">
							<h4>${'${'}name}</h4>
							<p>${'${'}descs}</p>
						</div>
						<div class="clearfix"> </div>
					</div>
</script>

<script type="text/x-jquery-tmpl" id="t3">
			<!--//模板在jsp中需要转义-->
			<h2>${'${'}mainTitle}</h2>
				<p>${'${'}subTitle}
				</p>
</script>		

<script type="text/x-jquery-tmpl" id="t2">
					<div class="wel-block">
						<div class="wel-img">
<a href="categories?id=${'${'}id}">
							<img src="${pageContext.request.contextPath}/${'${'}col}" alt="" class="img-responsive">
</a>
						</div>
						<div class="wel-text">
							<h4>${'${'}name}</h4>
							<p>${'${'}descs}</p>
						</div>
						<div class="clearfix"> </div>
					</div>
</script>
<script type="text/x-jquery-tmpl" id="t4">
					<div class="wel-block">
						<div class="wel-img">
							<a href="title?type=${'${'}name}" ><img src="${pageContext.request.contextPath}/${'${'}col}" alt="" class="img-responsive"></a>
						</div>
						<div class="wel-text">
							<h4>${'${'}name}</h4>
							<p>${'${'}descs}</p>
						</div>
						<div class="clearfix"> </div>
					</div>
</script>
<script type="text/x-jquery-tmpl" id="t5">
					<div class="wel-block">
						<div class="wel-img">
<a href="title?type=${'${'}name}">
							<img src="${pageContext.request.contextPath}/${'${'}col}" alt="" class="img-responsive">
</a>
						</div>
						<div class="wel-text">
							<h4>${'${'}name}</h4>
							<p>${'${'}descs}</p>
						</div>
						<div class="clearfix"> </div>
					</div>
</script>

<!-- 文章部分 -->
<script type="text/x-jquery-tmpl" id="t6">
					<div class="wel-block">
						<div class="wel-img">
							<a href="selfread?title=${'${'}title}&type=${'${'}type}" ><img src="${pageContext.request.contextPath}/${'${'}img}" alt="" class="img-responsive"></a>
						</div>
						<div class="wel-text">
							<h4>${'${'}title}</h4>
							<p>${'${'}time}</p>
						</div>
						<div class="clearfix"> </div>
					</div>
</script>
<script type="text/x-jquery-tmpl" id="t7">
					<div class="wel-block">
						<div class="wel-img">
<a href="selfread?title=${'${'}title}&type=${'${'}type}">
							<img src="${pageContext.request.contextPath}/${'${'}img}" alt="" class="img-responsive">
</a>
						</div>
						<div class="wel-text">
							<h4>${'${'}title}</h4>
							<p>${'${'}time}</p>
						</div>
						<div class="clearfix"> </div>
					</div>
</script>













<script type="text/javascript">
	$(document).ready(function(e) {
	console.log($.trim($("#recommend h2").text()).replace(/[\r\n]/g,"").length+"===="+$.trim($("#recommend p").text()).replace(/[\r\n]/g,"").length);
	var server = location.pathname.split('/')[1];
	var indexUrl = "http://"+location.host+"/"+server;
	var web = "http://"+location.host+"/"+server+"/index/types";
	var web2 = "http://"+location.host+"/"+server+"/content/getRecommend";
	var webCollect = "http://"+location.host+"/"+server+"/content/getCollectsToTypes";
	var articleUrl = "http://"+location.host+"/"+server+"/content/getCollected";
	var reset = "http://"+location.host+"/"+server+"/content/logout";
	var getRedisUrl = "http://"+location.host+"/"+server+"/content/getRedis";
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
	console.log(web2);
		 $.ajax({
            type: "post",
            url: web2,
            timeout : 3000,
            async: false,
            dataType: "json",
            success: function(data){
            	$("#t3").tmpl(data).appendTo($("#recommend"));   
            	$("#recommend+a").prop("href","readRecommend?id="+data.id);			
            }});
	 $("#musicsubmit").click(function(e){
	 e.preventDefault()
	 		var val = $("#music").val();
	 		//简单的排除工作
	 		if(val.lenght>4 || val.length <2){
	 			alert("对不起，本站不支持此类别");
	 		}else{
	 			$.ajax({
            type: "post",
            url: getRedisUrl,
            timeout : 3000,
            async: false,
            success: function(data){
            debugger;
            	
            	for(var i=0,l=data.length;i<l;i++){
					var item = $.parseJSON(data[i]);
					var keys = item.data;
　　					for(var key in keys){
						if(val == key){
							sessionStorage.setItem(val+"h", data[i]);  
							var server = location.pathname.split('/')[1];
							window.location.href="http://"+location.host+"/"+server+"/content/title?type="+val;
							return;
						}

　　			}
}
alert("对不起，您没有访问记录，无法访问缓存内容");
            	//sessionStorage.getItem(decodeURI(value)+"h");			
            }});
	 		}
            	
            });
	
		 $.ajax({
            type: "post",
            url: web,
            timeout : 3000,
            async: false,
            dataType: "json",
            success: function(data){
            var flag=0;
            	for(var i=0;i<data.types.length;i++){
            		if(data.types[i].hot == "0"){
            			flag++;
            			if(flag % 2 ==0){
			            	$("#t1").tmpl(data.types[i]).appendTo($("#left1"));
            			}else{
							$("#t2").tmpl(data.types[i]).appendTo($("#right1"));            			
            			}
            		}
            	}
            }});
            
            
            $.ajax({
            type: "post",
            url: webCollect,
            timeout : 3000,
            async: false,
            dataType: "json",
            success: function(data){
            var flag=0;
            	for(var i=0;i<data.types.length;i++){
            			flag++;
            			if(flag % 2 ==0){
			            	$("#t4").tmpl(data.types[i]).appendTo($("#right2"));
            			}else{
							$("#t5").tmpl(data.types[i]).appendTo($("#left2"));            			
            			}
            	}
            }});
            
            
            
            
            $.ajax({
            type: "post",
            url: articleUrl,
            timeout : 3000,
            async: false,
            dataType: "json",
            success: function(data){
            var flag=0;
            	for(var i=0;i<data.length;i++){
            			flag++;
            			if(flag % 2 ==0){
            			$("#t7").tmpl(data[i]).appendTo($("#right3"));
			            	
            			}else{
							      $("#t6").tmpl(data[i]).appendTo($("#left3"));      			
            			}
            	}
            }});
            
            
            
            
            setTimeout(function() {
            	var u = window.location.href;
            if(u.indexOf("#collection")!=-1){
            	$("html, body").animate({  
     scrollTop: $("#collection").offset().top }, {duration: 500,easing: "swing"});  
            }
            }, 1500);
	});
	
	
	
	
</script>
</body>
</html>