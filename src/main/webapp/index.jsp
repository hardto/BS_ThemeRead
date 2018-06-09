<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 HttpSession s = request.getSession(); 
if(null != s.getAttribute("USERID") && !"".equals(s.getAttribute("USERID"))){
	response.sendRedirect("content/index"); 
}
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta name="descrition" content="BS_lizhenyu">
<meta name="author" content="lizhenyu">
<meta name="revised" content="li zhen yu 2018-4-5">
<meta name="generator" content="WebStorm10.0.4">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>首页-毕设</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/bootstrap.css" />

<script
	src="${pageContext.request.contextPath}/resource/scripts/jquery-1.11.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/scripts/unslider.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/scripts/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/scripts/jquery.tmpl.js"></script>
<style>
html,body {
           width:100%;
        }
#index1 {
	background-image:
		url("${pageContext.request.contextPath}/resource/images/bk1.jpg");
	background-position: center center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	background-color: #464646;
}

#index2 {
	background-position: center center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	background-color: #ADD8E6;
}

html, body {
	font-family: Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana,
		sans-serif;
	/*margin:0 auto;
            padding:0;
            height: 100%;*/
}

ul, ol {
	padding: 0;
}

.banner, #index2 {
	position: relative;
	overflow: auto;
	text-align: center;
}

.banner li, #index2 li {
	list-style: none;
}
.banner li{
	position:relative;
}
.banner ul li, #index2 ul li {
	float: left;
}

#index2 ul li {
	margin-left: 20px;
}

#index1 {
	height: 635px;
}

#b04 {
	width: 680px;
}

#b04 .dots {
	position: absolute;
	left: 0;
	right: 0;
	bottom: -15px;
}

#b04 .dots li {
	display: inline-block;
	width: 15px;
	height: 15px;
	margin: 0 4px;
	text-indent: -999em;
	border: 3px solid #fff;
	border-radius: 10px;
	cursor: pointer;
	opacity: .8;
	-webkit-transition: background .5s, opacity .5s;
	-moz-transition: background .5s, opacity .5s;
	transition: background .5s, opacity .5s;
}

#b04 .dots li.active {
	background: #fff;
	opacity: 1;
}

.arrow {
	position: absolute;
	top: 200px;
}

#al {
	left: 15px;
}

#ar {
	right: 15px;
}

#index2 ul li {
	position: relative;
}

.banner .inner {
	position: absolute;
	top: 7px;
	left: 290px;
}

#index2 .inner {
	padding : 0;
	position: absolute;
	top: 1px;
	left: 65px;
}

#index1>div, #index2>div {
	margin: auto;
	margin-top: 13px;
}

#index2>div {
	height: 555px;
}

h1{
	letter-spacing: 75px;
}
#index2 h2{
	letter-spacing: 45px;
}

#myCanvas2 {
	width: 100%;
	height: 62px;
}
</style>
</head>
<body onload="doSlide()">
	<div id="index1">
		<canvas id="myCanvas" width="100%" height="62">
    </canvas>

		<a href="javascript:void(0);" class="unslider-arrow04 prev"><img
			class="arrow" id="al"
			src="${pageContext.request.contextPath}/resource/images/arrowl.png"
			alt="prev" width="35" height="70"></a>

		<div class="banner" id="b04">
			<ul>
				<%-- <li>
                <a href="#" class="thumbnail"><img src="${pageContext.request.contextPath}/resource/images/01.jpg" alt="" width="680" height="500" ></a>
                <div class="inner">
                    <h1>这个是类别</h1>
                </div>
            </li>
            <li>
                <a href="#" class="thumbnail"><img src="${pageContext.request.contextPath}/resource/images/02.jpg" alt="" width="680" height="500" ></a>
            </li>
            <li>
                <a href="#" class="thumbnail"><img src="${pageContext.request.contextPath}/resource/images/03.jpg" alt="" width="680" height="500" ></a>
            </li>
            <li>
                <a href="#" class="thumbnail"><img src="${pageContext.request.contextPath}/resource/images/04.jpg" alt="" width="680" height="500" ></a>
            </li>
            <li>
                <a href="#" class="thumbnail"><img src="${pageContext.request.contextPath}/resource/images/05.jpg" alt="" width="680" height="500" ></a></li>
 --%>
			</ul>

		</div>
		<a href="javascript:void(0);" class="unslider-arrow04 next"><img
			class="arrow" id="ar"
			src="${pageContext.request.contextPath}/resource/images/arrowr.png"
			alt="next" width="35" height="70"></a>

	</div>
	<div id="index2">
		<canvas id="myCanvas2" width="1366" height="62">
        <!--e5e4d2-->
    </canvas>
		<div class="container" style="position: relative">
			<ul>
				<%--   <li>
                <a href="#" class="thumbnail"><img src="${pageContext.request.contextPath}/resource/images/01.jpg" alt="" width="250" height="250" ></a>
                <div class="inner">
                    <h1>这个是类别</h1>
                </div>
            </li>
            <li>
                <a href="#" class="thumbnail"><img src="${pageContext.request.contextPath}/resource/images/02.jpg" alt="" width="250" height="250" ></a>
            </li>
            <li>
                <a href="#" class="thumbnail"><img src="${pageContext.request.contextPath}/resource/images/03.jpg" alt="" width="250" height="250" ></a>
            </li>
            <li>
                <a href="#" class="thumbnail"><img src="${pageContext.request.contextPath}/resource/images/04.jpg" alt="" width="250" height="250" ></a>
            </li>
            <li>
                <a href="#" class="thumbnail"><img src="${pageContext.request.contextPath}/resource/images/05.jpg" alt="" width="250" height="250" ></a></li>
 --%>
			</ul>

		</div>


	</div>
	<script type="text/x-jquery-tmpl" id="t1">
			<li>
                <a href="user/login" class="thumbnail"><img src="${pageContext.request.contextPath}/${'${'}col}" alt="" width="680" height="500" ></a>
                <div class="inner">
                    <h1 class="text-primary">${'${'}name}</h1>
                </div>
            </li>
