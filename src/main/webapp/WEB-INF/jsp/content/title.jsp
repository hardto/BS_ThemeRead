<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>标题-毕设</title>
    <link href="${pageContext.request.contextPath}/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/resource/scripts/jquery-3.0.0.js"></script>

    <!-- Custom Theme files -->
    <link href="${pageContext.request.contextPath}/resource/css/content/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Training Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
    <link href="${pageContext.request.contextPath}/resource/css/content/lrtk.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/content/lrtk.js"></script>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!--Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Asap:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Kreon:400,700,300' rel='stylesheet' type='text/css'>
    <!-- start-smoth-scrolling -->
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
    <!-- //end-smoth-scrolling -->
    <script src="${pageContext.request.contextPath}/resource/scripts/bootstrap.min.js"></script>
    <style>
        #ding {
            margin-top: 80px;
        }

        .banner {
            margin-top: -50px;
        }

        html, body {
            background-color: #ffffff !important;
        }

        .main {
            width: 800px;
            zoom: 1;
            margin: 0 auto;
        }

        .item {
            width: 800px;
            overflow: hidden;
        }

        .main ul {
            padding: 0;
            width: 860px;
            zoom: 1;
        }

        .clear {
            zoom: 1;
        }

        .clear:after {
            content: "";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }

        .main ul li {
            list-style-type: none;

            background: 99CCFF;
            font-size: 30px;
            text-shadow: 1px 1px 3px #555;
            width: 570px;
            height: 70px;
            margin: 10px 40px 10px 0;
            line-height: 70px;
            text-align: center;
            color: #fff;
        }

        .page_btn {
            padding-top: 20px;
        }

        .page_btn a {
            cursor: pointer;
            padding: 5px;
            border: solid 1px #ccc;
            font-size: 12px;
        }

        .page_box {
            float: right;
        }

        .num {
            padding: 0 10px;
        }
        header h2,header h4{
        	display: inline;
        }

		.loading {
    width: 160px;
    height: 56px;
    position: absolute;
    top: 50%;
    left: 50%;
    line-height: 56px;
    color: #fff;
    padding-left: 60px;
    font-size: 15px;
    background: #000 url(../loading/image/loading.gif) no-repeat 10px 50%;
    opacity: 0.7;
    z-index: 9999;
    -moz-border-radius: 20px;
    -webkit-border-radius: 20px;
    border-radius: 20px;
    filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70);
}
    </style>
</head>
<body onload="afterLoad()">
<!--header start here-->
<div class="banner">
    <div class="container">
        <div class="header">
            <div class="col-md-7 logo">
                <a href="index.html"><h1>Theme-Reading</h1></a>
            </div>
            <div class="col-md-5 details">
                <h2 class="pull-right" style="letter-spacing: 15px">主题阅读</h2>

                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="top-nav">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
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
                    <li class=""><a href="robot">Robe</a></li>
                </ul>
            </div>
        </div>
        <div class="banner-bottom">
            <div class="bann-para" id="recommend">
               
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
                <h3>搜索结果</h3>
            </div>
            <div class="wel-bottom">
                <div class="common">

                    <div id="ding"></div>

                    <header class="page-header hidden-xs">
                        <h2>
                            <small>当前位置：</small>
                        </h2>
                    </header>

                    <div class="container-fluid" style="height: 100%;">
                        <div class="row" style="height: 100%;">
                            <div class="col-sm-3">

                            </div>
                            <div class="col-sm-6" style="border-left:1px dashed gray;border-right:1px dashed gray;">

                                <!--<div class="result"><div class="well">sdbJKDJASDHBASHDHDGFIAJSD
                                </div></div>-->
                                <div class="main">
                                    <div class="item">
                                        <ul class="clear">

                                        </ul>
                                    </div>
                                    <div class="page_btn clear">
   <span class="page_box">
    <a class="prev">上一页</a><span class="num"><span class="current_page">1</span><span
           style="padding:0 3px;">/</span><span class="total"></span></span><a class="next">下一页</a>
   </span>
                                    </div>
                                </div>
                                <!--main-->


                            </div>
                            <div class="col-sm-3">

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<div id="myModal" class="modal fade" data-keyboard="false"
            data-backdrop="static" data-role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div id="loading" class="loading">加载中。。。</div>
