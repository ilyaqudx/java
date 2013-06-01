<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">

<HEAD>
<!--添加TITLE--><title><s:property value="gameInfo.name"/></title>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 这个一定要添加,并且要添加在第一个.所有的样式前.它解决了IE中的二维码显示问题.和图片正常显示问题. -->
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<!-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| -->
<TITLE>无线城市-四川</TITLE>		 
		 		 
<LINK href="page3_files/apps_web.css" rel="stylesheet" type="text/css">
<!-- 
	解决顶和踩显示错位的问题
	<LINK href="page3_files/global.css" rel="stylesheet" type="text/css">
-->
<SCRIPT src="page3_files/jquery.js" type="text/javascript"></SCRIPT>
<SCRIPT src="page3_files/Cmenu.js" type="text/javascript"></SCRIPT>
<SCRIPT src="page3_files/slide.js" type="text/javascript"></SCRIPT>
<SCRIPT src="page3_files/requestHeaderBottomJs.htm" type="text/javascript"></SCRIPT>
<LINK href="page3_files/requestHeaderBottomStyle.css" rel="stylesheet">    

<!--添加内容CSS和JS文件-->

	<link type="text/css" rel="stylesheet" href="http://img.d.cn/android2012/androidres/css/global.css"/>
 
<link type="text/css" rel="stylesheet" href="http://img.d.cn/android2012/androidres/css/common.css"/>
<link type="text/css" rel="stylesheet" href="http://img.d.cn/android2012/androidres/css/jquery.jmodal.css"/>
<style>
    .classify ul {
        width: auto !important;
    }

    .classifyGame .classfiyType {
        width: 838px !important;
    }
</style>

