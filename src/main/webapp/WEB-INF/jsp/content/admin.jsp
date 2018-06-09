<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理-毕设</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/jquery.dataTables-1.10.13.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/jquery-3.0.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/jquery.tmpl.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/jquery.dataTables-1.10.13.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/dataTables.bootstrap-1.10.13.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/echarts.min.js"></script>

    <style>
        body {
            position: relative;
        }

        .affix {
            top: 20px;
        }
        /*div.col-sm-9 div {
         height: 250px;
         font-size: 28px;
     }*/
        /*div.col-sm-9 div {
        height: 250px;
        font-size: 28px;
    }*/
        /*#section1 {
        color: #fff;
        background-color: #1E88E5;
    }

    #section2 {
        color: #fff;
        background-color: #673ab7;
    }

    #section3 {
        color: #fff;
        background-color: #ff9800;
    }

    #section41 {
        color: #fff;
        background-color: #00bcd4;
    }

    #section42 {
        color: #fff;
        background-color: #009688;
    }*/

        #section1,
        #section2,
        #section3,
        #section41 {
            padding-top: 85px;
        }
        #section1{
        	height:400px;
        }

        @media screen and (max-width: 810px) {
            #section1,
            #section2,
            #section3,
            #section41,
            #section42 {
                margin-left: 150px;
            }
        }

      /*   @font-face {
            font-family: 'lonelyso';
            src: url('fonts/abc.ttf') format('truetype');

        } */

        small{
            color: #FFFFFF !important;
        }
        #head{
            background: url("${pageContext.request.contextPath}/resource/images/admin.jpg");
            height: 416px;
        }
        #recommendForm label,#typeForm label{
        	padding:0px;
        }
    </style>

</head>

<body data-spy="scroll" data-target="#myScrollspy" data-offset="15" onload="firstOfAll()">

<div class="container-fluid" id="head">
    <!--<h1 class="text-justify" style="font-family: lonelyso; font-size: 56px;" >
        we should consider every day lost on which we have not danced at least once.
        <br><small class="pull-right" >&#45;&#45;Friedrich Wilhelm Nietzsche</small>
    </h1>-->
</div>
<br>

<div class="container">
    <div class="row">
        <nav class="col-sm-3" id="myScrollspy">
            <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="405">
                <shiro:hasRole name="管理员A">
                <shiro:hasPermission name="编辑">                
                <li>
                    <a href="#section1">管理类别</a>
                </li>
                </shiro:hasPermission> 
                </shiro:hasRole>
                 <shiro:hasAnyRoles  name="管理员A,管理员B">
                <li>
                    <a href="#section2">每日推荐</a>
                </li>
                <li>
                    <a href="#section3">类别管理</a>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">统计 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#section41">统计-1</a>
                        </li>
                        <li>
                            <a href="#section42">统计-2</a>
                        </li>
                    </ul>
                </li>
                </shiro:hasAnyRoles>
            </ul>
        </nav>
        <div class="col-sm-9">
         <shiro:hasRole name="管理员A">
                <shiro:hasPermission name="编辑">  
            <div id="section1">
				<div class="col-sm-1"></div>
				<div class="col-sm-10">
					<table id="dealtype" class="table table-hover table-responsive">
                    <thead>
                    <tr>
                        <th>类别名称</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
				</div>
				<div class="col-sm-1"></div>
				                

            </div>
            </shiro:hasPermission> 
                </shiro:hasRole>
            <shiro:hasAnyRoles  name="管理员A,管理员B">
            <div id="section2" style="margin-top: 145px;">
			  <form class="form-horizontal " method="post" id="recommendForm" action="recommend" role="form" enctype="multipart/form-data">
			                    <div class="form-group">
			                        <label for="comment" class="col-sm-1 control-label">主标题:</label>
			                        <div class="col-sm-9">
			                            <textarea class="form-control" rows="5" maxlength="362" id="maintitle" name="main"></textarea>
			                        </div>
			
			                    </div>
			                    <div class="form-group">
			                        <label for="comment" class="col-sm-1 control-label">副标题:</label>
			                        <div class="col-sm-9">
			                            <textarea class="form-control" rows="5" maxlength="76" id="subtitle" name="sub"></textarea>
			                        </div>
			
			                    </div>
			                    <div class="form-group">
			                        <label for="comment" class="col-sm-1 control-label">推荐内容:</label>
			                        <div class="col-sm-9">
			                            <textarea class="form-control" rows="5" id="recommendContent" name="content"></textarea>
			                        </div>
			
			                    </div>
								<div class="form-group">
                        <div class="col-sm-11">
                            <button  type="button" class="btn btn-primary btn-block">上&nbsp;传</button>
                        </div>
                    </div>
			                </form>

            </div>
            <div id="section3" style="margin-top: 125px;">
                <!--想做一个类别的编辑，权限最小-->

                <form class="form-horizontal " method="post" id="typeForm" action="upload" role="form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-1 control-label" >类别:</label>
                        <div class="col-sm-4">
                            <select id="typeName"  class="form-control">
                                <!--模板自动加载-->
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <input id="typePath" type="text" class="form-control" readonly placeholder="上传图片资源文件不得超过4M">
                        </div>
                        <div class="col-sm-1">
                            <input type="file" id="typeFile" name="file" style="filter:alpha(opacity=0);opacity:0;width: 0;height: 0;" />

                        </div>
                        <div class="col-sm-3">
                            <button type="button" class="btn btn-info btn-block" id="typeChoose">选&nbsp;择&nbsp;文&nbsp;件</button>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="comment" class="col-sm-1 control-label">描述:</label>
                        <div class="col-sm-11">
                            <textarea class="form-control" rows="5" id="typeComment" name="descripe"></textarea>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label"></label>
                        <div class="col-sm-11">
                            <input type="hidden" name='typeId' id="typeId" />
                            <input type="hidden" name='MAX_FILE_SIZE' value='8388608' />
                            <button id="typeSubmit" type="button" class="btn btn-primary btn-block">上&nbsp;传</button>
                        </div>
                    </div>

                </form>

            </div>
            <div id="section41" style="margin-top: 125px;">
               <div id="chartmain" style="width:600px; height: 400px;">
               
               
               
               </div>

            </div>
            <div id="section42">
                 <div id="chartmain2" style="width:600px; height: 400px;">
               
               
               
               </div>
            </div>
                </shiro:hasAnyRoles >
        </div>
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
						<h4 class="modal-title" id="myModalLabel"></h4>
					</div>
					<div class="modal-body">
						<form role="form" class="form-horizontal ">
							<div class="form-group">
                       			<label class="col-sm-3 control-label" >删除:</label>
                        		<div class="col-sm-5">
                            		<select id="typeNameModal"  class="form-control">
                           			 	<option id=""></option>
                           			 </select>
		                        </div>
	                    	</div>
	                    	<div class="form-group">
                       			<label class="col-sm-3 control-label" >添加:</label>
                        		<div class="col-sm-5">
                            		<input id="addType" type="text" class="form-control" >
		                        </div>
	                    	</div>
	                    	<div class="form-group">
                       			<label class="col-sm-3 control-label" >热点:</label>
                        		<div class="col-sm-5">
                            		 <label class="radio-inline">
        								<input type="radio" name="ishot" id="hot" value="0" > 是
    								 </label>
								    <label class="radio-inline">
								        <input type="radio" name="ishot" id="nohot"  value="1"> 否
								    </label>
		                        </div>
	                    	</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="okcode">确认</button>
						<!-- <button type="button" class="btn btn-primary">Save</button> -->
					</div>
				</div>
			</div>
