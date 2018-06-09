<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <link href="http://libs.baidu.com/fontawesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <script src="${pageContext.request.contextPath}/resource/scripts/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/scripts/bootstrap.min.js"></script>
    <title>阅读-毕设</title>
    <style>
    .fa-heart{
color:red

}
        html,body{
            padding: 0 0;
            width: 100%;
            height: 100%;
            background-color: #ede8d5;
        }
        .papa{
            height: 100%;
            width: 60%;
            margin: 0 auto;
            background-color: #faf7ed;
        }
        #titletop{
            border: 1px solid #d4d0be;
            margin: 0 auto;
            margin-top: 2px;
            width: 70%;
            opacity: 0.7;
        }
        .position{
            height: 25px;
            line-height: 25px;
        }
        .title{
            margin: 0 auto;
            margin-top: 5px;
            width: 70%;
            height: 25px;
            line-height: 25px;
            color: #cccccc;
            font-size: 1.5em;
        }
        .position h4{
            display: inline;
        }

        .article{
            margin: 0 auto;
            margin-top: 15px;
            width: 70%;
            height: 80%;
            color: #333333;
            font-size: 1.5em;
            line-height: 50px;
        }
        .footer{
            margin: 0 auto;
            width: 70%;
            height: 45px;
            line-height: 45px;
        }
        .footer h4{
            color: #cccccc;
            display: inline;
        }
        
      /*   如果想整个页面滚动条，就换成html/body */
		div.article{
			 overflow:auto;
		}
    </style>
</head>
<body>
    <div class="papa">
        <div class="position">
        </div>
        <div class="title">
            
        </div>
        <div id="titletop">
        </div>
        <div class="article">

        </div>
        <div class="footer" >
            <span>来源于网络</span>&nbsp;&nbsp;<a href="javascript:void(0)" style="margin-left: 75%">
            
            <i class="fa fa-heart-o heart"  trans=""></i>
            
            </a>
        </div>
    </div>
<script>
    $(function () {
    	var server = location.pathname.split('/')[1];
		var web = "http://"+location.host+"/"+server+"/content/posoition";
		var saveUrl = "http://"+location.host+"/"+server+"/content/saveArticle";
		var values = decodeURI(window.location.search.split("&")[1])
     	var value = decodeURI(window.location.search.split("&")[0]).split("=")[1];
     	var type = values.split("=")[1];
     	$("div.title").text(value);
     	$("i.fa").prop("trans",type);
		$.ajax({
            type: "get",
            url: web,
            async: false,
            data : {
            	"name" : type
            },
            success: function(data){
             	$("<h4><a href='categories?id=5'>"+data+"</a></h4>&nbsp;&nbsp;>&nbsp;>&nbsp;&nbsp;<h4><a href='title?type="+type+"'>"+type+"</a></h4>").appendTo($("div.position"));
             }
        });
    debugger;
     	
        //var rowNum=Math.round($(".article")[0].height()/parseFloat($(".article").css('line-height')));
   		var stringData = sessionStorage.getItem(type);//获取键为allJson的字符串  
		var jsonData = JSON.parse(stringData);//将字符串抓换成对象 
		var article = jsonData.data[type][value];
		//var imgs = jsonData.data[type][value+"img"];
		//将文字经过处理 放在不同的li上！
		//文字处理：每一行判断
		$("div.article").html(article);
        $("i.fa").click(function(){
        if($(this).hasClass('fa fa-heart-o')){
		   $(this).removeClass('fa fa-heart-o');
		   $(this).addClass('fa fa-heart');
		  
		}
		debugger;
        	$.ajax({
            type: "post",
            url: saveUrl,
            async: false,
            data : {
            	"content" : article,
            	"type" : type,
            	"title" : value
            },
            success: function(data){
             	
             }
        });
		
        
        });
		
    });
</script>
</body>
</html>