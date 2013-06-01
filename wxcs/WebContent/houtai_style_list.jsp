<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>办事易_无线城市</title>
<link href="http://zigong.wxcs.cn/web-theme/images/favicon.ico"
	rel="Shortcut Icon">
<script src="res/jquery.js" type="text/javascript"></script>
<script src="res/jquery-ui-1.js" type="text/javascript"></script>
<meta content="text/html; charset=UTF-8" http-equiv="content-type">
<link href="res/main_002.css" rel="stylesheet"
	type="text/css">
<link href="res/main.css" rel="stylesheet" type="text/css">
<link class="lfr-css-file" href="res/main_003.css"
	rel="stylesheet" type="text/css">
<style type="text/css"></style>
<style type="text/css"></style>
<link charset="utf-8" href="res/a_002.css" rel="stylesheet"
	type="text/css" id="aui_3_4_0_1_58">
<link charset="utf-8" href="res/a.css" rel="stylesheet"
	type="text/css" id="aui_3_4_0_1_76">
</head>
<body
	class=" yui3-skin-sam controls-visible signed-out public-page site">
	<div id="totop" style="display: block;"></div>
	<div id="popCover" class="popCover"
		style="display: none; width: 1237px;"></div>
	<!-- 弹出层 -->
	<div
		style="height: auto; left: 417px; top: 156.5px; z-index: 9999; position: absolute; display: none;"
		class="new_kind_pop_win" id="wwwLogout">
		<div class="pop_title" style="height: 35px;">温馨提示</div>
		<div class="popContainer" style="height: 140px;">
			<div class="life_c1">
				<div
					style="font-size: 14px; text-align: center; color: rgb(102, 102, 102); line-height: 37px; margin-top: 25px; *margin-left: -15px;">
					<dd id="tipTitleindex"></dd>
				</div>
				<div class="upload_img_save" style="top: 125px;">
					<a id="xyqdaindex" href="#" class="upload_img_save_btn mar_ten">确定</a><a
						id="xyqxaindex" href="#" class="upload_img_no_btn"
						onclick="closeTsLogout();">取消</a>
				</div>
			</div>
		</div>
	</div>
	<div
		style="height: auto; left: 580px; top: 250px; z-index: 9999; position: absolute; display: none;"
		id="loading">
		<img src="res/loading.gif" height="32" width="32">
	</div>
	<div id="wrapper">
		<div id="content">
			<div class="bcp_www_channel" id="main-content" role="main">
				<style>
.portlet-column-content {
	padding: 0px;
}
</style>
				<div class="portlet-layout">
					<div class="portlet-column portlet-column-only" id="column-1">
						<div
							class="portlet-dropzone portlet-column-content portlet-column-content-only"
							id="layout-column_column-1">
							<div id="p_p_id_www_channel_head_WAR_webportlet_"
								class="portlet-boundary portlet-boundary_www_channel_head_WAR_webportlet_ portlet-static portlet-static-end portlet-borderless www_channel_head-portlet ">
								<span id="p_www_channel_head_WAR_webportlet"></span>
								<div class="portlet-body">
									<div class="cls_bcp">
  <div class="portlet-borderless-container" style="">
  	<div class="portlet-body">
  		<div class="remoteHtml">
  <style>
.search_list {
	top: 34px;
	left: 12px;
	overflow: hidden;
	width: 186px;
	min-height: 20px;
	background: #fff;
	border: 1px solid #CDCDCD;
	padding: 10px;
	position: absolute;
	z-index: 111111;
}

.search_list ul li {
	float: left;
	border-bottom: 1px dashed #c1c1c1;
	width: 190px;
	line-height: 24px;
}

.search_list ul li:hover {
	float: left;
	border-bottom: 1px dashed #c1c1c1;
	width: 180px;
	line-height: 24px;
	background-color: #c5d1ee;
}
</style>
  <div class="topnav">
  	<div class="topnavcenter">
  		<div class="tbar">
  			<div class="welcome">
  				欢迎进入后台管理， <a
  					href="https://ac.wxcs.cn/login?forwardURL=http%3A%2F%2Fzigong.wxcs.cn%2Fbsy%3FnavCode%3Dbsy&amp;areaName=zigong&amp;jumpType=1"
  					class="orangetxt" id="login_win_show">登录</a> | <a
  					href="http://localhost:8080/logout">注销</a>
  			</div>
  		</div>
  	</div>
  	<div class="greenLine"></div>
  </div>


  <div id="p_p_id_web_channel_nav_WAR_webportlet_"
  	class="portlet-boundary portlet-boundary_web_channel_nav_WAR_webportlet_ portlet-static portlet-static-end portlet-borderless web_channel_nav-portlet ">
  	<span id="p_web_channel_nav_WAR_webportlet"></span>
  	<div class="portlet-body">
  		<div class="cls_bcp">
  			<div class="portlet-borderless-container" style="">
  				<div class="portlet-body">
  					<div class="remoteHtml">
  						<div class="navBar">
  							<ul id="web_channel_nav">
  								<li ><a
  									href="game_list">游戏</a></li>
  								<li><a
  									href="image_list">图片资源</a></li>
  								<li ><a
  									href="dev_list">开发商</a></li>
  								<li><a
  									href="sdk_list">android版本</a></li>
  								<li class="navAt"><a
  									href="style_list">游戏风格</a></li>
  								<li><a
  									href="#">其他</a></li>
  							</ul>
  						</div>
  					</div>
  				</div>
  			</div>
  		</div>
  	</div>
  </div>
  </div>
  </div>
  </div>
  
  <script type="text/javascript">
  		//删除游戏信息
  		var deleteStyle = function(id){
  			var flag = confirm("确定要删除吗?");
  			if(flag){
  				//确定删除就执行请求操作,在当前的页面.其实最好用ajax异步提交请求.
  				window.open("style_delete?style.id="+id,"_self");
  				return true;
  			}
  			
  			return false;
  		}
  </script>
  <!-- 添加页面 -->
  	
  	<!--  IE支持这种添加背景方式,直接在TR中添加背景不行. -->
  	<style>
  		.trBg{
  			background-image: url("res/navbg.jpg");
  		}
  	</style>
  
  	<div class="regin_form" 
  		style="margin-left: 20%;border: 1px solid #C5D1EE;clear: both;display: block;margin: 0 auto;
    			min-height: 400px;overflow: hidden;padding: 30px 0;width: 960px;">
    			
    	<a href="style_input"><img style="margin-left: 35px;margin-bottom: 10px;" src="res/add.png"/></a>
    	<table id="style_table" border="1" align="center">
    		<tr class="trBg">
    			<td width="360px" style="table-layout:fixed" align="center"><font size="3" color="white">开发者介绍</font></td>
    			<td width="180px" align="center"><font size="3" color="white">操作</font></td>
    		</tr>
    		<s:iterator value="#styles">
	    		<tr>
	    			<td width="160px" style="table-layout:fixed" align="center"><font size="2"><s:property value="styleName"/></font></td>
	    			<td width="80px" align="center"><font size="2">
	    				<a href="style_edit?style.id=<s:property value="id"/>">编辑</a>
	    				<a href="#" onclick="return deleteStyle(<s:property value="id"/>)">删除</a>
	    			</font></td>
	    		</tr>
    		</s:iterator>
    	</table>
   </div>