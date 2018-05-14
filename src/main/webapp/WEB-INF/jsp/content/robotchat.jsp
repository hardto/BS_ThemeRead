   <%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
    <!DOCTYPE html>
        <html lang="en">
        <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>智能回复-毕设</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resource/scripts/bootstrap.js"></script>
        <style>
        #part1{
        margin-bottom: 50px;
        height: 60%;
        }

        #part2{
        position: fixed;
        width: 100%;
        bottom: 5px;
        text-align: center;
        margin: 0 auto;
        }
        body{
        background-image: url("${pageContext.request.contextPath}/resource/images/bk3.jpg");
        background-position: center center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
        background-color: #464646;
        }
        .content{
        background-color: white;
        border: 2px solid white;
        border-radius: 5px;
        height: 40px;
        line-height: 40px;
        font-size: 1.5em;
        }
        .its{
        margin-top: 12px;
        opacity: 0.7;
        }
        </style>
        </head>
        <body>
        <div id="part1" class="container">
        
        
        </div>

        <div id="part2" >
        <form class="form-horizontal">
        <div class="form-group form-group-lg">
        <div class="col-sm-2"></div>
        <div class="col-sm-7">
        <input class="form-control" type="text" id="msg" placeholder="请输入消息">
        </div>
        <input id="send" class="col-sm-1 btn btn-default btn-lg" value="发送"/>
        </div>
        </form>
        </div>
        <script type="text/javascript">
        i = 0;
        $(function () {
        $("#send").on("click", function () {
        var value = $("#msg").val();
        if( value != ""){
        $(' <div class="row its"> \
        <div class="col-sm-1"></div> \
        <div class="col-sm-7 content"> \
        '+value +'</div> \
        <div class="col-sm-4"></div>').appendTo($("#part1"));
        }
        //����Ϣ���͸�����һ̨������
        var url = "http://" +location.hostname+":8888"+"/chat?msg="+value;
        console.log(url);
        $.ajax({
        type: "get",
        url: url,
        async: true,
        dataType: 'jsonp',
        jsonpCallback: "dealData"
        });
        });
        $("body").on('click','button',function(e){
        var index = e.target.id;
        $("#s"+index).removeClass("show");
        $("#s"+index).removeClass("hidden");
        $("#s"+index).removeClass("show");
        });
        });
        function dealData(data){
        //en_message
        $(' <div class="row its"> \
        <div class="col-sm-4"></div> \
        <div class="col-sm-7 content"> \
        '+data.zh_message +'<span id="s'+i+'" class="hidden">&nbsp;&nbsp;'+data.en_message+'</span></div> \
        <div class="col-sm-1"><button id="'+i+'" class="btn btn-default">翻译</button></div>').appendTo($("#part1"));
        i++;
        }
        </script>

        </body>
        </html>