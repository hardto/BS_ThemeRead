<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>服务器错误-毕设</title>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resource/css/bootstrap.css"
	rel="stylesheet">
<!-- FONT AWESOME CSS -->
<link
	href="${pageContext.request.contextPath}/resource/css/error/font-awesome.min.css"
	rel="stylesheet" />
<!--GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Nova+Flat'
	rel='stylesheet' type='text/css'>
<!-- custom CSS here -->
<link
	href="${pageContext.request.contextPath}/resource/css/error/style.css"
	rel="stylesheet" />
	<style type="text/css">
	body {
	font-family: 'Nova Flat', cursive;
	background-color: #B0E0E6;
	color: #fff;
}
</style>
</head>
<body>


	<div class="container">

		<div class="row pad-top text-center">
			<div class="col-md-6 col-md-offset-3 text-center">
				<h1>redirect to the index page</h1>
				<h5>10 seconds later</h5>
				<span id="error-link"></span>
				<h2>! ERROR DECETED !</h2>
			</div>
		</div>

		

	</div>
	<!-- /.container -->


		<!--Core JavaScript file  -->
	<script src="${pageContext.request.contextPath}/resource/scripts/error/jquery-1.10.2.js"></script>
	<!--bootstrap JavaScript file  -->
	<script src="${pageContext.request.contextPath}/resource/scripts/bootstrap.js"></script>
	<!-- customed time -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/fdintime/forward.js"></script>
	<!--Count Number JavaScript file  -->
	<script src="${pageContext.request.contextPath}/resource/scripts/error/countUp.js"></script>
	<!--Custom JavaScript file  -->
	<script src="${pageContext.request.contextPath}/resource/scripts/error/505/custom.js"></script>
</body>
</html>
