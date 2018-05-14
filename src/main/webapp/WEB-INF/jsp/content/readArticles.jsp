<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <script src="${pageContext.request.contextPath}/resource/scripts/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/scripts/bootstrap.min.js"></script>
    <title>阅读-毕设</title>
    <style>
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
            width: 85%;
            height: 85%;
            /* font-size: 1.5em;
            line-height: 50px; */
        }
        .footer{
        position : fixed;
        bottom : 20px;
            margin: 0 auto;
            width: 70%;
            height: 45px;
            line-height: 45px;
        }
        .footer h4,.footer a{
            color: #cccccc;
            display: inline;
        }
        
      /*   如果想整个页面滚动条，就换成html/body */
		div.article{
			 overflow:auto;
		}
		
		
		
		
        .main {
            width: 100%;
            height:100%;
            zoom: 1;
            margin: 0 auto;
        }

        .item {
            width: 100%;
            height:100%;
            overflow: hidden;
        }

        .main ul {
            padding: 0;
            width: 100%;
            height:100%;
            zoom: 1;
        }
          .main ul li {
            list-style-type: none;
            background: 99CCFF;
            font-size: 18px;
            text-shadow: 1px 1px 3px #555;
           /*  width: 570px;
            height: 100px; */
            /* margin: 10px 20px 10px 0; */
            /* line-height: 70px; */
            text-align: center;
            color: #fff;
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
			   <div class="main">
                                    <div class="item">
                                        <ul class="clear">

                                        </ul>
                                    </div>
                                   
        </div>
        <div class="footer" >
            <h4 class="pull-right"><a class="prev">上一页</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a class="next">下一页</a></h4>
        </div>
    </div>
<script>
    $(function () {
    	var server = location.pathname.split('/')[1];
		var web = "http://"+location.host+"/"+server+"/content/posoition";
		var values = decodeURI(window.location.search.split("&")[1])
     	var value = decodeURI(window.location.search.split("&")[0]).split("=")[1];
     	var type = values.split("=")[1];
     	$("div.title").text(value);
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
     	
        //var rowNum=Math.round($(".article")[0].height()/parseFloat($(".article").css('line-height')));
   		var stringData = sessionStorage.getItem(type);//获取键为allJson的字符串  
		var jsonData = JSON.parse(stringData);//将字符串抓换成对象 
		var article = jsonData.data[type][value];
		//var imgs = jsonData.data[type][value+"img"];
		//将文字经过处理 放在不同的li上！
		//文字处理：每一行判断
		var graf = article.split("</p>");
		debugger;
		for(var j=1;j<=graf.length;j++){
		console.log(j);
		console.log(graf[j]);
			if(undefined != graf[j] && "<p>&nbsp;" != graf[j].replace(/^\s+|\s+$/gm,'')){
				$("<li>"+graf[j]+"</p></li>").appendTo($("ul"));			
			}
		} 
	
        
		afterLoad();
		
    });
    
    function afterLoad(){
        $(".main ul li:gt(2)").hide();//初始化，前面4条数据显示，其他的数据隐藏。
        var total_q = $(".main ul li").length;//总数据
        var current_page = 3;//每页显示的数据
        var current_num = 1;//当前页数
        var total_page = Math.ceil(total_q / current_page);//总页数
        var next = $(".next");//下一页
        var prev = $(".prev");//上一页
        //下一页
        $(".next").click(function () {
            if (current_num == total_page) {
                return false;//如果大于总页数就禁用下一页
            }
            else {
                ++current_num;
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
                --current_num;
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
         
    }
</script>
</body>
</html>