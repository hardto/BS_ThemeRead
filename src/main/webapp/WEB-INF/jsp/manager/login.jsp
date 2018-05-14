<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <meta name="description" content="中国最大的梦想博客平台！">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
    <title>管理员登陆 - 毕设</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/manage/common_index.css" />
    <script src="${pageContext.request.contextPath}/resource/scripts/jquery-3.0.0.js"></script>
    <script src="${pageContext.request.contextPath}/resource/scripts/bootstrap.js"></script>

</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-4">
        </div>
        <div class="col-sm-4"></div>
        <div class="col-sm-4" style="margin-top:10%">
            <div id="loginPage">
                <!-- form   0  -->
                <form class="form-horizontal" action="index" method="post" role="form">
                    <div class="form-group has-feedback">
                        <div class="row">
                            <div class="col-sm-10">
                                <input type="text" class="form-control input-lg" id="usm1" name="usm" placeholder="请输入账号">
                                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                            </div>

                        </div>

                    </div>
                    <div class="form-group has-feedback">
                        <div class="row">

                            <div class="col-sm-10">
                                <input type="password" class="form-control input-lg" id="pwd" name="pwd" placeholder="请输入密码">
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                <input type="hidden" name="biaoji" id="biaoji" value="-1" />
                                <input type="hidden" name="formToken" value="${sessionScope.formToken}" />
                            </div>

                        </div>
                    </div>

                    <div class="form-group">
                        <div id="getin" class="col-sm-10">
                            <button id="denglu" type="button" class="btn btn-default btn-block btn-success">登陆</button>
                        </div>
                    </div>

                </form>
            </div>

        </div>
    </div>
</div>

<canvas id="canvas"></canvas>
<script src="${pageContext.request.contextPath}/resource/scripts/manage/bg.js"></script>
<script type="text/javascript">

</script>
<script type="text/javascript">
	$(function(){
		$("button").click(function(){
			$("form").submit();
		});
	});
</script>

</body>

</html>