</div>

<script type="text/x-jquery-tmpl" id="t3">
			<!--//模板在jsp中需要转义-->
			<h2>${'${'}mainTitle}</h2>
				<p>${'${'}subTitle}
				</p>
</script>		
<script type="text/javascript">
    $(document).ready(function () {
    	$('#myModal').modal('show');
        value = window.location.search.split("=")[1]
        var url = "http://" +location.hostname+":8888"+"/resource?type="+value;
		
		var server = location.pathname.split('/')[1];
		var web = "http://"+location.host+"/"+server+"/content/posoition";
	var web2 = "http://"+location.host+"/"+server+"/content/getRecommend";
	console.log(web2);
		 $.ajax({
            type: "post",
            url: web2,
            timeout : 3000,
            async: false,
            dataType: "json",
            success: function(data){
            debugger;
            	$("#t3").tmpl(data).appendTo($("#recommend"));   
            	$("#recommend+a").prop("href","readRecommend?id="+data.id);			
            }});
		$.ajax({
            type: "get",
            url: web,
            async: false,
            data : {
            	"name" : decodeURI(value)
            },
            success: function(data){
             	$("<a href='categories?id=5'><h4>"+data+"</h4></a>&nbsp;&nbsp;>&nbsp;>&nbsp;&nbsp;<h4>"+decodeURI(value)+"</h4>").appendTo($("header"));
             }
        });
        var stringData = sessionStorage.getItem(decodeURI(value));
        if(stringData==null || stringData == "" ){
        	$.ajax({
            type: "get",
            url: url,
            async: false,
            dataType: 'jsonp',
            jsonpCallback: "dealData",
             success: function(data){
            
             }
        });
        	
        }else{
        dealData(JSON.parse(stringData));
        }
        


    });
    function dealData(data){
    
    	sessionStorage.setItem(decodeURI(value), JSON.stringify(data));
        debugger;
        var json = data.data[decodeURI(value)]
			debugger;
            for(var key in json){
                if(key.indexOf("img") == -1 && key!=""){
                    if("名著" == decodeURI(value)){
                    $("<li><a href='readArticles?title="+key+"&type="+value+"'>"+key+"</a></li>").appendTo($("ul.clear"));
                    }else{
                    $("<li><a href='readNews?title="+key+"&type="+value+"'>"+key+"</a></li>").appendTo($("ul.clear"));
                    }
                }


            }
        afterLoad();

    }
    function afterLoad(){
        $(".main ul li:gt(3)").hide();//初始化，前面4条数据显示，其他的数据隐藏。
        var total_q = $(".main ul li").length;//总数据
        var current_page = 4;//每页显示的数据
        var current_num = 1;//当前页数
        var total_page = Math.ceil(total_q / current_page);//总页数
        var next = $(".next");//下一页
        var prev = $(".prev");//上一页
        $(".total").text(total_page);//显示总页数
        $(".current_page").text(current_num);//当前的页数
        //下一页
        $(".next").click(function () {
            if (current_num == total_page) {
                return false;//如果大于总页数就禁用下一页
            }
            else {
                $(".current_page").text(++current_num);//点击下一页的时候当前页数的值就加1
                $.each($('.main ul li'), function (index, item) {
                    var start = current_page * (current_num - 1);//起始范围
                    var end = current_page * current_num;//结束范围
                    if (index >= start && index < end) {//如果索引值是在start和end之间的元素就显示，否则就隐
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });
            }
        });
        //上一页方法
        $(".prev").click(function () {
            if (current_num == 1) {
                return false;
            } else {
                $(".current_page").text(--current_num);
                $.each($('.main ul li'), function (index, item) {
                    var start = current_page * (current_num - 1);//起始范围
                    var end = current_page * current_num;//结束范围
                    if (index >= start && index < end) {//如果索引值是start和end之间的元素就显示，否则就隐藏
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });

            }


        });
         $('#myModal').modal('hide');
    }
</script>
<!--/copy rights-->
</body>
</html>