</script>
	<script type="text/x-jquery-tmpl" id="t2">
			<li>
                <a href="user/login" class="thumbnail"><img src="${pageContext.request.contextPath}/${'${'}col}" alt="" width="250" height="250" ></a>
                <div class="inner">
                    <h2 class="text-primary">${'${'}name}</h2>
                </div>
            </li>
</script>
	<script type="text/javascript">
    $(document).ready(function(e) {
    var server = location.pathname.split('/')[1];
	var web = "http://"+location.host+"/"+server+"/index/types";
        $.ajax({
            type: "post",
            url: web,
            timeout : 3000,
            async: false,
            dataType: "json",
            success: function(data){
            	/* data = JSON.parse(data); */
            	$("#t1").tmpl(data.types).appendTo($("#b04 ul"));
            	$("#t2").tmpl(data.types).appendTo($("#index2 div ul"));
            }
        });
         $("#index1").show();
         $("#index2").hide();
        flagv = 0;
        //切换
        $("body").click(function (e) {
            //debugger;
            //alert(e.pageX+"========="+ e.pageY+"-------"+$(document.body).width()+"=="+$(document.body).height());
            if(e.pageY<62 && ($(document.body).width()- e.pageX)<62){
                if(flagv!=0){
                    flagv--;
                }else{
                    flagv++;
                }
                if(flagv!=0){
                    $("#index1").hide();
                    $("#index2").show();
                    /*$("#index1").removeClass("show hidden");
                    $("#index1").addClass("hidden");
                    $("#index2").removeClass("hidden show");
                    $("#index2").addClass("show");*/
                }else{
                    $("#index2").hide();
                    $("#index1").show();
                    /*$("#index2").removeClass("show hidden");
                    $("#index2").addClass("hidden");
                    $("#index1").removeClass("hidden show");
                    $("#index1").addClass("show");*/
                }
            }
        });
        window.onload = function (){
        	var unslider04 = $('#b04').unslider({
                    dots: true,
                    speed : 2000,//切换速度
                    /*complete: function() {},*/
                    delay : 3000//速度
                }),
                data04 = unslider04.data('unslider');
        		console.log(unslider04.data('unslider'));/*全部都是string-fn这样形式的数组*/

		        $('.unslider-arrow04').click(function() {
		            console.log(this.className);
		            var fn = this.className.split(' ')[1];/*unslider-arrow04 next*/
		            data04[fn]();
		        });
        }

    });
</script>
	<script type="text/javascript">
	var wid = document.body.clientWidth;
    var ctx=document.getElementById("myCanvas").getContext("2d");
    ctx.beginPath();
    ctx.moveTo(wid+11-64,0);
    ctx.lineTo(wid+11,0);
    ctx.lineTo(wid+11,64);
    ctx.closePath();
    ctx.fillStyle = 'rgba(173,216,230,0.5)';
    // 填充路径
    ctx.fill();
    ctx.beginPath();
    ctx.moveTo(wid+10-64,0);
    ctx.lineTo(wid+10-64,64);
    ctx.lineTo(wid+10,64);
    ctx.closePath();
    ctx.fillStyle = 'rgba(255,255,255,0.5)';
    // 填充路径
    ctx.fill();

    var ctx2=document.getElementById("myCanvas2").getContext("2d");
    ctx2.beginPath();
    ctx2.moveTo(1304,0);
    ctx2.lineTo(1366,0);
    ctx2.lineTo(1366,62);
    ctx2.closePath();
    ctx2.fillStyle = 'rgba(229,228,210,0.9)';
    // 填充路径
    ctx2.fill();
    ctx2.beginPath();
    ctx2.moveTo(1304,0);
    ctx2.lineTo(1304,62);
    ctx2.lineTo(1366,62);
    ctx2.closePath();
    ctx2.fillStyle = 'rgba(255,255,255,0.5)';
    // 填充路径
    ctx2.fill();
</script>

</body>
</html>