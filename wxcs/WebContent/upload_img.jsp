<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	$(function(){
		var id = <%=request.getParameter("gameId")%>;
		
		$("#gameId").val(id+"");//这里已经将值给了HIDDEN了
		
		
		//动态给新添加的按钮添加事件.复制的按钮可能会没有事件的.但添加为什么会有,而删除没有.
		$("#img_table a[cmd=delete]").live("click",function(){
			var trs = $("#img_table tr");
			if(trs.length>1){
				
				//console.debug($(this).closest("tr"));
				$(this).closest("tr").remove();//找到离按钮最近的TR,然后删掉.
			}else{
				alert("至少要添加一张图片");
			}
		});
	});
	
	//弄得太久了.失去焦点关闭.应该是提交之后 ,这个焦点就在location去了.这个代码在IE中行不通.根本不提交请求.
	function closeWindow(){
		var fileName = $("#img").val();
		if(fileName){
			window.close();
		}
	}
	
	function cancleBtn(){
		window.close();
	} 
	
	function addFile(){
		var trs = $("#img_table tr");
		if(trs.length<5){
			var newTr = $("#img_table tr:last").clone();
			$(newTr).find("input[cmd]").val("");
			$(newTr).appendTo($("#img_table"));
		}else{
			alert("最多添加5张图片");
		}
	}
</script>
<body>
	<fieldset>
		<legend>选择图片资源</legend></br>
		
		<s:form id="upload_form" method="POST" action="image_save" enctype="multipart/form-data">
			<table id="img_table" border="1">
				<tr>
					<td cmd="img_td"><s:file cmd="upload" name="imgs"></s:file></td>
					<td cmd="add_td">
						<a cmd="add" href="javascript:addFile()">增加</a>
						<a cmd="delete" href="javascript:void(0);">删除</a>
					</td>
				</tr>
			</table>
			<input type="image" onblur="closeWindow()" src="res/submit.png" style="margin-left: 25px;">
     		<input id="gameId" type="hidden" name="gameInfo.id"/>
     		<input style="margin-left: 15px;" type="image" src="res/reset.png" 
     				onclick="cancleBtn()"/>
		</s:form>
	</fieldset>
</body>
</html>