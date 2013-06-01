<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html xmlns:wb="http://open.weibo.com/wb"
	class="ltr yui3-js-enabled gecko ltr js firefox firefox20 firefox20-0 win"
	dir="ltr" lang="zh-CN">
<head>
<title>生活娱乐_无线城市</title>

<!--引入远程JS代码.-->
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey="
	type="text/javascript" charset="utf-8"></script>




<link href="http://zigong.wxcs.cn/web-theme/images/favicon.ico"
	rel="Shortcut Icon">
<script src="res/jquery.js" type="text/javascript"></script>
<script src="res/jquery-ui-1.js" type="text/javascript"></script>
<script type="text/javascript" src="res/touch.js"></script>
<script type="text/javascript" src="res/pc_hxl.js"></script>
<script type="text/javascript" src="res/trim.js"></script>
<script type="text/javascript" src="res/autoFill.js"></script>
<script type="text/javascript" src="res/grayscale.js"></script>
<script> function loading(type) { if ("0" == type) { jQuery("#popCover").show(); jQuery("#loading").show(); } else if ("1" == type) { jQuery("#popCover").hide(); jQuery("#loading").hide(); } } </script>
<meta content="text/html; charset=UTF-8" http-equiv="content-type">
<link href="http://zigong.wxcs.cn/web-theme/images/favicon.ico"
	rel="Shortcut Icon">
<link href="http://192.168.1.109/ecity/zigong/www/bsy?navCode=bsy"
	rel="canonical">
<link href="res/main_002.css" rel="stylesheet" type="text/css">
<link href="res/main.css" rel="stylesheet" type="text/css">
<link class="lfr-css-file" href="res/main_003.css" rel="stylesheet"
	type="text/css">
<style type="text/css"></style>
<style type="text/css"></style>
<link charset="utf-8" href="res/a_002.css" rel="stylesheet"
	type="text/css" id="aui_3_4_0_1_58">
<link charset="utf-8" href="res/a.css" rel="stylesheet" type="text/css"
	id="aui_3_4_0_1_76">