</div>
<script type="text/x-jquery-tmpl" id="t1">
			<!--//模板在jsp中需要转义-->
			<tr>
				<td>${'${'}name}</td>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<button type="button" class="btn btn-info" trans="${'${'}id}" name="${'${'}name}" hot="${'${'}hot}">编&nbsp;辑</button>
				</td>
			</tr>
		</script>
<script type="text/x-jquery-tmpl" id="t2">
			<!--//模板在jsp中需要转义-->
			<option id="${'${'}id}">
				${'${'}name}
			</option>
</script>		
<script>
    $(function() {
    	fatherid = "";
    	var server = location.pathname.split('/')[1];
		var web = "http://"+location.host+"/"+server+"/content/allTypes";
		var web3 = "http://"+location.host+"/"+server+"/content/types";
		var web4 = "http://"+location.host+"/"+server+"/content/specialTypes";
		var web5 = "http://"+location.host+"/"+server+"/manager/edit";
		var param =location.search;
		var web6 = "http://"+location.host+"/"+server+"/manager/census"; 
		


		var web66 = "http://"+location.host+"/"+server+"/manager/collect"; 



$.ajax({
            type: "post",
            url: web66,
            timeout : 3000,
            async: false,
            success: function(data) {
            debugger;
            var resu = data.tables;
            var names = [];
            var nums = [];
            Object.keys(resu).forEach(function(key){
				names.push(key);
				nums.push(resu[key]);

});
            //指定图标的配置和数据
        var option = {
            title:{
                text:'阅读类别统计-毕设'
            },
            tooltip:{},
            legend:{
                data:['类别收藏统计']
            },
            xAxis:{
                data:names
            },
            yAxis:{

            },
            series:[{
                name:'收藏量',
                type:'line',
                data:nums
            }]
        };
                
        //初始化echarts实例
        var myChart = echarts.init(document.getElementById('chartmain2'));

        //使用制定的配置项和数据显示图表
        myChart.setOption(option);
            debugger;
            },
            error: function(mes) {
                console.log(mes.responseText);
            }
        });










		
		  $.ajax({
            type: "post",
            url: web6,
            timeout : 3000,
            async: false,
            success: function(data) {
            debugger;
            var resu = data.results;
            var names = [];
            var nums = [];
            Object.keys(resu).forEach(function(key){
				names.push(key);
				nums.push(resu[key]);

});
            //指定图标的配置和数据
        var option = {
            title:{
                text:'阅读类别统计-毕设'
            },
            tooltip:{},
            legend:{
                data:['类别点击统计']
            },
            xAxis:{
                data:names
            },
            yAxis:{

            },
            series:[{
                name:'访问量',
                type:'line',
                data:nums
            }]
        };
                
        //初始化echarts实例
        var myChart = echarts.init(document.getElementById('chartmain'));

        //使用制定的配置项和数据显示图表
        myChart.setOption(option);
            debugger;
            },
            error: function(mes) {
                console.log(mes.responseText);
            }
        });
		
		
		
		
		
		
		
		
	    //okcode
	     $(document).on("click","#okcode",function(){
	     debugger;
	     $('#myModal').modal('hide');
	     var delid = $("#typeNameModal option:selected").attr("id");
	      var addtype = $("#addType").val();
	      var hot = $("label input[type='radio']:checked").attr("value");
	      $.ajax({
            type: "post",
            url: web5,
            timeout : 3000,
            async: false,
			data : {"delid" : delid,
					"fatherid" : fatherid,
					"addtype" : addtype,
					"ishot" : hot
					},
            success: function(data) {
				window.location = "http://"+location.host+"/"+server+"/manager/index";
            },
            error: function(mes) {
                console.log(mes.responseText);
            }
        });
	     });
	    $(document).on("click","td button",function(){
	    var thisid = $(this).attr("trans");
	    fatherid = thisid;
	    if("0" == $(this).attr("hot")){
	    	$("#hot").prop("checked","checked");	
	    }else{
	    	$("#nohot").prop("checked","checked");	
	    }
	        debugger;
	        	$("#myModalLabel").text($(this).attr("name")+"  类别管理");//typeNameModal
	        	 $.ajax({
            type: "post",
            url: web4,
            timeout : 3000,
            async: false,
            dataType: "json",
			data : {"id" : thisid},
            success: function(data) {
                $("#t2").tmpl(data.types).appendTo($("#typeNameModal"));

            },
            error: function(mes) {
                console.log(mes.responseText);
            }
        });
	        	$('#myModal').modal('show');
	        });
    	
	
        $.ajax({
            type: "post",
            url: web,
            timeout : 3000,
            async: false,
            dataType: "json",

            success: function(data) {
                $("#t2").tmpl(data.types).appendTo($("#typeName"));

            },
            error: function(mes) {
                console.log(mes.responseText);
            }
        });
        
        
        $.ajax({
            type: "post",
            url: web3,
            timeout : 3000,
            async: false,
            dataType: "json",

            success: function(data) {
                $("#t1").tmpl(data.types).appendTo($("#dealtype tbody"));
                
                 $("#dealtype").DataTable({
                    language: {
                        "sProcessing": "处理中...",
                        "sLengthMenu": "显示 _MENU_ 项结果",
                        "sZeroRecords": "没有匹配结果",
                        "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                        "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                        "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                        "sInfoPostFix": "",
                        "sSearch": "搜索:",
                        "sUrl": "",
                        "sEmptyTable": "表中数据为空",
                        "sLoadingRecords": "载入中...",
                        "sInfoThousands": ",",
                        "oPaginate": {
                            "sFirst": "首页",
                            "sPrevious": "上页",
                            "sNext": "下页",
                            "sLast": "末页"
                        },
                        "oAria": {
                            "sSortAscending": ": 以升序排列此列",
                            "sSortDescending": ": 以降序排列此列"
                        }
                    },
                    "aLengthMenu": [
                        [3, 6, 9, -1],
                        [3, 6, 9, "All"]
                    ],
                    /*
                     * l - 每页显示行数的控件
                     f - 检索条件的控件
                     t - 表格控件
                     i - 表信息总结的控件
                     p - 分页控件
                     r - 处理中的控件
                    */ 
                }); 

            },
            error: function(mes) {
                console.log(mes.responseText);
            }
        });
        
        
        
        $(document).on("change","#typeName",function(){
        debugger;
        	firstOfAll();
        });
        
        /*$("#file").filestyle({ size: "lg" });*/

        $("#typeChoose").click(function() {
            $("#typeFile").trigger("click");

        });
        
        $("#typeFile").change(function() {
        	if($(this).prop("value").match(/\w+\.(jpg|png)$/i)){
        		$("#typePath").val($(this).prop("value"));
        	}
            
        });

        $("#typeSubmit").click(function() {
        $("#typeDesc").val($("textarea").val());
            $("#typeForm").submit();
        });
        $("textarea").change(function() {
            $("#typeDesc").val($(this).val());
        });
		$("#recommendForm button").click(function(){
			$("#recommendForm").submit();
		});
    });
    function firstOfAll(){
        var server2 = location.pathname.split('/')[1];
		var web2 = "http://"+location.host+"/"+server2+"/content/oneType";
		
         var id = $("#typeName option:selected").attr("id");
         $("#typeId").val(id);
         $.ajax({
			type: "post",
            url: web2,
            timeout : 3000,
            async: false,
            dataType: "json",
            data : {"id" : id},
             success: function(data){
             
             $("#typeComment").text(data.descs);
             }
		});
		
        }
</script>

</body>

</html>