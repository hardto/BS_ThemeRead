<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>音乐-毕设</title>
<link href="${pageContext.request.contextPath}/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<script src="${pageContext.request.contextPath}/resource/scripts/jquery-1.11.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resource/css/content/style.css" rel="stylesheet" type="text/css" media="all"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Training Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="${pageContext.request.contextPath}/resource/scripts/bootstrap.min.js"></script>

</head>
<style>
body,html{
padding:0px;
width:100%;
height:100%;
}
body{
        background-image: url("${pageContext.request.contextPath}/resource/images/bk4.jpg");
        background-position: center center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
        background-color: #464646;
        }
</style>
<body>
<div class="input-group col-md-3 text-center" style="float:left;margin:20% 35%">  
       <input type="text" class="form-control"placeholder="请输入歌曲名" />  
            <span class="input-group-btn">  
               <button class="btn btn-info btn-search" id="search">搜索</button>  
            </span>  
 </div>  
 
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title">播放音乐</h4>
					</div>
					<div class="modal-body" id="body">
						
					</div>
					
				</div>
			</div>
</div>
 
<script type="text/javascript"	src="${pageContext.request.contextPath}/resource/scripts/jquery.tmpl.js">
</script>

<script type="text/javascript">
	$(document).ready(function(e) {
	if("" != window.location.search && undefined != window.location.search && null !=window.location.search){
		playmusic();
	}
	$("#search").click(function(){
	debugger;
	var music = $("input").val();
	
	playmusic(music);
	});
	});
	function playmusic(name){
	$("#myModal").modal('show');
			if(name != "" && name != null && name != undefined){
			var url = "http://" +location.hostname+":8888"+"/music?song_name="+name;
		 $.ajax({
            type: "post",
            url: url,
            timeout : 3000,
            async: false,
             dataType: 'jsonp',
            jsonpCallback: "dealData",
             success: function(data){
            
             }});
			}else{
			value = window.location.search.split("=")[1]
	var server = location.pathname.split('/')[1];
	var url = "http://" +location.hostname+":8888"+"/music?song_name="+value;
		 $.ajax({
            type: "post",
            url: url,
            timeout : 3000,
            async: false,
             dataType: 'jsonp',
            jsonpCallback: "dealData",
             success: function(data){
            
             }});
			}
			
	}
	
	
	
	function dealData(data){
			debugger;
			$('<audio  controls="controls" autoplay="autoplay" loop="loop" src="'+data.message.url+'">你的游览器不支持</audio>').appendTo($("#body"));
			}
</script>
</body>
</html>