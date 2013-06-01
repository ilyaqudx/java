<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="res/screen.css" rel="stylesheet" type="text/css">
<script src="res/jquery-1.7.2.js" type="text/javascript"></script>
<script src="res/jquery.validate.js" type="text/javascript"></script>
<script src="js/add.js" type="text/javascript"></script>
<script src="res/messages_zh.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传Logo</title>
</head>
<script type="text/javascript">
	var id = window.dialogArguments;
	
	$(function(){
		$("#gameId").val(id+"");//这里已经将值给了HIDDEN了
	});
	
	//弄得太久了.失去焦点关闭.应该是提交之后 ,这个焦点就在location去了.这个代码在IE中行不通.根本不提交请求.
	function closeWindow(){
		var fileName = $("#logo").val();
		if(fileName){
			window.close();
		}
	}
	
	function cancleBtn(){
			window.close();
	} 
</script>
<body>
	<fieldset>
		<legend>选择LOGO图片</legend></br>
		<s:form id="upload_logo"  method="POST" action="game_uploadLogo" enctype="multipart/form-data">
			　　<s:file id="logo" name="logo" lable="上传" ></s:file></br></br>
			<input type="image" onblur="closeWindow()" src="res/submit.png" style="margin-left: 25px;">
     		<input id="gameId" type="hidden" name="gameInfo.id"/>
     		<input style="margin-left: 15px;" type="image" src="res/reset.png" 
     				onclick="cancleBtn()"/>
		</s:form>
	</fieldset>
</body>
</html>