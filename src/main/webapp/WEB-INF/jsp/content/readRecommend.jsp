<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <script src="${pageContext.request.contextPath}/resource/scripts/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/scripts/bootstrap.min.js"></script>
    <title>推荐美文-毕设</title>
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
                                    </div>
                                   
        </div>
        
    </div>
<script>
    $(function () {
    	var server = location.pathname.split('/')[1];
		var web = "http://"+location.host+"/"+server+"/content/getRecommendById";
     	var id = window.location.search.split("=")[1];
		$.ajax({
            type: "post",
            url: web,
            timeout : 3000,
            async: false,
            dataType: "json",
            data : {"id":id},
            success: function(data){
            debugger;
            	$("<p>"+data.content+"</p>").appendTo($(".main"));   
            }});
     	
	
        
		
    

    });
</script>
</body>
</html>