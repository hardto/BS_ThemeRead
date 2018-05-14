setTimeout(function(){
	var server = location.pathname.split('/')[1];
	var web = "http://"+location.host+"/"+server+"/index/category";
	location.href = web;
},10000);