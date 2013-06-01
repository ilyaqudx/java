function changeLogo(id){
	var obj = showModalDialog("upload_logo.jsp",id,"上传logo","dialogWidth:300px;dialogHeight:200px;");
	window.location.href ="game_list"; 
}

function showImg(id){
	
	var obj = showModalDialog("image_query?gameInfo.id="+id,"查看图片","dialogWidth:800px;dialogHeight:800px;");

}