<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="content-type">
<title>办事易_无线城市</title>
<link href="http://zigong.wxcs.cn/web-theme/images/favicon.ico"
	rel="Shortcut Icon">
<script src="res/jquery-1.7.2.js" type="text/javascript"></script>
<script src="res/jquery-ui-1.js" type="text/javascript"></script>

<script type="text/javascript" src="res/touch.js"></script>
<script type="text/javascript" src="res/pc_hxl.js"></script>
<script type="text/javascript" src="res/trim.js"></script>
<script type="text/javascript" src="res/autoFill.js"></script>
<script type="text/javascript" src="res/grayscale.js"></script>
<script> function loading(type) { if ("0" == type) { jQuery("#popCover").show(); jQuery("#loading").show(); } else if ("1" == type) { jQuery("#popCover").hide(); jQuery("#loading").hide(); } } </script>
<link href="http://zigong.wxcs.cn/web-theme/images/favicon.ico"
	rel="Shortcut Icon">
<link href="http://localhost/ecity/zigong/www/bsy?navCode=bsy"
	rel="canonical">
<link href="res/main_002.css" rel="stylesheet"
	type="text/css">
<link href="res/main.css" rel="stylesheet" type="text/css">
<link href="res/screen.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="res/jquery_002.js"></script>
<script src="res/jquery.validate.js" type="text/javascript"></script>
<script src="js/add.js" type="text/javascript"></script>
<script src="res/messages_zh.js" type="text/javascript"></script>

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
  								<li class="navAt"><a
  									href="game_list">游戏</a></li>
  								<li><a
  									href="image_list">图片资源</a></li>
  								<li><a
  									href="dev_list">开发商</a></li>
  								<li><a
  									href="sdk_list">android版本</a></li>
  								<li><a
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
     	function resetBtn(fm){
     		fm.reset();
     		return false;
     	}
     	
     	 function checkImgType(this_){
     		 
     		   //-1:获取到要上传文件的名称.
     		   var filepath=$(this_).val();
     		   
     	 
     	 		//-2:得到文件的后缀名,判断文件格式.
     		   var extStart=filepath.lastIndexOf(".");
     		   var ext=filepath.substring(extStart,filepath.length).toUpperCase();

     		   //根据文件后缀判断是否合法.
     		   if(ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"){
     		  		$(this_).focus();//让这个上传文件对象获取到焦点.

     		  		if ($.browser.msie) {  //判断浏览器,如果是IE.
     		   			 this_.select();//然后选择这个文件框对象.
     		             document.execCommand("delete");//执行删除操作.
     		  		}else{
     						$(this_).val("");//如果不是IE.就直接把文件框的内容设置为空.
     		 	 	}
     		 		return false;
     		   }

     		   var file_size = 0;          
     		   
     		   //-做兼容.
     		   if ( $.browser.msie) {
     			   
     			   	//-1:创建一个图片对象.
     			  	var img=new Image();
     			   	
     			   	//-2:把文件框的名称设置给这个图片对象.
     		   		img.src=filepath;   
     		   		
     		   		//-3:判断文件对象的大小.难道这样就可以知道它的大小了?这个是IE下.
     				if(img.fileSize > 0){ 
     					if(img.fileSize>3*1024){   
							alert("图片大于3MB。");
							$(this_).focus();
							this_.select();
							document.execCommand("delete");
							return false ;
						}else{
							alert(img.fileSize/1024);
						}
     				}
	            } else {     
	            	//这个是在其他浏览器下.
	            	
	            	//-1:获取到这个文件框的第1个文件的大小.
	            	file_size = this_.files[0].size; 
	            	var size = file_size / 1024;  
     				alert(size+"KB");

     				if(size > 3){  
     					alert("上传的文件大小不能超过3M！");  
     					$(this_).focus();
     					$(this_).val("");
     					return false ;
     				}

     			}
     		       return true;
     		}
     	
     </script>
  
  <!-- 添加页面 -->
  	<div class="regin_form" 
  		style="margin-left: 20%;border: 1px solid #C5D1EE;clear: both;display: block;margin: 0 auto;
    			min-height: 400px;overflow: hidden;padding: 30px 0;width: 960px;">
	
  	 <s:form id="login_form" action="game_save" method="POST">
  	 
  	 <label style="font-size: 18px;margin-left: 230px;font-weight: bold;">注册游戏基本信息</label></br></br>
  	 
  	 <s:hidden name="gameInfo.id"></s:hidden>
 	 <label style="font-size: 14px;margin-left: 150px;">游戏名称:</label>
  	 <s:textfield  name="gameInfo.name"  style="border: 1px solid #88A5BB;font-size: 14px;
    				margin-right: 10px;padding: 5px 4px;vertical-align: middle;width: 212px;"/></br></br>
    				
 	 <label style="font-size: 14px;margin-left: 150px;">游戏版本:</label>
  	 <s:textfield  name="gameInfo.version"  style="border: 1px solid #88A5BB;font-size: 14px;
    				margin-right: 10px;padding: 5px 4px;vertical-align: middle;width: 212px;"/></br></br>
    				
 	 <label style="font-size: 14px;margin-left: 150px;">游戏类型:</label>
  	 <s:select  list="#styles" listKey="id" listValue="styleName" name="gameInfo.style.id"  style="border: 1px solid #88A5BB;font-size: 14px;
    				margin-right: 10px;padding: 5px 4px;vertical-align: middle;width: 222px;">
    	</s:select></br></br>
    				
 	 <label style="font-size: 14px;margin-left: 150px;">下载次数:</label>
  	 <s:textfield name="gameInfo.download_Times" style="border: 1px solid #88A5BB;font-size: 14px;
    				margin-right: 10px;padding: 5px 4px;vertical-align: middle;width: 212px;"/></br></br>
 	
 	 <label style="font-size: 14px;margin-left: 150px;">最小 SDK:</label>
  	 <s:select list="#sdks" listKey="id" listValue="version" name="gameInfo.minSDK.id"  style="border: 1px solid #88A5BB;font-size: 14px;
    				margin-right: 10px;padding: 5px 4px;vertical-align: middle;width: 222px;"/></br></br>
 	 
 	 <label style="font-size: 14px;margin-left: 150px;">开  发  者:</label>
  	 <s:select list="#devs" listKey="id" listValue="name" name="gameInfo.dev.id"  style="border: 1px solid #88A5BB;font-size: 14px;
    				margin-right: 10px;padding: 5px 4px;vertical-align: middle;width: 222px;"/></br></br>
    				
     <label style="font-size: 14px;margin-left: 150px;">游戏介绍:</label>
     <s:textarea name="gameInfo.discription" cols="33" rows="6" style="resize:none;"></s:textarea></br></br>
     
     　     <input type="image" src="res/submit.png" style="margin-left: 200px;">
     
     <input style="margin-left: 30px;" type="image" src="res/reset.png" onclick="return resetBtn(this.form)"/>
     
   </s:form>