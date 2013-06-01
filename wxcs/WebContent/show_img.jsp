<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="res/jquery-1.7.2.js" type="text/javascript"></script>
<title>游戏图片</title>
</head>

<body>

	<table border="1" width="80%;" align="center">
		<tr>
			<td width="100px;" >图片</td>
			<td width="120px;" >图片名称</td>
		</tr>
		<s:iterator value="#imgs">
		<tr>
			<td width="100px;" height="60px;" style="table-layout: fixed;"><img id="img" src="upload/<s:property value="imageName"/>" /></td>
			<td width="120px;" height="60px;" style="table-layout: fixed;"><s:property value="imageName"/></td>
		</tr>
		</s:iterator>
	</table></br></br>
	
	<a href="upload_img.jsp?gameId=<s:property value="gameInfo.id"/>"><img style="margin-left: 10%;" src="res/submit.png"/></a>
	<a href="#"><img style="margin-left: 10%;" src="res/reset.png"/></a>
</body>
</html>