</head>
<body
	class=" yui3-skin-sam controls-visible signed-out public-page site">
	<div id="totop" style="display: none;"></div>
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
	<script type="text/javascript">
		
			function shareToQQWb(obj){
				var name = $(obj).find("span[cmd=shareToQQ_name]").text();
				var game_id = $(obj).find("span[cmd=shareToQQ_game_id]").text();
				var forum_id =$(obj).find("span[cmd=shareToQQ_forum_id]").text() ;
				var _t = name;
				var _url = "http://shuobang1234.gicp.net:8088/wxcs/game_get?gameInfo.id="+game_id+"&forum.id="+forum_id;
				
				var _appkey = "";//你从腾讯获得的appkey
				var _pic = '';//（列如：var _pic='图片url1|图片url2|图片url3....）
				var _site = '';//你的网站地址
				var _u = 'http://v.t.qq.com/share/share.php?title='+_t+'&url='+_url+'&appkey='+_appkey+'&site='+_site+'&pic='+_pic;
				window.open( _u,'转播到腾讯微博', 'width=700, height=680, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no' );
			}
			
			function shareTo139WB(obj){
				
				
				//分享微博还不让在后面跟多余的参数.直接舍弃掉&后面的内容.新浪的可以.
				var share_text = $(obj).find("span[cmd=shareTo139_name]").text();
				var game_id = $(obj).find("span[cmd=shareTo139_game_id]").text();
				var forum_id =$(obj).find("span[cmd=shareTo139_forum_id]").text();
				var share_link = "http://shuobang1234.gicp.net:8088/wxcs/game_get?gameInfo.id="+game_id+"&forum.id="+forum_id;
				
				var _u = 'http://app.weibo.10086.cn/apps/share/share.php?app_text='+share_text+'&app_link='+share_link;
				window.open( _u,'转播到移动微博', 'width=700, height=680, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no' );
				
			}
			
			
			
		</script>



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
		<script>/*<![CDATA[*/window.onload=function(){var a=window.location.href;jQuery.ajax({type:"POST",async:false,url:"/bcp-server/ajax/setUrlReq.do",data:"currentUrl="+encodeURIComponent(a)+"&areaCode=510300",success:function(b){}})};function usercancel(){jQuery.getJSON("/bcp-server/ajax/reqWebCancelAcountSuccess.do?jsoncallback=?",{areaCode:"510300"},function(a){document.cookie="nickName=;domain=.wxcs.cn;path=/";document.cookie="email=;domain=.wxcs.cn;path=/";document.cookie="mobile=;domain=.wxcs.cn;path=/";document.cookie="userLogo=;domain=.wxcs.cn;path=/";if(a.status=="0"){window.location.reload(true)}else{window.close()}})}function isNotBlank(a){if(a==null||a==""||a==undefined){return false}else{return true}}jQuery(function(){jQuery.getJSON("/bcp-server/ajax/setUrlsReq.do?jsoncallback=?",{},function(d){var a=d.status;var f=d.nickName;if("false"==a){var b=document.location.href;b=encodeURIComponent(b);jQuery(".topnav .welcome").html("欢迎进入无线城市，请 <a href='https://ac.wxcs.cn/login?forwardURL="+b+"&areaName=zigong&jumpType=1' class='orangetxt' id='login_win_show'>登录</a> | <a href='/pub/register?areaName=zigong&jumpType=1'>注册</a>");var e=window.location.href;jQuery.getJSON("/bcp-server/ajax/autoLogin.do?jsoncallback=?",{url:encodeURIComponent(e)},function(h){var g=h.status;if(g=="true"){location.href=h.url}})}else{jQuery(".topnav .welcome").html("欢迎进入无线城市：<a href='/pub/personalcenter?areaName=zigong&jumpType=1&tab=wdsy' style='color:#fc4519;font-weight: bold;'>"+f+"</a> <a href='#' onclick='showMessageBox(100,1,1);'>退出</a>&nbsp;|&nbsp;<a style='vertical-align: baseline;'  href='/pub/personalcenter?tab=xxzx&areaName=zigong&jumpType=1'><img src='images/mes.jpg' style='vertical-align: text-top;' /><span style='color:red;margin-left:5px;'>0</span></a>");jQuery("#web_channel_nav").append("<li style='border:none' id='personalcenter'><a href='/pub/personalcenter?areaName=zigong&jumpType=1&tab=wdsy'>个人主页</a></li>")}});jQuery(".searchBox .hotWordSearch a").bind("click",function(){location.href="/pub/websearchhaskey?searchKey="+encodeURIComponent(jQuery(this).html())+"&searchType=0&areaName=zigong&jumpType=1";function a(b){if(b&&b.preventDefault){b.preventDefault()}else{window.event.returnValue=false}return false}})});jQuery(function(){var a=document.getElementById("divSel");var b=document.getElementById("divSel2");var d=document.getElementById("keyWord");if(!+"\v1"){a.onmouseleave=function(){a.style.display="none"};b.onmouseleave=function(){a.style.display="none"};d.onmouseenter=function(){a.style.display="none"}}else{d.onmouseover=function(g){var f=g.relatedTarget;if(!f||(!(f.compareDocumentPosition(this)&8)&&f!==this)){a.style.display="none"}};b.onmouseout=function(g){var f=g.relatedTarget;if(!f||(!(f.compareDocumentPosition(this)&8)&&f!==this)){a.style.display="none"}};a.onmouseout=function(g){var f=g.relatedTarget;if(!f||(!(f.compareDocumentPosition(this)&8)&&f!==this)){a.style.display="none"}}}});search=function(){var d=document.getElementById("keyWord").value;var b=document.getElementById("searchType").value;var a="";if(null==d||""==jQuery.trim(d)){a="/pub/webecityhotrecommend?areaName=zigong&jumpType=1"}else{if(/[`~%!@#^=''?~！@#￥……&——‘”“'？*()（）\+\-，,。.、《》<>：；|/\\{}｛｝【】\[\]]/.test(d)){showMessageBox("","您输入的内容含有特殊字符，请重新输入","");return}var b=document.getElementById("searchType").value;a="/pub/websearchhaskey?searchKey="+encodeURIComponent(jQuery.trim(d))+"&searchType="+b+"&areaName=zigong&jumpType=1"}jQuery.getJSON("/bcp-server/ajax/verifyKeyWord.do?jsoncallback=?",{content:d,type:"search"},function(e){if("true"==e.result){showMessageBox("",e.resultMsg,"")}else{location.href=a}})};selType=function(a){document.getElementById("searchType").value=a};jQuery(function(){if(""!=""){jQuery("#keyWord").val("")}else{jQuery("#keyWord").val("电费")}});jQuery(function(){document.onkeydown=function(a){var b=a||window.event||arguments.callee.caller.arguments[0];if(b&&b.keyCode==13){search()}}});var index=-1;var maxlen=0;jQuery(function(){jQuery("#searchListHead").empty().hide();jQuery("#keyWord").keyup(function(d){var f=d||window.event;var b=f.keyCode;if(b==38||b==40){if(b==38){index--;if(index<0){index=maxlen-1}}else{if(b==40){index++;if(index>(maxlen-1)){index=0}}}var a=jQuery("#searchListHead").find("li:eq("+index+")");a.css("background","#e8f4fc").siblings().css("background","");jQuery("#searchKey").val(jQuery("#searchListHead").find("li:eq("+index+")").html());jQuery("#keyWord").val(jQuery("#searchListHead").find("li:eq("+index+")").html())}else{index=-1;jQuery("#searchListHead").empty();c=jQuery.trim(jQuery("#keyWord").val());if(c!=""){jQuery.getJSON("/bcp-server/ajax/reqWebSuggestList.do?jsoncallback=?",{searchKey:c,areaCode:"510300"},function(g){var h=g.suggestList;jQuery("#searchListHead").empty().hide();jQuery("#searchListHead").append(h);if(jQuery.trim(h)!=""){jQuery("#searchListHead").show()}else{jQuery("#searchListHead").empty().hide()}maxlen=jQuery("#searchListHead ul li").length})}else{jQuery("#searchListHead").empty().hide()}}});jQuery("#searchListHead ul li").live("click",function(){var a=this;jQuery("#keyWord").attr("value",jQuery(a).html());jQuery("#searchListHead").empty().hide();return false});jQuery(document).bind("click",function(){jQuery("#searchListHead").empty().hide()});jQuery("#searchListHead ul li").live("touchend",function(){var a=this;jQuery("#keyWord").attr("value",jQuery(a).html());jQuery("#searchListHead").empty().hide();return false});jQuery("#keyWord").live("click",function(){jQuery("#keyWord").attr("value","")})});function go2Page(b){var a="/pub/websearchhaskey?";if(null!=b){a=a+"searchKey="+encodeURIComponent(b)+"&"}a=a+"&areaName=zigong&jumpType=1";location.href=a}function showMessageBox(f,e,h){jQuery("#tipTitle").html(e);jQuery("#xyqda").attr("style","margin-left:0px;");if(f=="100"){jQuery("#tipTitle").html("您确定要退出登录吗?");jQuery("#xyqda").unbind("click");jQuery("#xyqda").click(function(){closeTsLogout();usercancel()});jQuery("#xyqxa").show()}else{jQuery("#xyqda").unbind("click");jQuery("#xyqda").click(function(){closeTsLogout()});jQuery("#xyqda").attr("style","margin-left:60px;");jQuery("#xyqxa").hide()}jQuery("#wwwchannel").show().css({zIndex:"9999",position:"absolute"});var d=jQuery(document.body).width();var b=jQuery(window).height();var a=jQuery(document.body).height();var g=document.documentElement.clientHeight;jQuery(".popCover").css("height",g);jQuery(".popCover").css("width",d);jQuery(".popCover").show();centerLogout(jQuery("#wwwchannel"));jQuery(window).scroll(function(){centerLogout(jQuery("#wwwchannel"))});jQuery(window).resize(function(){centerLogout(jQuery("#wwwchannel"))})}function centerLogout(d){var a=document.documentElement.clientWidth;var f=document.documentElement.clientHeight;var e=d.height();var b=d.width();d.css({top:(f-e-200)/2+jQuery(document).scrollTop()+130,left:(a-b)/2});jQuery(".popCover").css({height:f+jQuery(document).scrollTop()})}function closeTsLogout(){jQuery("#wwwchannel").hide();jQuery(".popCover").hide();jQuery(window).unbind()}function wwwdl(){var a=document.location.href;a=encodeURIComponent(a);location.href="https://ac.wxcs.cn/login?forwardURL="+a+"&areaName=zigong&jumpType=1"}function centerGun(b){var a=document.documentElement.clientWidth;var d=document.documentElement.clientHeight;jQuery(".popCover").css({height:d+jQuery(document).scrollTop()})}function centerGunDJ(){jQuery(window).scroll(function(){centerGun(jQuery(".popCover"))});jQuery(window).resize(function(){centerGun(jQuery(".popCover"))});var a=jQuery(document.body).width();jQuery(".popCover").css("width",a);jQuery(".popCover").show()};/*]]>*/</script>
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
欢迎进入无线城市，请 <a
	href="https://ac.wxcs.cn/login?forwardURL=http%3A%2F%2Fzigong.wxcs.cn%2Fbsy%3FnavCode%3Dbsy&amp;areaName=zigong&amp;jumpType=1"
	class="orangetxt" id="login_win_show">登录</a> | <a
	href="http://zigong.wxcs.cn/pub/register?areaName=zigong&amp;jumpType=1">注册</a>
					</div>
				</div>
			</div>
			<div class="greenLine"></div>
		</div>
		<div class="header">
			<a href="http://zigong.wxcs.cn/index"><div
					class="logo"></div></a>
			<div class="logoline"></div>
			<div class="city_on">
				<span class="cityName">自贡</span>[<a
					href="http://www.wxcs.cn/nav/navWeb.jsp?localAreaId=510300&amp;areaName=zigong&amp;jumpType=1">切换城市</a>]
			</div>
			<div class="weather">
				晴转多云 <img src="res/T01.png"> <img src="res/T02.png">
				23℃~34℃
			</div>
			<input id="searchType" value="0" type="hidden">
			<div class="searchBox">
				<div id="divSel2">
					<div class="s_item">
<span class="sel">全部</span> <input value="电费"
	id="keyWord" maxlength="100" class="sInput"
	type="text">
<div id="searchListHead" name="searchListHead"
	class="search_list" style="display: none;"></div>
					</div>
					<input value="" class="sBtn" onclick="search();"
type="button">
					<div class="selBox" id="divSel"
style="background: none repeat scroll 0% 0% white; display: none;">
<a href="#" onclick="selType(0);">全部</a> <a href="#"
	onclick="selType(1);">应用</a> <a href="#"
	onclick="selType(2);">资讯</a>
					</div>
				</div>
				<div class="hotWordSearch">
					<span class="orangetxt">热搜词：</span> <a
href="javascript:go2Page('%E4%BF%9D%E9%99%A9');">保险</a>
					<a href="javascript:go2Page('%E6%B0%B4%E8%B4%B9');">水费</a>
					<a href="javascript:go2Page('%E4%BA%A4%E9%80%9A');">交通</a>
				</div>
				<div class="search_tip" style="display: none">
					根据相关法律法规和政策，搜索结果未予显示，请更换关键词后重新查询.</div>
			</div>
		</div>
		<!-- 弹出层 -->
		<div
			style="height: auto; left: 417px; top: 156.5px; z-index: 9999; position: absolute; display: none;"
			class="new_kind_pop_win" id="wwwchannel">
			<div class="pop_title" style="height: 35px;">温馨提示</div>
			<div class="popContainer" style="height: 140px;">
				<div class="life_c1">
					<div
style="font-size: 14px; text-align: center; line-height: 37px; margin-top: 25px; color: #888888; *margin-left: -25px;">
<dd id="tipTitle"></dd>
					</div>
					<div class="upload_img_save" style="top: 125px;">
<a id="xyqda" href="javascript:void(0);"
	class="upload_img_save_btn mar_ten">确定</a><a
	id="xyqxa" href="javascript:void(0);"
	class="upload_img_no_btn" onclick="closeTsLogout();">取消</a>
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
							<div id="p_p_id_web_channel_nav_WAR_webportlet_"
								class="portlet-boundary portlet-boundary_web_channel_nav_WAR_webportlet_ portlet-static portlet-static-end portlet-borderless web_channel_nav-portlet ">
								<span id="p_web_channel_nav_WAR_webportlet"></span>
								<div class="portlet-body">
									<div class="cls_bcp">
										<div class="portlet-borderless-container" style="">
<div class="portlet-body">
	<div class="remoteHtml">
		<script>/*<![CDATA[*/jQuery(function(){if(location.href.split("/")[location.href.split("/").length-1]=="index"){jQuery(".navBar li").eq(0).attr("class","navAt")}});/*]]>*/</script>
		<div class="navBar">
			<ul id="web_channel_nav">
				<li><a
					href="http://zigong.wxcs.cn/index?navCode=index">首页</a></li>
				<li><a href="http://zigong.wxcs.cn/bsy?navCode=bsy">办事易</a></li>
				<li><a href="http://zigong.wxcs.cn/sht?navCode=sht">生活通</a></li>
				<li><a href="http://zigong.wxcs.cn/txy?navCode=txy">天下游</a></li>
				<li><a href="http://zigong.wxcs.cn/lgh?navCode=lgh">乐购惠</a></li>
				<li class="navAt"><a
					href="http://shuobang1234.gicp.net:8088/wxcs/forum_listHot">生活娱乐</a></li>
				<li><a
					href="http://zigong.wxcs.cn/pub/appcenter?navCode=appcenter&amp;areaName=zigong&amp;jumpType=1">应用中心</a></li>
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
		
<DIV style="margin-left: 200px;">当前位置：<A class="bluelink" href="http://zigong.wxcs.cn/index?navCode=index">首页</A> 
&gt;&gt; <A class="bluelink" href="forum_listHot">生活娱乐</A> 
&gt;&gt; <s:property value="forum.name"/></DIV>
		
				<div class="portlet-layout">
					<div style="width: 960px; margin: 0 auto;">
						<div style="display: block; width: 700px; float: left;">
							<div class="portlet-column box_w700" id="column-6">
								<div class="portlet-dropzone portlet-column-content box_w700"
									id="layout-column_column-6">
									<div id="p_p_id_web_all_app_new_WAR_webportlet_"
										class="portlet-boundary portlet-boundary_web_all_app_new_WAR_webportlet_ portlet-static portlet-static-end portlet-borderless web_all_app_new-portlet ">
										<span id="p_web_all_app_new_WAR_webportlet"></span>
										<div class="portlet-body">
<div class="cls_bcp">
	<div class="portlet-borderless-container" style="">
		<div class="portlet-body">
			<div class="remoteHtml">
<script>
function sinafxhref(a,c,f,g){
	f="http://zigong.wxcs.cn:80"+f;
	var b="510300";
	var d="APP_BSY";
	var e;jQuery.getJSON("/bcp-server/ajax/webGetAppDisplayMode.do?jsoncallback=?&areaName=zigong&jumpType=1",{resCode:c,areaCode:"510300",columnId:g},function(n){

		e=n.url;
		if("null"!=e){
			if("1"==n.mode){
					e="http://zigong.wxcs.cn:80"+e
				}
				jQuery.getJSON("/bcp-server/ajax/shareWeiboAddlog.do?jsoncallback=?",
						{resCode:c,resName:a,areaCode:"510300"},function(o){});
						e=e+"&columnId="+d+"&areaId="+b;
						var m=encodeURI(a);
						var j=encodeURI(e);
						var l="333cf198acc94876a684d043a6b48e14";
						var h=encodeURI;var i=encodeURI(f);
						var k="http://v.t.sina.com.cn/share/share.php?title="+m+"&url="+j+"&appkey="+l+"&site="+h+"&pic="+i;
						window.open(k,"转播到新浪微博","width=700, height=580, top=180, left=320, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=yes, status=no")
						alert("打开分享界面...");
				}else{

					

					showMessageBox("","无效应用资源，无法分享","")}})}//结束.

					var mobFlag=true;function isNotMobile(a){jQuery.ajax({url:"/bcp-server/ajax/checkIsChinaMobile.do?jsoncallback=?",type:"post",data:{mobileNum:a},async:false,dataType:"json",success:function(b){if(b.status=="0"){mobFlag=false}else{mobFlag=true}}});return mobFlag}function swithCode1(){jQuery("#picCodeId1").attr("src","http://zigong.wxcs.cn/bcp-server/ajax/admin/captcha?value="+new Date().getTime())}function swithCode2(){jQuery("#picCodeId2").attr("src","http://zigong.wxcs.cn/bcp-server/ajax/admin/captcha?value="+new Date().getTime())}function isNotBlank(a){if(a==null||a==""||a==undefined){return false}else{return true}}function isBlank(a){return !isNotBlank(a)}function getLength(e){var c=0;var a=e.value;var b=0;for(var f=0;f<a.length;f++){var d=a.charCodeAt(f);if(d>256){c=c+3}else{c=c+1}}return c};/*]]>*/</script>
				<input id="resCode" value="" type="hidden"> <input
					id="resName" value="" type="hidden"> <input
					id="user_is_login" value="1" type="hidden"> <input
					id="user_is_store" value="" type="hidden"> <input
					id="fx_url" value="" type="hidden">
				<div class="c_leftBox">
					<div class="life_c2">
<div class="subTitle">
	<div class="appList_tabTitle">
	
	<!-- 动态转换CSS文件. -->
		<script type="text/javascript">
			function turnClick(obj){
				var html = $(obj).text();
				if(html == '最新'){
					$("#newest").addClass("at");
					$("#hotest").removeClass("at");
				}else{
					$("#hotest").addClass("at");
					$("#newest").removeClass("at");
				}
			}
		</script>
	
		<a href="javascript:void(0);" class="at" id="hotest" onclick="turnClick(this)">最热</a> | <a id="newest"
			href="javascript:void(0);" onclick="turnClick(this)">最新</a>
	</div>
	全部
</div>
<div id="hot"
	class="app_new_listBox appList_tabContent"
	style="display: block;">
	<ul id="pDHotDataID">
		<s:iterator value="#games">
	<li>
		<div class="app_new_listBox_img">
		<a
			href="game_get?gameInfo.id=<s:property value="id"/>&forum.id=<s:property value="forum.id"/>"
			title="<s:property value="name"/>"><img
			style="width: 72px; height: 72px;"
			src="logo/<s:property value="logo.name"/>"></a>
	</div>
	<div class="app_new_listBox_info">
		<h3>
			<a
				href="game_get?gameInfo.id=<s:property value="id"/>&forum.id=<s:property value="forum.id"/>"
				title="<s:property value="name"/>"><s:property value="name"/> </a> <span class="count_use">(已有
				<s:property value="download_Times"/> 人使用过)</span>
		</h3>
		<p style="min-height: 40px;"><s:property value="discription"/></p>
		<p class="ping_right" style="margin-right: 70px;">
			<a class="comments"
				href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000121&amp;areaCode=510300&amp;columnId=5688&amp;areaName=zigong&amp;jumpType=1#toComment">
				<!--评论( 0 )</a> | -->
			</a><a class="t_collect" href="javascript:void(0);"
				style="cursor: pointer;"
				onclick="collection('SV510000000121')">收藏</a> | <span
				class="share show_slide"
				style="color: #555555; cursor: default;">分享到</span>
		</p>
		<!--分享-->
		<div class="tool_article tool_share" id="hotfx1_1"
			style="top: 6px;">
			<div class="tool_slide" style="overflow: visible;"
				id="hotfx3_1">
				<div class="w_tool">
					<a title="分享到移动微博" class="shareTo share139" style="cursor: pointer;"
					 href="javascript:void(0);"	onclick="shareTo139WB(this)">
						<span cmd="shareTo139_name" style="display:none;"><s:property value="name"/></span>
						<span cmd="shareTo139_game_id" style="display:none;"><s:property value="id"/></span>
						<span cmd="shareTo139_forum_id" style="display:none;"><s:property value="forum.id"/></span>
						<img src="images/139wb.png" width="16px;" height="16px;"/>
					</a>
					<a title="分享到腾讯微博" class="shareTo shareqq" style="cursor: pointer;" 
						href="javascript:void(0);" onclick="shareToQQWb(this)">
						<span cmd="shareToQQ_name" style="display:none;"><s:property value="name"/></span>
						<span cmd="shareToQQ_game_id" style="display:none;"><s:property value="id"/></span>
						<span cmd="shareToQQ_forum_id" style="display:none;"><s:property value="forum.id"/></span>
						<img src="http://v.t.qq.com/share/images/s/weiboicon16.png"/>	
					</a>
					<a title="分享到新浪微博" class="shareTo shareWeibo" style="cursor: pointer;">
						<wb:share-button count="n" title="<s:property value="name"/>"
						 url="http://shuobang1234.gicp.net:8088/wxcs/game_get?gameInfo.id=<s:property value="id"/>&forum.id=<s:property value="forum.id"/>">
						 </wb:share-button>
					</a>
					<span class="shareTo shareMore" id="_1"></span>
					<div class="shareMoreBox" style="display: none;"
						onclick="hottab2(1)" id="hotfx2_1">
						<ul>
<li style="display: none"><a
	class="sharem1" href="#recom_mob"
	onclick="javascript:showMobdiv('政务新闻','SV510000000121','5688');">短信分享</a></li>
<li class="nobd"><a class="sharem2"
	href="#recom_ema"
	onclick="javascript:showEmadiv('政务新闻','SV510000000121','5688');">邮件分享</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--分享 结束-->
	
	
	
	</div>
	<!-- 在这里隐藏一个子菜单DIV -->
	<div style="width: 500px;background-color: #f5f5f5;display: none;" >
		<ul id="item_<s:property value="id"/>">
			<li>
				android
			</li>
		</ul>
	</div>
</li>
</s:iterator>

<!-- 最热门的...加载更多..开始 -->
				</ul>
<script type="text/javascript">
	
	
</script>	
		<!-- 不足7个隐藏加载更多...
				<div class="loadMore" id="news" onclick="pagehots2()">
<a style="cursor: pointer;">加载更多</a>
				</div>
		-->
				<input id="storeHotPage" value="1" type="hidden">
				</br></br>
			</div> 
		
<!--最热...加载更多...整个 结束-->
			<!--最新-->
			<div id="new"
				class="app_new_listBox appList_tabContent"
				style="display: none;">
				<ul id="pDNewDataID">   
 
<!-- 下面从服务器获取最新的版块 -->
	<s:bean id="listCompara" name="cn.cid.cd.utils.GameInfoComparatorImpl" ></s:bean>
	<s:sort comparator="listCompara" source="#games">
	<s:iterator>
	<li>
		<div class="app_new_listBox_img">
		<a
			href="game_get?gameInfo.id=<s:property value="id"/>&forum.id=<s:property value="forum.id"/>"
			title="<s:property value="name"/>"><img
			style="width: 72px; height: 72px;"
			src="logo/<s:property value="logo.name"/>"></a>
	</div>
	<div class="app_new_listBox_info">
		<h3>
			<a
				href="game_get?gameInfo.id=<s:property value="id"/>&forum.id=<s:property value="forum.id"/>"
				title="<s:property value="name"/>"><s:property value="name"/> </a> <span class="count_use">(已有
				<s:property value="download_Times"/> 人使用过)</span>
		</h3>
		<p style="min-height: 40px;"><s:property value="discription"/></p>
		<p class="ping_right" style="margin-right: 70px;">
			<a class="comments"
				href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000121&amp;areaCode=510300&amp;columnId=5688&amp;areaName=zigong&amp;jumpType=1#toComment">
				<!--评论( 0 )</a> | -->
			</a><a class="t_collect" href="javascript:void(0);"
				style="cursor: pointer;"
				onclick="collection('SV510000000121')">收藏</a> | <span
				class="share show_slide"
				style="color: #555555; cursor: default;">分享到</span>
		</p>
		<!--分享-->
		
		
		<div class="tool_article tool_share" id="hotfx1_1"
			style="top: 6px;">
			<div class="tool_slide" style="overflow: visible;"
				id="hotfx3_1">
				<div class="w_tool">
					<a title="分享到移动微博" class="shareTo share139" style="cursor: pointer;"
					 href="javascript:void(0);"	onclick="shareTo139WB(this)">
						<span cmd="shareTo139_name" style="display:none;"><s:property value="name"/></span>
						<span cmd="shareTo139_game_id" style="display:none;"><s:property value="id"/></span>
						<span cmd="shareTo139_forum_id" style="display:none;"><s:property value="forum_id"/></span>
						<img src="images/139wb.png" width="16px;" height="16px;"/>
					</a>
					<a title="分享到腾讯微博" class="shareTo shareqq" style="cursor: pointer;"
						href="javascript:void(0)"  onclick="shareToQQWb(this)">
						<span cmd="shareToQQ_name" style="display:none;"><s:property value="name"/></span>
						<span cmd="shareToQQ_game_id" style="display:none;"><s:property value="id"/></span>
						<span cmd="shareToQQ_forum_id" style="display:none;"><s:property value="forum_id"/></span>
						<img src="http://v.t.qq.com/share/images/s/weiboicon16.png"/>
						</a>
					<a title="分享到新浪微博" class="shareTo shareWeibo" style="cursor: pointer;">
						<wb:share-button count="n" title="<s:property value="name"/>"
						 url="http://shuobang1234.gicp.net:8088/wxcs/game_get?gameInfo.id=<s:property value="id"/>&forum.id=<s:property value="forum.id"/>"></wb:share-button>
					</a>
					<span class="shareTo shareMore" id="_1"></span>
					<div class="shareMoreBox" style="display: none;"
						onclick="hottab2(1)" id="hotfx2_1">
						<ul>
<li style="display: none"><a
	class="sharem1" href="#recom_mob"
	onclick="javascript:showMobdiv('政务新闻','SV510000000121','5688');">短信分享</a></li>
<li class="nobd"><a class="sharem2"
	href="#recom_ema"
	onclick="javascript:showEmadiv('政务新闻','SV510000000121','5688');">邮件分享</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--分享 结束-->
	</div>
</li>
</s:iterator>
</s:sort>
				</ul>
	<input id="storeHotPage" value="1" type="hidden">
				</br></br>
			</div> 
	
<!-- 获取最新版块结束 -->
<!-- 隐藏加载更多...
				<input id="storeNewPage" value="1" type="hidden">
				<div class="loadMore" id="hots" onclick="pagenews2()">
<a style="cursor: pointer;">加载更多</a>
				</div>
			</div>
 -->
<!--最新 结束-->
<!-- 分享结果-->
<!-- 短信分享 -->

<!--   邮件分享-->


<!--收藏弹窗-->
<!--收藏弹窗-->
<!--收藏弹窗 新建分类-->
					</div>
				</div>
				<!--收藏弹窗 新建分类-->
			</div>
			</div>

	</div>
	</div>
										</div>
									</div>
									</div>
							</div>
						</div>
						<div style="display: block; width: 250px; float: right;">
							<div class="portlet-column box_w250" id="column-7">
								<div class="portlet-dropzone portlet-column-content box_w250"
									id="layout-column_column-7">
									<div id="p_p_id_www_top10_1_WAR_webportlet_"
										class="portlet-boundary portlet-boundary_www_top10_1_WAR_webportlet_  portlet-static portlet-static-end portlet-borderless www_top10_1-portlet ">
										<span id="p_www_top10_1_WAR_webportlet"></span>

										<div class="portlet-body">
<div class="cls_bcp">
<div class="portlet-borderless-container" style="">
<div class="portlet-body">
<div class="remoteHtml">
				<script>
function showApp(resCode) {
	var areaCode = "510300";
	var columnCode='';
		jQuery.getJSON("/bcp-server/ajax/webGetAppDisplayMode.do?jsoncallback=?&areaName=zigong&jumpType=1", {resCode:resCode,areaCode:'510300'}, function(data) {
			if (null != data.url && "" != data.url && "null"!=data.url) {
				if (data.mode == "1") {
    				location.href = "app?resCode=" + resCode+"&columnId="+columnCode+"&areaId="+areaCode+"&areaName=zigong&jumpType=1";
    			} else {
					location.href = data.url;
				}
			} else {
				showMessageBox('',"无效应用资源,请与客服联系!",'');
			}
       	});
	}

jQuery(function(){
	/*窗体加载 判断右翻页是否可用*/
	var spancount = '5';
	if(spancount == 1){
		jQuery("#next_s1").removeClass("weekly_page_next");
		jQuery("#next_s1").addClass("weekly_page_next weekly_page_next_gray");
	}
});
	var spancount = '5';
/*page index*/
var weeklyPageAt=0;
var weeklypageNum=jQuery('.weekHot ol').length;
jQuery("#pre_s1").click(function(){
weeklyPageAt=weeklyPageAt-1;
if(weeklyPageAt>0){
jQuery(".weekHot").animate({marginLeft:-248*weeklyPageAt+"px"},500);
jQuery(".weekly_page").html(weeklyPageAt+1);
jQuery(".weekly_page_next").removeClass("weekly_page_next_gray");

}
else{
weeklyPageAt=0;
jQuery(".weekHot").animate({marginLeft:-248*weeklyPageAt+"px"},500);
jQuery(".weekly_page").html(weeklyPageAt+1);
jQuery(".weekly_page_pre").addClass("weekly_page_pre_gray");
}

/*上一页*/
		jQuery("#pre_s1").removeClass();
		jQuery("#next_s1").removeClass(); 
		if(weeklypageNum >= "1"){
			if(weeklypageNum == "1"){
				jQuery("#pre_s1").addClass("weekly_page_pre weekly_page_pre_gray");
				jQuery("#next_s1").addClass("weekly_page_next weekly_page_next_gray");
			}else if(weeklyPageAt >= "0"){
				if(weeklyPageAt == "0"){
					jQuery("#pre_s1").addClass("weekly_page_pre weekly_page_pre_gray");
					jQuery("#next_s1").addClass("weekly_page_next weekly_page_next_gray");
				}else if(weeklyPageAt == (weeklypageNum-1)){
					jQuery("#pre_s1").addClass("weekly_page_pre");
					jQuery("#next_s1").addClass("weekly_page_next weekly_page_next_gray");
				}else{
					jQuery("#pre_s1").addClass("weekly_page_pre");
					jQuery("#next_s1").addClass("weekly_page_next weekly_page_next_gray");
				}
			}
		}else{
			jQuery("#pre_s1").addClass("weekly_page_pre weekly_page_pre_gray");
			jQuery("#next_s1").addClass("weekly_page_next weekly_page_next_gray");
		}
		
});
jQuery("#next_s1").click(function(){
weeklyPageAt=weeklyPageAt+1;
if(weeklyPageAt<weeklypageNum-1){
jQuery(".weekHot").animate({marginLeft:-248*weeklyPageAt+"px"},500);
jQuery(".weekly_page").html(weeklyPageAt+1);
jQuery(".weekly_page_pre").removeClass("weekly_page_pre_gray");
}
else{
weeklyPageAt=weeklypageNum-1;
jQuery(".weekHot").animate({marginLeft:-248*weeklyPageAt+"px"},500);
jQuery(".weekly_page").html(weeklypageNum);
jQuery(".weekly_page_next").addClass("weekly_page_next_gray");
} 

/*下一页*/
		jQuery("#pre_s1").removeClass();
		jQuery("#next_s1").removeClass(); 
		
		if(spancount == 2){
			jQuery("#pre_s1").addClass("appList_page_pre");
        	jQuery("#next_s1").addClass("appList_page_next appList_page_next_gray");
    	}else if(spancount == 1){
			jQuery("#pre_s1").addClass("appList_page_pre appList_page_pre_gray");
        	jQuery("#next_s1").addClass("appList_page_next appList_page_next_gray");
		}else{
    		if(weeklyPageAt == "1" && (weeklypageNum-1) != "0"){
    			jQuery("#pre_s1").addClass("weekly_page_pre");
    			jQuery("#next_s1").addClass("weekly_page_next weekly_page_next_gray");
    		}else if(weeklyPageAt == (weeklypageNum-1) && (weeklypageNum-1) != "0"){
    			jQuery("#pre_s1").addClass("weekly_page_pre");
    			jQuery("#next_s1").addClass("weekly_page_next weekly_page_next_gray");
    		}else if((weeklypageNum-1) == "0" || weeklypageNum == "0"){
    			jQuery("#pre_s1").addClass("weekly_page_pre weekly_page_pre_gray");
    			jQuery("#next_s1").addClass("weekly_page_next weekly_page_next_gray");
    		}else{
    			jQuery("#pre_s1").addClass("weekly_page_pre");
    			jQuery("#next_s1").addClass("weekly_page_next weekly_page_next_gray");
    		}
		}
		
});
</script>

				<div class="c_right">
					<div class="c_rightBox">
<div class="weekHotBox">
	<div class="cTitle index_weekHot_title">
		<div class="weekly_pageBox">
			<span class="weekly_page">1</span>/5 <span
				id="pre_s1"
				class="weekly_page_pre weekly_page_pre_gray"
				style="cursor: pointer;"></span><span id="next_s1"
				class="weekly_page_next" style="cursor: pointer;"></span>
		</div>
		排行榜
	</div>
	<div class="weekHot"
		style="width: 1240px; overflow: hidden;">
		<!-- 第1页 -->
		<ol style="float: left; width: 248px;">
			<li>
				<div class="order orderoneAt">
					<span class="order_gray">1</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000149&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357627970603.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000149&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="旧车市场"> 旧车市场 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">2</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000141&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357621932227.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000141&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="客运信息"> 客运信息 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">3</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000145&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357626470654.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000145&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="找停车场"> 找停车场 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">4</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000142&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357622918512.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000142&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="找代售点"> 找代售点 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">5</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000147&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357627293451.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000147&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="找服务区"> 找服务区 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">6</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000126&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357611163332.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000126&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="常用电话"> 常用电话 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">7</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000146&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357626791743.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000146&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="找加油站"> 找加油站 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">8</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000127&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357612511651.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000127&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="社保政策"> 社保政策 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">9</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000123&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357540747413.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000123&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="办公地点"> 办公地点 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">10</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000129&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357613845584.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000129&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="低保信息"> 低保信息 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
		</ol>
		<!-- 第2页 -->
		<ol style="float: left; width: 248px;">
			<li>
				<div class="order orderoneAt">
					<span class="order_gray">11</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000165&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1359006136262.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000165&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="长途订票"> 长途订票 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">12</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000121&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357540367964.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000121&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="政务新闻"> 政务新闻 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">13</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000139&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357621269167.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000139&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="高速信息"> 高速信息 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">14</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000137&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357620590649.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000137&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="机场巴士"> 机场巴士 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">15</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000182&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1361525661371.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000182&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="物价信息"> 物价信息 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">16</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000122&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357540533857.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000122&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="办事指南"> 办事指南 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">17</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000189&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1364528828345.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000189&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="手机购买"> 手机购买 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">18</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000120&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357536294875.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000120&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="公示公告"> 公示公告 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">19</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000184&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1364527390425.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000184&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="超市查询"> 超市查询 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">20</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000172&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1361520327557.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000172&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="商场超市"> 商场超市 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
		</ol>
		<!-- 第3页 -->
		<ol style="float: left; width: 248px;">
			<li>
				<div class="order orderoneAt">
					<span class="order_gray">21</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000164&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1359005924152.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000164&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="出租查询"> 出租查询 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">22</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000135&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357617543607.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000135&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="酒后代驾"> 酒后代驾 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">23</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000128&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357612878000.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000128&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="医保网点"> 医保网点 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">24</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000138&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357620944906.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000138&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="首末班查询"> 首末班查询 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">25</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000136&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357618011011.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000136&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="交通公告"> 交通公告 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">26</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000130&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357614361916.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000130&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="税收政策"> 税收政策 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">27</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000152&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1364973729599.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000152&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="公交查询"> 公交查询 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">28</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000132&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357615533204.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000132&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="车船缴纳"> 车船缴纳 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">29</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000133&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357616020867.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000133&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="证件办理"> 证件办理 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">30</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000156&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357701215231.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000156&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="电费查缴"> 电费查缴 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
		</ol>
		<!-- 第4页 -->
		<ol style="float: left; width: 248px;">
			<li>
				<div class="order orderoneAt">
					<span class="order_gray">31</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000167&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1359011527185.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000167&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="燃气查缴"> 燃气查缴 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">32</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000157&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357789851750.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000157&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="驾讯通"> 驾讯通 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">33</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000148&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357627624683.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000148&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="排检单位"> 排检单位 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">34</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000160&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1359002051579.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000160&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="交通视频"> 交通视频 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">35</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000134&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357617172813.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000134&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="实时路况"> 实时路况 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">36</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000131&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357615159455.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000131&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="房税政策"> 房税政策 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">37</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000150&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1357628343126.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000150&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="汽修查询"> 汽修查询 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">38</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000166&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1359006289764.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000166&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="航班查询"> 航班查询 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">39</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000163&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1359005689557.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000163&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="交通路况"> 交通路况 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">40</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000168&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1361518834997.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000168&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="WLAN热点"> WLAN热点 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
		</ol>
		<!-- 第5页 -->
		<ol style="float: left; width: 248px;">
			<li>
				<div class="order orderoneAt">
					<span class="order_gray">41</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000176&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1361522238813.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000176&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="景点查询"> 景点查询 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">42</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000181&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1361525347088.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000181&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="影院影讯"> 影院影讯 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">43</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000179&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1361523805728.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000179&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="银行信息"> 银行信息 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">44</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000162&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1359005516681.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000162&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="电视缴费"> 电视缴费 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">45</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000159&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1359001806031.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000159&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="贷款计算"> 贷款计算 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">46</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000187&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1364528262778.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000187&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="银行展现"> 银行展现 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">47</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000161&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1359005344770.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000161&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="电视查询"> 电视查询 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">48</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000158&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1359001340306.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000158&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="便民问答"> 便民问答 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">49</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000193&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1364531865294.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000193&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="wlan查询"> wlan查询 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
			<li>
				<div class="order">
					<span class="order_gray">50</span>
					<div class="weekHotImg">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000183&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"><img
							src="res/1362472917125.png"
							onerror="this.src='/images/terminalPackage/icon_small_default.png'"
							height="48" width="48"></a>
					</div>
					<div class="weekHotInfo">
						<a
							href="http://zigong.wxcs.cn/bcp-server/ajax/AppPageServlet?version=www&amp;resCode=SV510000000183&amp;areaCode=510300&amp;columnId=0&amp;areaName=zigong&amp;jumpType=1"
							title="升学政策"> 升学政策 </a>
						<div class="weekHot_ct"></div>
					</div>
				</div>
			</li>
		</ol>
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
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="portlet-layout">
					<div class="portlet-column portlet-column-only" id="column-9">
						<div
							class="portlet-dropzone portlet-column-content portlet-column-content-only"
							id="layout-column_column-9">
							<div id="p_p_id_web_channel_tail_WAR_webportlet_"
								class="portlet-boundary portlet-boundary_web_channel_tail_WAR_webportlet_ portlet-static portlet-static-end portlet-borderless web_channel_tail-portlet ">
								<span id="p_web_channel_tail_WAR_webportlet"></span>
								<div class="portlet-body">
									<div class="cls_bcp">
										<div class="portlet-borderless-container" style="">
<div class="portlet-body">
	<div class="remoteHtml">
		<div class="footer">
			<div class="friendLink">
				<a
					href="http://zigong.wxcs.cn/pub/sitemap?tab=1&amp;areaName=zigong&amp;jumpType=1">网站地图</a>
				| <a
					href="http://zigong.wxcs.cn/pub/friendlink?tab=2&amp;areaName=zigong&amp;jumpType=1">友情链接</a>
				| <a
					href="http://zigong.wxcs.cn/pub/aboutus?tab=3&amp;areaName=zigong&amp;jumpType=1">关于无线城市</a>
				| <a
					href="http://zigong.wxcs.cn/pub/feedback?tab=4&amp;areaName=zigong&amp;jumpType=1">意见反馈</a>
				| <a
					href="http://zigong.wxcs.cn/pub/servicesm?tab=5&amp;areaName=zigong&amp;jumpType=1">服务声明</a>
				| <a
					href="http://zigong.wxcs.cn/pub/sitehelp?tab=6&amp;areaName=zigong&amp;jumpType=1">常见问题</a>
			</div>
			<div class="copyRight">中国移动通信版权所有 粤08034647-12号</div>
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
			</div>
			<form action="#" id="hrefFm" method="post" name="hrefFm">
				<span></span>
			</form>
		</div>
	</div>
	<script src="res/main_002.js" type="text/javascript"></script>
	<script type="text/javascript">/*<![CDATA[*/Liferay.Util.addInputFocus();/*]]>*/</script>
	<script type="text/javascript">/*<![CDATA[*/Liferay.Portlet.onLoad({canEditTitle:false,columnPos:1,isStatic:"end",namespacedId:"p_p_id_web_all_app_new_WAR_webportlet_",portletId:"web_all_app_new_WAR_webportlet",refreshURL:"\x2fc\x2fportal\x2frender_portlet\x3fp_l_id\x3d182288\x26p_p_id\x3dweb_all_app_new_WAR_webportlet\x26p_p_lifecycle\x3d0\x26p_t_lifecycle\x3d0\x26p_p_state\x3dnormal\x26p_p_mode\x3dview\x26p_p_col_id\x3dcolumn-6\x26p_p_col_pos\x3d1\x26p_p_col_count\x3d2\x26p_p_isolated\x3d1\x26currentURL\x3d\x252Fecity\x252Fzigong\x252Fwww\x252Fbsy\x253FnavCode\x253Dbsy"});Liferay.Portlet.onLoad({canEditTitle:false,columnPos:1,isStatic:"end",namespacedId:"p_p_id_web_channel_nav_WAR_webportlet_",portletId:"web_channel_nav_WAR_webportlet",refreshURL:"\x2fc\x2fportal\x2frender_portlet\x3fp_l_id\x3d182288\x26p_p_id\x3dweb_channel_nav_WAR_webportlet\x26p_p_lifecycle\x3d0\x26p_t_lifecycle\x3d0\x26p_p_state\x3dnormal\x26p_p_mode\x3dview\x26p_p_col_id\x3dcolumn-1\x26p_p_col_pos\x3d1\x26p_p_col_count\x3d2\x26p_p_isolated\x3d1\x26currentURL\x3d\x252Fecity\x252Fzigong\x252Fwww\x252Fbsy\x253FnavCode\x253Dbsy"});Liferay.Portlet.onLoad({canEditTitle:false,columnPos:0,isStatic:"end",namespacedId:"p_p_id_web_channel_tail_WAR_webportlet_",portletId:"web_channel_tail_WAR_webportlet",refreshURL:"\x2fc\x2fportal\x2frender_portlet\x3fp_l_id\x3d182288\x26p_p_id\x3dweb_channel_tail_WAR_webportlet\x26p_p_lifecycle\x3d0\x26p_t_lifecycle\x3d0\x26p_p_state\x3dnormal\x26p_p_mode\x3dview\x26p_p_col_id\x3dcolumn-9\x26p_p_col_pos\x3d0\x26p_p_col_count\x3d1\x26p_p_isolated\x3d1\x26currentURL\x3d\x252Fecity\x252Fzigong\x252Fwww\x252Fbsy\x253FnavCode\x253Dbsy"});Liferay.Portlet.onLoad({canEditTitle:false,columnPos:0,isStatic:"end",namespacedId:"p_p_id_web_reputation_recommend_WAR_webportlet_",portletId:"web_reputation_recommend_WAR_webportlet",refreshURL:"\x2fc\x2fportal\x2frender_portlet\x3fp_l_id\x3d182288\x26p_p_id\x3dweb_reputation_recommend_WAR_webportlet\x26p_p_lifecycle\x3d0\x26p_t_lifecycle\x3d0\x26p_p_state\x3dnormal\x26p_p_mode\x3dview\x26p_p_col_id\x3dcolumn-6\x26p_p_col_pos\x3d0\x26p_p_col_count\x3d2\x26p_p_isolated\x3d1\x26currentURL\x3d\x252Fecity\x252Fzigong\x252Fwww\x252Fbsy\x253FnavCode\x253Dbsy"});Liferay.Portlet.onLoad({canEditTitle:false,columnPos:0,isStatic:"end",namespacedId:"p_p_id_www_channel_head_WAR_webportlet_",portletId:"www_channel_head_WAR_webportlet",refreshURL:"\x2fc\x2fportal\x2frender_portlet\x3fp_l_id\x3d182288\x26p_p_id\x3dwww_channel_head_WAR_webportlet\x26p_p_lifecycle\x3d0\x26p_t_lifecycle\x3d0\x26p_p_state\x3dnormal\x26p_p_mode\x3dview\x26p_p_col_id\x3dcolumn-1\x26p_p_col_pos\x3d0\x26p_p_col_count\x3d2\x26p_p_isolated\x3d1\x26currentURL\x3d\x252Fecity\x252Fzigong\x252Fwww\x252Fbsy\x253FnavCode\x253Dbsy"});Liferay.Portlet.onLoad({canEditTitle:false,columnPos:0,isStatic:"end",namespacedId:"p_p_id_www_top10_1_WAR_webportlet_",portletId:"www_top10_1_WAR_webportlet",refreshURL:"\x2fc\x2fportal\x2frender_portlet\x3fp_l_id\x3d182288\x26p_p_id\x3dwww_top10_1_WAR_webportlet\x26p_p_lifecycle\x3d0\x26p_t_lifecycle\x3d0\x26p_p_state\x3dnormal\x26p_p_mode\x3dview\x26p_p_col_id\x3dcolumn-7\x26p_p_col_pos\x3d0\x26p_p_col_count\x3d1\x26p_p_isolated\x3d1\x26currentURL\x3d\x252Fecity\x252Fzigong\x252Fwww\x252Fbsy\x253FnavCode\x253Dbsy"});AUI().use("aui-base","liferay-menu","liferay-notice","liferay-poller",function(a){(function(){Liferay.Util.addInputType();Liferay.Portlet.ready(function(b,c){Liferay.Util.addInputType(c)})})();(function(){new Liferay.Menu();var b=Liferay.Data.notices;for(var c=1;c<b.length;c++){new Liferay.Notice(b[c])}})()});/*]]>*/</script>
	<script src="res/main.js" type="text/javascript"></script>
	<script type="text/javascript"></script>
	<script type="text/javascript" src="res/f_ad.js"></script>
	<div style="display: none;" class="new_kind_pop_win" id="collect_pop_1">
		<div class="pop_title">
			收藏到个人主页<span class="pop_close_btn"></span>
		</div>
		<div class="popContainer">
			<div class="life_c1">
				<div class="appBox_theme">
					<form id="regform">
						<dl id="d_email">
							<dt>
								<label>选择收藏分类:</label>
							</dt>
							<dd>
								<div class="collect_u_sel">
									<pre>
										<span class="now">默认分类</span>
									</pre>
									<span class="collect_u_arrow"><img src="res/u_sel.jpg"
										alt=""></span>
								</div>
								<div class="collect_uSelList">
									<ul id="categoryUL">
									</ul>
								</div>
								<em class="pop_c2_btn">新建分类</em>
							</dd>
						</dl>
					</form>
				</div>
				<div class="upload_img_save">
					<a style="cursor: pointer;" href="javascript:void(0);"
						class="upload_img_save_btn mar_ten" onclick="resourceStore()">确定收藏</a><a
						href="javascript:void(0);" class="upload_img_no_btn"
						id="collectWin">取消</a>
				</div>
			</div>
		</div>
	</div>
	<div style="display: none;" class="new_kind_pop_win" id="collect_pop_2">
		<div class="pop_title">
			收藏到个人主页<span class="pop_close_btn" id="pop_close_btn2"></span>
		</div>
		<div class="popContainer">
			<div class="life_c1">
				<div class="appBox_theme">
					<form id="regform">
						<dl id="d_email"
							style="top: 15px; left: 15px; position: absolute; width: 400px">
							<dt>
								<label>新建分类:</label>
							</dt>
							<dd>
								<input class="inputtext" id="inputClassification2"
									onblur="if(this.value == '') this.value = this.defaultValue"
									onfocus="if(this.value == this.defaultValue) this.value = ''"
									maxlength="10" type="text">
							</dd>
						</dl>
					</form>
				</div>
				<div id="errorMsgDiv" style="display: none">
					<p style="color: red; text-align: center; line-height: 45px;">
						<img src="res/jingao_icon.png" style="vertical-align: middle;"><span
							id="errorMsg" style="vertical-align: middle;"></span>
					</p>
					<p></p>
				</div>
				<div id="successMsgDiv" style="display: none">
					<p style="color: red; text-align: center; line-height: 45px;">
						<img src="res/right_have.png" style="vertical-align: middle;"><span
							id="successMsg" style="vertical-align: middle;"></span>
					</p>
					<p></p>
				</div>
				<div class="upload_img_save">
					<a href="javascript:newStore();"
						class="upload_img_save_btn mar_ten">确定</a><a href="javascript:;"
						class="upload_img_no_btn" id="categoryWin">取消</a>
				</div>
			</div>
		</div>
	</div>
	<div id="recom_mob" class="new_kind_pop_win" style="display: none;">
		<div class="pop_title">
			分享短信<span class="pop_close_btn" onclick="fxdivclose('recom_mob')"></span>
		</div>
		<div class="popContainer">
			<div class="life_c1">
				<span id="msgshow1"
					style="display: none; color: red; margin-left: 12px;"></span>
				<div class="appBox_theme" style="top: 60px">
					<form id="regform">
						<dl>
							<dt style="width: 130px;">
								<label id="xxyj_title">请输入好友手机号:</label>
							</dt>
							<dd>
								<input id="regMob" class="inputtext" maxlength="11" type="text">
							</dd>
						</dl>
						<dl>
							<dt style="width: 130px;">
								<label>验证码:</label>
							</dt>
							<dd>
								<input class="inputtext2" id="imageCode1" type="text"><img
									class="code" id="picCodeId1" src="res/captcha.jpg"
									onclick="javascript:swithCode1();"> <a
									id="picCodeId1_hyz" class="code"
									href="javascript:swithCode1();">换一张</a>
							</dd>
						</dl>
					</form>

				</div>
				<div class="upload_img_save" style="top: 160px">
					<a class="upload_img_save_btn mar_ten" href="javascript:void(0);"
						onclick="forwordBySMS()">确定</a><a class="upload_img_no_btn"
						href="javascript:void(0);" onclick="fxdivclose('recom_mob')">取消</a>
				</div>
			</div>
		</div>
	</div>
	<div id="recom_ema" class="new_kind_pop_win" style="display: none;">
		<div class="pop_title">
			分享邮件<span class="pop_close_btn" onclick="fxdivclose('recom_ema')"></span>
		</div>
		<div class="popContainer">
			<div class="life_c1">
				<span id="msgshow2"
					style="display: none; color: red; margin-left: 12px;"></span>
				<div class="appBox_theme" style="top: 60px">
					<form id="regform">
						<dl>
							<dt style="width: 130px;">
								<label>请输入好友邮箱:</label>
							</dt>
							<dd>
								<input id="emailId" class="inputtext" type="text">
							</dd>
						</dl>
						<dl>
							<dt style="width: 130px;">
								<label>验证码:</label>
							</dt>
							<dd>
								<input class="inputtext2" id="imageCode2" type="text"><img
									class="code" id="picCodeId2" src="res/captcha.jpg"
									onclick="javascript:swithCode2();"> <a
									id="picCodeId2_hyz" class="code"
									href="javascript:swithCode2();">换一张</a>
							</dd>
						</dl>
					</form>

				</div>
				<div class="upload_img_save" style="top: 160px">
					<a class="upload_img_save_btn mar_ten" href="javascript:void(0);"
						onclick="forwordByEmail()">确定</a><a class="upload_img_no_btn"
						href="javascript:void(0);" onclick="fxdivclose('recom_ema')">取消</a>
				</div>
			</div>
		</div>
	</div>
	<div id="share_tip" class="save_success_all" style="display: none;">
		<div class="save_success"></div>
		<p id="shareResult">
			<img src="res/right_have.png">
		</p>
	</div>
</body>
</html>