<!--[if lte IE 8]>
<style type="text/css">
#logo_search dd.search input.txt{
    width:390px;
    height:18px;
    padding:11px 10px 8px;
    border:none;background:url(http://img.d.cn/android2012/androidres/images/androidtxtbg.png) no-repeat 0 0;
    _background:url(http://img.d.cn/android2012/androidres/images/androidtxtbg6.png) no-repeat 0 0;
}
#logo_search dd.search input.searchTextHover{
    background:url(http://img.d.cn/android2012/androidres/images/androidtxthoverbg.png) no-repeat 0 0;
    _background:url(http://img.d.cn/android2012/androidres/images/androidtxthoverbg6.png) no-repeat 0 0;
}
#logo_search dd.search input.btn{margin-left:4px;}
</style>
<![endif]-->

<link type="text/css" rel="stylesheet" href="http://img.d.cn/android2012/androidres/css/public_mod.css" />
<link type="text/css" rel="stylesheet" href="http://img.d.cn/android2012/androidres/css/lightbox.css" />
<link type="text/css" rel="stylesheet" href="http://img.d.cn/android2012/androidres/css/content_130122.css" />
<link type="text/css" rel="stylesheet" href='http://resource.app.qq.com:8080/api/styles/sjqqapi.css' />

<!--添加CSS和JS结束-->
</HEAD>		 
<BODY>
 
<DIV id="totop"></DIV><!--顶部彩条-->     
<DIV class="topnav">
<DIV class="topnavcenter">
<DIV class="tbar"><!--消息-->    				    					 
<DIV class="welcome">欢迎进入无线城市，请 <A class="orangetxt" id="login_win_show" style="cursor: pointer;" 
onclick="toLogin()">登录</A> | <A style="cursor: pointer;" 
onclick="toRegister();">注册</A></DIV></DIV></DIV>
<DIV class="greenLine"></DIV></DIV><!--顶部彩条 结束-->     <!--头部-->     
<DIV class="header">
<DIV class="logo"><A href="http://zigong.wxcs.cn/index"></A></DIV>
<DIV class="logoline"></DIV>
<DIV class="city_on"><SPAN class="cityName">自贡</SPAN>[<A href="http://www.wxcs.cn/nav/navWeb.jsp?localAreaId=510300&amp;areaName=zigong&amp;jumpType=1">切换城市</A>]</DIV>
<DIV class="weather">多云转中雨    		    		    			 <IMG src="page3_files/T02.png">    
			 <IMG src="page3_files/T02.png">    		    		 22℃~35℃    	 </DIV>
<DIV class="searchBox"><INPUT id="searchType" type="hidden" value="0">			        
                    				                                                         
                                           		 
<DIV class="s_item"><SPAN class="sel">全部</SPAN><INPUT class="sInput" id="keyWord" 
type="text" maxlength="100" value="电费"></DIV><INPUT class="sBtn" onclick="search();" type="button"> 
   		 
<DIV class="selBox" id="divSel"><A onclick="selType(0);" href="http://218.205.252.16/flyingcity/genaralBussiness_all/init.action?objType=20&amp;urlcategory=1&amp;appid=AP510000000000010108&amp;areacode=510300&amp;portaltype=0&amp;columnid=31831&amp;accesstype=1&amp;islogin=0&amp;version=0&amp;usessionid=&amp;resourceid=SV510000000141&amp;backurl=http://zigong.wxcs.cn/txy?navCode=txy#">全部</A><A 
onclick="selType(1);" href="http://218.205.252.16/flyingcity/genaralBussiness_all/init.action?objType=20&amp;urlcategory=1&amp;appid=AP510000000000010108&amp;areacode=510300&amp;portaltype=0&amp;columnid=31831&amp;accesstype=1&amp;islogin=0&amp;version=0&amp;usessionid=&amp;resourceid=SV510000000141&amp;backurl=http://zigong.wxcs.cn/txy?navCode=txy#">应用</A><A 
onclick="selType(2);" href="http://218.205.252.16/flyingcity/genaralBussiness_all/init.action?objType=20&amp;urlcategory=1&amp;appid=AP510000000000010108&amp;areacode=510300&amp;portaltype=0&amp;columnid=31831&amp;accesstype=1&amp;islogin=0&amp;version=0&amp;usessionid=&amp;resourceid=SV510000000141&amp;backurl=http://zigong.wxcs.cn/txy?navCode=txy#">资讯</A></DIV>
<DIV class="hotWordSearch"><SPAN class="orangetxt">热搜词：</SPAN>				    								   
 														 <A 
href="http://zigong.wxcs.cn/pub/websearchhaskey?searchKey=保险">保险</A>					    
														 <A 
href="http://zigong.wxcs.cn/pub/websearchhaskey?searchKey=水费">水费</A>					    
														 <A 
href="http://zigong.wxcs.cn/pub/websearchhaskey?searchKey=交通">交通</A>					    			 
   		 </DIV>
<DIV class="search_tip" style="display: none;">    
			根据相关法律法规和政策，搜索结果未予显示，请更换关键词后重新查询.    		 </DIV></DIV></DIV><!--头部 结束-->     <!--导航--> 
    
<DIV class="navBar">
<UL>
  <LI><A href="http://zigong.wxcs.cn/index?navCode=index">首页</A></LI>
  <LI><A href="http://zigong.wxcs.cn/bsy?navCode=bsy">办事易</A></LI>
  <LI><A href="http://zigong.wxcs.cn/sht?navCode=sht">生活通</A></LI>
  <LI><A href="http://zigong.wxcs.cn/txy?navCode=txy">天下游</A></LI>
  <LI class="nobd"><A href="http://zigong.wxcs.cn/lgh?navCode=lgh">乐购惠</A></LI>
  <LI class="navAt"><A href="http://shuobang1234.gicp.net:8088/wxcs/forum_listHot">生活娱乐</A></LI>
  <LI ><A href="http://zigong.wxcs.cn/pub/appcenter?navCode=appcenter">应用中心</A></LI></UL></DIV><!--导航 结束--> 

  <!--
	添加BODY内容,在导航HEADER下面.
  -->

<div id="container">
            <div id="list_links">您现在的位置：<a title="无线城市首页" href="/">首页</a><span>&gt;&gt;</span>
            		<a title="生活娱乐" href="forum_listHot">生活娱乐</a><span>&gt;&gt;</span>
            		<a title="<s:property value="forum.name"/>" href="forum_childlist?forum.id=<s:property value="forum.id"/>"><s:property value="forum.name"/></a><span>&gt;&gt;</span>
            		<s:property value="gameInfo.name"/> v<s:property value="gameInfo.version"/>
            </div>
            <!--应用 begin-->
            <div id="main">
                <!--应用详细信息 begin -->
                <div class="rom_phonecontent">
                    <!--详细介绍 begin -->
                    <div class="yingyong_info">
                        <div class="applyInfosub">
                            <div class="yingyong_img">
                                <span class='Language yingyong_Language'></span>
                                <span class="shadow yingyong_shadow" style="cursor:default"></span>
                                <img src="logo/<s:property value="gameInfo.logo.name"/>" 
                                	alt="<s:property value="gameInfo.name"/> v<s:property value="gameInfo.version"/>" />
                            </div>
                            <div class="info_text">
                                <div class="info_title">
                                    
                                    <h1 class="info_title" style="display:inline;"><s:property value="gameInfo.name"/></h1>
                                    <span> v<s:property value="gameInfo.version"/></span>
                                </div>
                                <div class="info_eng"></div>
                                <div class="info_starhot">
                                    <div class="star star5"></div>
                                    <div class="hot">86℃</div>
                                </div>
                                
                                    <p>
                                        <span>标签</span>
                                        	&nbsp;
                                        	老少皆宜&nbsp;
                                     	   坐车&nbsp;
                                       	 上厕所&nbsp;
                                      	 消磨时间&nbsp;
                                    </p>
                                
                            </div>
                            <ul>
                                <li class="img img1"><a href="javascript:void(0);" onclick="add_top(this)" title="顶一下">顶一下</a></li>
                                <li id="good_rating" class="num"><s:property value="gameInfo.top"/></li>
                            </ul>
                            <ul>
                                <li class="img img2"><a href="javascript:void(0);" onclick="add_foot(this)" title="踩一脚">踩一脚</a></li>
                                <li id="bad_rating" class="num"><s:property value="gameInfo.foot"/></li>
                            </ul>
                        </div>
                        
                        <dl>
                            <dd class="one"><span>语言：</span><span class="text">中文</span></dd>
                            <dd class="two"><span>更新时间：</span><span class="text">2013-05-24</span></dd>
                            <dd><span></span><span class="text"></span></dd>
                            <dd class="one"><span>资费：</span><span class="text">完全免费</span></dd>
                            <dd class="two">类　　型：益智休闲</dd>
                            <dd>
                                <span>开发商：</span>
                                <span class="text">
                                    
                                        <a target="_blank" href="http://www.shuobang.net">
                                        	<s:property value="gameInfo.dev.name"/>
                                         </a>
                                    
                                </span>
                            </dd>
                        </dl>
                        <div class="clear"></div>
                    </div>
                    <!--详细介绍 end-->

                    <!--title begin -->
                    <div class="title romTitle romTitleSub">
                        <div class="romTitleL"><h2>应用下载</h2><span></span></div>
                            <ul class="romTitleDown">
                                
                            </ul>
                        <div class="romTitleR"></div>
                    </div>
                    <!--title end -->

                    <!--应用下载 begin -->
                    <div class="applyDownload">
                        
                            <div id="con_down_1" class="down_con" >
                                <dl>
                                    <dd>大小：10.08MB</dd>
                                    <dd></dd>
                                    <dd>最低支持系统：Android <s:property value="gameInfo.minSDK.version"/></dd>
                                </dl>
                            </div>
                            <ul>
                                <li class="first">
                                        <a  href=" http://www.mimigame.net/jad/mjc_gy_cs.apk" 
                                        	class="localDownload" onclick="sendData('download'),16509,8,1,''"></a>
                                </li>
                                <li class="second">                                    
                                </li>
                                <li class="third">
                                    <div class="code">
                                        <img  width="117" src="game_res/xbqp.png" 
                                        		alt="<s:property value="gameInfo.name"/> v<s:property value="gameInfo.version"/>-二维码" />
                                    </div>
                                    <p class="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    	使用<a href="http://android.d.cn/software/1242.html">二维码</a>下载到手机</p>
                                </li>
                            </ul>
                        
                    </div>
                    <!--应用下载 end -->

                    <!--简介 begin -->
                    <div class="rom_introduction">
                        <div class="titleTab">
                            <div class="gameTitleTab">
                                <h2 id="one1" onclick="setTab('one',1,5)" class="hover">游戏简介</h2>
                            </div>
                        </div>
                        <div class="rom_introductioncon applyTab">
                            <div class="applyIntro" id="con_one_1">
                                <p><s:property value="gameInfo.discription"/></p>
                            </div>
                       
                        </div>
                    </div>
                    <!--简介 end -->

                    <!--视频图片 begin -->
                    <div class="rom_introduction">
                        <div class="titleTab">
                            <div class="gameTitleTab">
                                <h2 id="two1" onclick="setTab('two',1,2)" class="video" style="display:none">视频欣赏</h2>
                                <h2 id="two2" onclick="setTab('two',2,2)" class="hover">游戏截图</h2>
                            </div>
                        </div>
                        <div class="rom_introductioncon applyTab">
                            <div class="yingyong_shipin hideTab" id="con_two_1"></div>
                            <!--滚动图片 begin -->
                            <div class="yingyong_rollimg" id="con_two_2">
                                <div id="snapshot" class="snapshot">
                                    <div class="arrow back" id="LeftArr"></div>
                                    <div id="snapshot_contenter">
                                        <div id="snapshot_list" class="snapshot_list">
                                            
                                            <!-- 循环图片开始 -->
                                            <s:iterator value="#gameInfo.images">
                                                <ul>
                                                    <li>
                                                    	<div>
                                                    		<a title="捕鱼达人2 v1.1.2_截图" href="game_get?gameInfo.id=<s:property value="gameInfo.id"/>&forum.id=<s:property value="forum.id"/>">
                                                    			<img border="0" alt="<s:property value="gameInfo.name"/> v<s:property value="gameInfo.version"/>_截图"  src="upload/<s:property value="imageName"/>">
                                                    		</a>
                                                    	</div>
                                                    </li>
                                                </ul>
                                            </s:iterator>
                                            <!-- 循环图片结束 -->
                                        </div>
                                    </div>
                                    <div class="arrow forward" id="RightArr"></div>
                                </div>
                            </div>
                            <!--滚动图片 end -->
                            <div class="clear"></div>
                        </div>
                    </div>
                    <!--视频图片 end -->

                    <!--数据包 begin-->
                    
                    <!--数据包 end-->

                    <!--评论TAB begin-->
                    <!--评论列表 end -->
                </div>
                <!--应用详细信息 begin -->

                <!--列表右侧内容 begin -->
                <div id="list_infoimg">
                    <!--广告位1 begin-->
                    <div class="dDownload">
                        <a href="#" target="_blank" title="当乐游戏中心客户端" class="dDownCenter"></a>
                        <a href="#" target="_blank" title="当乐游戏中心客户端" class="dDownCenterT"></a>
                        <a href="#" target="_blank" title="立即下载" class="atonceDownload"></a>
                    </div>
                    <!--广告位1 end-->
                    <!--IOS关联应用 begin-->
                    
                        <div class="iphoneDownload"><a href="http://www.mimigame.net/jad/mjc_gy_cs.apk" 
                        	target="_blank" title="<s:property value="gameInfo.name"/> Android 版下载">
                        	<s:property value="gameInfo.name"/><br/>Android 版下载</a></div>
                    
                    <!--IOS关联应用 end-->

                    <!-- 开发商相关应用 begin-->
                    
                            <div id="vendorApps" class="rank romRank">
                                <h3 class="rank_top romRank_top">
                                    <span>该开发商相关应用</span>
                                    
                                        <input id="openMoreVendorBtn" type="button" value="更多&gt;&gt;" class="changeNext" data-url="http://www.mimigame.net/" />
                                    
                                </h3>

                                <div class="romRankCon">
                                    <dl id="vendorAppsDetail">
                                        
                                        	<!-- 开始循环游戏 -->
                                        <s:iterator value="#list">
                                            <dd>
                                                <span class="romTxtAll">
                                                    
                                                        <a href="game_get?gameInfo.id=<s:property value="id"/>&forum.id=<s:property value="forum.id"/>" 
                                                        	title="<s:property value="name"/> v<s:property value="version"/>" class="imgText" target="_blank">
                                                            <span class="img">
                                                                <img src="logo/<s:property value="logo.name"/>" alt="<s:property value="name"/> v<s:property value="version"/>"/>
                                                            </span>
                                                            <span class="text"><s:property value="name"/> v<s:property value="version"/></span>
                                                            <span class="star_num">
                                                                <span class="star star4"></span>
                                                            </span>
                                                        </a>
                                                    
                                                </span>
                                            </dd>
                                            
                                            </s:iterator>
                                            <!-- 循环游戏结束 -->
                                    </dl>
                                </div>
                            </div>
                        
                    <!-- 开发商相关应用 end-->

					<!-- 右侧图片列表 -->
                    <div class="list_images  list_images1">
                    </div>
                   
                </div>
                <!--列表右侧内容 end -->
                <div class="clear"></div>
            </div>
            <!--应用 end-->
        </div>
        
<!--[if IE]>
<style>
body{font-family:"Microsoft YaHei", sans-serif;}
</style>
<![endif]-->


<!--footer begin -->
<div id="footer-nav">
  <P>
	<A href="http://zigong.wxcs.cn/pub/sitemap?tab=1&areaName=zigong&jumpType=1" target=_blank>网站地图</A> | 
	<A href="http://zigong.wxcs.cn/pub/friendlink?tab=2&areaName=zigong&jumpType=1" target=_blank>友情链接</A> | 
	<A href="http://zigong.wxcs.cn/pub/aboutus?tab=3&areaName=zigong&jumpType=1" target=_blank>关于无线城市</A> | 
	<A href="http://zigong.wxcs.cn/pub/feedback?tab=4&areaName=zigong&jumpType=1" target=_blank>意见反馈</A> | 
	<A href="http://zigong.wxcs.cn/pub/servicesm?tab=5&areaName=zigong&jumpType=1" target=_blank>服务声明</A> | 
	<A href="http://zigong.wxcs.cn/pub/sitehelp?tab=6&areaName=zigong&jumpType=1"  target=_blank>常见问题</A></P>
  <P>
 中国移动通信版权所有 粤08034647-12号</P>
</div>
<!--footer end -->

<!--腾讯联合登录-->
<div id="msg"></div>
<span id="qqLoginBtn" style="display:none;"></span>


    </body>
    <!--Script begin-->
    

<%-- 
	解决搜索框无法下拉问题,因为上面已经有了一个jquery.js文件了.
	<script type="text/javascript" src="http://img.d.cn/android2012/androidres/js/jquery.js"></script> 
<script type="text/javascript" src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=1936015137"></script>
--%>
<script type="text/javascript" src="http://img.d.cn/android2012/androidres/js/jquery.lazyload.min.js"></script>
<script type="text/javascript" src="http://img.d.cn/android2012/androidres/js/jquery.jmodal.js"></script>
<script type="text/javascript" src="http://img.d.cn/android2012/androidres/js/x4pass.js"></script>
<script type="text/javascript" src="http://img.d.cn/android2012/androidres/js/common.js"></script>
<script type="text/javascript">
//顶和踩-------------------
var init_top_num = parseInt($("#good_rating").text());//这个是初始化的顶数.
var init_foot_num = parseInt($("#bad_rating").text());
function add_top(obj){
	var top_num = parseInt($("#good_rating").text());
	if(top_num == init_top_num){
		$("#good_rating").text(top_num+1);//在页面上显示增加一个
		
		var id = $("#gameId").text();
		
		$.post("game_assessTop",{"gameInfo.id":id},function(){
		},"text");
	}
}

function add_foot(obj){
	var foot_num = parseInt($("#bad_rating").text());
	if(foot_num == init_foot_num){
		$("#bad_rating").text(foot_num+1);//在页面上显示减少一个.
		
		var id = $("#gameId").text();
		
		$.post("game_assessFoot",{"gameInfo.id":id},function(){
		},"text");
		
	}
}
//------------------------------


</script>

<!--[if lte IE 6]>
<script type="text/javascript" src="http://letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<script type="text/javascript" src="http://img.d.cn/android2012/androidres/js/pngfix.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo_search h1 a,.zixun_infoimg .zixun_img,.shadow,.Language,.shadowgray,.gamesoft_info dd.hot,.gamesoft_info .star_num span,.star,#ifocus_btn li,#ifocus_btn li.current,.rom_star,.Language,.hot,.nodata,.data,.searchResultBg,.searchResultBottom,.andriodheaderLogo a');
</script>
<![endif]-->

<div style="display:none;">
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F8d7126fe10cdfe44d42b07bc922bbc9f' type='text/javascript'%3E%3C/script%3E"));
    </script>

    <!-- Baidu OLD SCRIPT BEGIN -->
    <script type="text/javascript">
        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F3378dcbd2a24bc6b3d8527914dd87697' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <!-- Baidu OLD SCRIPT END -->
</div>

<!-- Baidu Button BEGIN -->
<script type="text/javascript" id="bdshare_js" data="type=slide&amp;img=1&amp;pos=right&amp;uid=0"></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
    document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000);
</script>
<!-- Baidu Button END -->

<!--腾讯联合登录开始-->
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js?v=1" data-appid="100248959" charset="utf-8"></script>
<script type="text/javascript">
    if (!QC.Login.check()) {
        QC.Login({
                    btnId: "qqLoginBtn",
                    scope: "all",
                    size: "A_M"
                }, function (dt, opts) {
                    if (QC.Login.check()) {
                        QC.Login.getMe(function (openId, accesToken, backData) {
                            $.ajax({
                                async: true,
                                url: "http://d.cn/connect/tencent/trylogin",
                                type: "GET",
                                dataType: 'jsonp',
                                jsonp: 'jsoncallback',
                                data: {uid: openId, token: accesToken},
                                timeout: 5000,
                                success: function (json) {
                                    var msg = json[0].msg;
                                    if (msg.length != 0) {
                                        alert(msg);
                                        return;
                                    }
                                    var dmbi = json[0].dmbi;
                                    var to = json[0].url;
                                    if (dmbi) {
                                        var info = json[0].info;
                                        var age = json[0].age;
                                        var _frm = document.createElement("iframe");
                                        _frm.style.display = "none";
                                        _frm.src = "http://my.d.cn/setcookie.html?type=add&dmbi=" + dmbi + "&info=" + info + "&age=" + age;
                                        document.body.appendChild(_frm);
                                        if (_frm.attachEvent) {
                                            _frm.attachEvent("onload", redirectURL(to));
                                        } else {
                                            _frm.addEventListener("load", redirectURL(to), false);
                                        }
                                    } else {
                                        redirectURL(to);
                                    }
                                },
                                error: function (xhr) {
                                    alert("\u8bf7\u6c42\u51fa\u9519(\u8bf7\u68c0\u67e5\u76f8\u5173\u5ea6\u7f51\u7edc\u72b6\u51b5.)");
                                }
                            });
                        });
                    }
                }
        );
    }
</script>
<!--腾讯联合登录结束-->
    <script type="text/javascript" src="http://pstatic.xunlei.com/js/webThunderDetect.js"></script>
    <script type="text/javascript" src="http://pstatic.xunlei.com/js/base64.js"></script>
    <script type="text/javascript" src="http://img.d.cn/android2012/androidres/js/comment.js"></script>
    <script type="text/javascript" src="http://dut.d.cn/djqi_debug.js"></script>
    <script type="text/javascript" src="http://img.d.cn/android2012/androidres/js/picslider.js"></script>
    <script type="text/javascript" src="http://img.d.cn/android2012/androidres/js/detail.js"></script>
    <script type="text/javascript" src="http://img.d.cn/android2012/androidres/js/lightbox.js"></script>
    <script type="text/javascript" src="http://wandoujia.com/api/wdapi.js"></script>
    <script type="text/javascript" src="http://zhushou.360.cn/script/360mobilemgrdownload.js"></script>
    <script type="text/javascript" src="http://resource.app.qq.com:8080/api/scripts/sjqqapi.js"></script>
    <script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery("#snapshot_list li a").lightBox();
        jQuery().prepare_slider("snapshot_contenter", "snapshot_list", "ul");
        guessGame(16509, 1, 8);
        var rdmark='';
        sendData("detailView",16509,8,1,rdmark);

        $("#openMoreVendorBtn").bind('click',function(){
            window.open($(this).attr('data-url'));
        });

        $(".save-list li:last-child").addClass("last");
        /* 迅雷下载链接 */
        var param =  $("#thunderDownloadLink input").val().split(',');
        var thunderHref = ThunderEncode(param[0]+'?f=thunder_1');
        var thunderPid="130304";
        var thunderResTitle=param[1];
        var clickStr="sendData('download','"+param[2]+"','"+param[3]+"','"+param[4]+"','"+param[5]+"');"+" "+"logPV('"+param[4]+"','"+param[2]+"','"+param[6]+"','thunder');return OnDownloadClick_Simple(this,2,4);";
        $("#thunderDownloadLink").html('<a href="#" thunderHref="'+thunderHref+'" thunderPid="130304" thunderResTitle="'+thunderResTitle+'" onclick="'+clickStr+'" oncontextmenu="ThunderNetwork_SetHref(this)" class="xunleiDownload"></a>');

        /* 视频 */
        var otherInfos = "";
        if(otherInfos){
            for(var i in otherInfos){
                var value=otherInfos[i];
                value = value === undefined ? "":value;
                if(i=='video'){
                    jQuery("#con_two_1").html(value).removeClass("hideTab");
                    jQuery("#two1").addClass("hover");
                    jQuery("#two2").removeClass("hover");
                    jQuery("#con_two_2").addClass("hideTab");
                }
                jQuery("#"+i).html(value)
                jQuery("."+i).show();
            }
        }

        /* 评论*/
        var commenParam = $("#commentHiddenValue").val().split(',');
        //console.log(commenParam[0]+'-'+commenParam[1]+'-'+commenParam[2]+'-'+commenParam[3]+'-'+commenParam[4]+'-'+commenParam[5]+'-'+commenParam[6]);
        $("#pagerScript").append('\<script type="text/javascript"\>'+
                '    COMMENT.init({'+
                '        resourceId:'+commenParam[0]+','+
                '        resourceTypeId:'+commenParam[1]+','+
                '        forumId:'+commenParam[2]+','+
                '        topicId:'+commenParam[3]+','+
                '        pageCount:'+commenParam[4]+','+
                '        pageNo:'+commenParam[5]+','+
                '        pageSize:'+commenParam[6]+','+
                '        commentFormDivId:"addComment",'+
                '        commentListDivId:"leave_message",'+
                '        commentPagerDivId:"commentPager"});'+
                '\<\/script\>');

        /*viewmore*/
        (function(){
            var $conOne=$("#con_one_1 p"),
                    $moreIntro=$("#moreIntro"),
                    conOneH=$conOne.height();
            if(conOneH>150){
                $moreIntro.show();
                $conOne.addClass("hideIntro");
                $("#con_one_1").removeClass("con_one_hide");
            }
            $moreIntro.click(function(){
                var This=$(this),
                        text=This.text();
                if(text=="查看更多"){
                    $conOne.removeClass("hideIntro");
                    This.text("收起全部");
                } else{
                    $conOne.addClass("hideIntro");
                    This.text("查看更多");
                }
            }) ;
        })();
    });
    </script>
    <!--Script end-->
</html>