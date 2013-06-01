﻿/* JavaScript Document by zedd*/
$(document).ready(function(){
	jQuery("input[type='text'],input[type='password'],textarea").focus(
			function(){
				jQuery(this).css("color","#222222")
			}).blur(
			function(){
			    jQuery(this).css("color","#888888")}
	 );
$("a").focus(function(){this.blur()});	
/*首页 消息*/
$(".message,.mesBox").hover(
  function(){
    $(".message").addClass("mes_more");
	$(".mesBox").show();	
  },
  function(){
    $(".message").removeClass("mes_more");
	$(".mesBox").hide();	
  }
); 
/*首页 搜索下拉*/
$(".sel").click(function(){
	$(".selBox").slideToggle();				
});
$(".selBox a").click(function(){
	$(".sel").html($(this).html());
	$(".selBox").slideToggle();				
});
/*回顶部*/
$(window).scroll(function () {
		if ($(this).scrollTop() > 100) {
			$("#totop").show();
		} else {
			$("#totop").hide();
		}
	});

	$("#totop").click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 500);
		return false;
	$("#totop").css("bottom",20);

	});
/*首页 大家都在用*/
$(".hotusefrom").eq(0).show();
$(".hotUseList").click(function(){
	$(".hotUse .hotUseList").removeClass("at");						   
	$(this).addClass("at");
	$(".hotusefrom").hide().eq($(this).index()/2).show();				
});

/*首页 一周关注*/
$(".weekHot li .order").bind("mouseover",function(){
	$(this).addClass("orderAt");
});
$(".weekHot li .order").bind("mouseout",function(){
	$(this).removeClass("orderAt");
});
/*轮播图*/
var i=0;
var playAuto;
var liNum=$("#scroll ul li").length;
$(".scrollLeft").click(function(){
	window.clearInterval(playAuto);
	play();
	i=i-1;
	if(i>=0){
	$("#scroll ul").animate({marginLeft:-680*i+"px"},500);
	}
	else{
	i=liNum-1;
	$("#scroll ul").animate({marginLeft:-680*i+"px"},500);
	}
	dots(i);	
});
$(".scrollRight").click(function(){
    window.clearInterval(playAuto);		
	play();
	i=i+1;
	if(i<liNum){
	$("#scroll ul").animate({marginLeft:-680*i+"px"},500);
	}
	else{
	i=0;
	$("#scroll ul").animate({marginLeft:-680*i+"px"},500);
	}
	dots(i);
});

$(".scrollPage span").click(function(){
var now=$(".scrollPage span").index(this);
$("#scroll ul").animate({marginLeft:-680*now+"px"},500);
dots(now);
});
function dots(e){
$(".scrollPage span").removeClass("pageOn");
$(".scrollPage span").eq(e).addClass("pageOn"); 
}

function play(){
playAuto = setInterval(function(){
	i=i+1;
	if(i<liNum){
	$("#scroll ul").animate({marginLeft:-680*i+"px"},500);
	}
	else{
	i=0;
	$("#scroll ul").animate({marginLeft:-680*i+"px"},500);
	}
	dots(i);
	},15000);

}
play();
/*login password select*/
$(".u_sel").click(function(){
$(".uSelList").toggle();
});
$(".uSelList li").click(function(){
$(".uSelList").hide();
$(".u_sel .now").html($(this).html());
if($(".u_sel .now").html()=="静态密码登录"){
$(".dynamic_pwd").hide();
$(".static_pwd").show();
$(".ckbox").show();
}else{
$(".dynamic_pwd").show();
$(".static_pwd").hide();	
$(".ckbox").hide();
}
});
/*loginwin*/
var winWidth=$(document.body).width();
var winHeight=$(window).height();
$(".pop_win").css("left",winWidth/2-270);
$(".pop_win").css("top",winHeight-450);
/*$(".new_kind_pop_win").css("left",winWidth/2-255);
$(".new_kind_pop_win").css("top",winHeight-400);*/
var bHeight=$(document.body).height();
var hideHeiht=$(".appList_tabContent").eq(1).height();
$(".popCover").css("height",bHeight-hideHeiht);
$(".popCover").css("width",winWidth);

$("#login_win_show").click(function(){
	 $(".popCover").show();
	$(".pop_win").show();						   
});
$(".pop_close_btn").click(function(){
	$(".pop_win").hide();	
	$(".popCover").hide();
});
/*tab life*/
$('.appList_tabContent').hide().eq(0).show();
$('.appList_tabTitle a').each(function(i){
$(this).click(function(){
$('.appList_tabTitle a').removeClass('at').eq(i).addClass('at');
$('.appList_tabContent').hide().eq(i).show();
});
});
/* page life*/
$('.appBox21').width($(".appBox21 li").length*100+10);
var appListPageAt=0;
var appListpageNum=$('.appBox21 ul').length;
$(".appList_page_pre").click(function(){
appListPageAt=appListPageAt-1;
if(appListPageAt>0){
$(".appBox21").animate({marginLeft:-700*appListPageAt+"px"},500);
$(".appList_page").html(appListPageAt+1);
$(".appList_page_next").removeClass("appList_page_next_gray");

}
else{
appListPageAt=0;
$(".appBox21").animate({marginLeft:-700*appListPageAt+"px"},500);
$(".appList_page").html(appListPageAt+1);
$(".appList_page_pre").addClass("appList_page_pre_gray");
}
$("#pre_s").removeClass();
$("#next_s").removeClass(); 
if(appListPageAt == "1"){
	$("#pre_s").addClass("appList_page_pre appList_page_pre_gray");
	$("#next_s").addClass("appList_page_next appList_page_nexttx");
}
if(appListPageAt == appListpageNum){
	$("#pre_s").addClass("appList_page_pre");
	$("#next_s").addClass("appList_page_next appList_page_next_gray");
}

});
$(".appList_page_next").click(function(){
appListPageAt=appListPageAt+1;
if(appListPageAt<appListpageNum-1){
$(".appBox21").animate({marginLeft:-700*appListPageAt+"px"},500);
$(".appList_page").html(appListPageAt+1);
$(".appList_page_pre").removeClass("appList_page_pre_gray");
}
else{
appListPageAt=appListpageNum-1;
$(".appBox21").animate({marginLeft:-700*appListPageAt+"px"},500);
$(".appList_page").html(appListpageNum);
$(".appList_page_next").addClass("appList_page_next_gray");
}

$("#pre_s").removeClass();
$("#next_s").removeClass(); 
if(appListPageAt == "1"){
	$("#pre_s").addClass("appList_page_pre appList_page_pre_gray");
	$("#next_s").addClass("appList_page_next appList_page_nexttx");
}
if(appListPageAt == appListpageNum){
	$("#pre_s").addClass("appList_page_pre");
	$("#next_s").addClass("appList_page_next appList_page_next_gray");
}

});
/* page index*/
var weeklyPageAt=0;
var weeklypageNum=$('.weekHot ol').length;
$(".weekly_page_pre").click(function(){
weeklyPageAt=weeklyPageAt-1;
if(weeklyPageAt>0){
$(".weekHot").animate({marginLeft:-248*weeklyPageAt+"px"},500);
$(".weekly_page").html(weeklyPageAt+1);
$(".weekly_page_next").removeClass("weekly_page_next_gray");

}
else{
weeklyPageAt=0;
$(".weekHot").animate({marginLeft:-248*weeklyPageAt+"px"},500);
$(".weekly_page").html(weeklyPageAt+1);
$(".weekly_page_pre").addClass("weekly_page_pre_gray");
}
});
$(".weekly_page_next").click(function(){
weeklyPageAt=weeklyPageAt+1;
if(weeklyPageAt<weeklypageNum-1){
$(".weekHot").animate({marginLeft:-248*weeklyPageAt+"px"},500);
$(".weekly_page").html(weeklyPageAt+1);
$(".weekly_page_pre").removeClass("weekly_page_pre_gray");
}
else{
weeklyPageAt=weeklypageNum-1;
$(".weekHot").animate({marginLeft:-248*weeklyPageAt+"px"},500);
$(".weekly_page").html(weeklypageNum);
$(".weekly_page_next").addClass("weekly_page_next_gray");
} 
});



/*相关搜索下拉*/
$(".r_rel_sel").click(function(){
	$(".r_rel_selBox").slideToggle();				
});
$(".r_rel_selBox a").click(function(){
	$(".r_rel_sel").html($(this).html());
	$(".r_rel_selBox").slideToggle();				
});
/*搜索头部下拉*/
$(".s_header_sel").click(function(){
	$(".s_header_selBox").slideToggle();				
});
$(".s_header_selBox a").click(function(){
	$(".s_header_sel").html($(this).html());
	$(".s_header_selBox").slideToggle();				
});



/*404下拉*/
$(".error_sel").click(function(){
					
	$(".error_selBox").slideToggle();				
});
$(".error_selBox a").click(function(){
	$(".error_sel").html($(this).html());
	$(".error_selBox").slideToggle();				
});

/*客户端下载*/
/**var downloadPicAuto;
function downloadplay(){
downloadPicAuto = setInterval(function(){
	$(".download_android").fadeToggle(50);
	$(".download_ios").fadeToggle(50);
	$(".download_pic_switch").toggleClass("switch");
	},5000
)}
download(play);**/
$(".download_show_android").click(function(){
	$(".download_android").fadeIn(50);		
	$(".download_ios").fadeOut(10);
	$(".download_pic_switch").removeClass("switch");
	
});
$(".download_show_ios").click(function(){
	$(".download_ios").fadeIn(50);		
	$(".download_android").fadeOut(10);
	$(".download_pic_switch").addClass("switch");
});
/*帮助 tab*/
/**
$('.h_box_tabContent').hide().eq(0).show();
$('.h_box_tabTitle li').removeClass('at').eq(0).addClass('at');

$('.h_box_tabTitle li').each(function(i){
$(this).click(function(){
$('.h_box_tabTitle li').removeClass('at').eq(i).addClass('at');
$('.h_box_tabContent').hide().eq(i).show();
});
});
**/

/*详细应用 展开*/
$(".expan").click(function(){
	$(".app_about_content p").height("auto");		
	$(this).hide();
	$(".pack").show();
});
$(".pack").click(function(){
	$(".app_about_content p").height(20);		
	$(this).hide();
	$(".expan").show();
	
});
/*详细 分享
$(".shareMore").click(function(){
	$(".shareMoreBox").toggle();		
});*/
/*详细 打分*/
 	var $star = $(".comment_c0");
	var $li = $star.find("span");
	var $strong = $star.find("i");
	var i = iScore = iStar = 0;
	var gradeName = "请点击评分";
	
	$li.hover(function()
	{
		var index = $(this).index();
		curPoint(index);
	},
	function()
	{
		curPoint();
	});
	
	$li.click(function()
	{
		var index = $(this).index();
		var sText = $(this).attr("title");
		iStar = $(this).index();
		$strong.text(sText);
		gradeName = sText;
	});
	
	function curPoint(pNum)
	{
		if(pNum){
			iScore = pNum;
		}else{
			iScore = iStar;
		}
		for (i = 0; i < $li.length; i++) 
		{
			if(i < iScore){
				$li.eq(i).addClass("redStar");
			}else{
				$li.eq(i).removeClass("redStar");
			}
		}
		var sText2 = $li.eq(pNum-1).attr("title");
		if (/[0-9]/.test(pNum-1)) {
			$strong.text(sText2);
		} else {
			$strong.text(gradeName);
		}
	}
/*$(".comment_c0 span").hover(
  function(){
	   var thisat=$(this).index();
	   for(var m=0;m<thisat;m++){
		   $(".comment_c0 span").eq(m).attr("class","redStar");
		   $(this).parent().find("i").html($(this).attr("title"));
		 }
  },
  function(){
	 $(".comment_c0 span").attr("class","grayStar");
	 $(this).parent().find("i").html("");
	  
  }
); 

$(".comment_c0 span").click(function(){
	var thisat=$(this).index();
	$(this).parent().find("i").html($(this).attr("title"));
	
});*/



/*citychg*/

$(".cityChg_link a").click(function(){
	$(".cityChg_link a").removeClass("at");
	$(this).addClass("at");
	$(".cityChg_list dl").removeClass("at");
	$(".cityChg_list dl").find("dt").removeClass("at");
	$(".cityChg_list dl").eq($(this).index()).addClass("at");
	$(".cityChg_list dl").eq($(this).index()).find("dt").addClass("at");
});
/*搜索 个人中心头部*/
$(document).ready(function(){
$(".s_arrow,.sel").click(function(){
	$(".sel_list").toggle();
});
$(".sel_list li").click(function(){
	$(".sel_list").toggle();
	$(".sel").html($(this).html());
});
});

/*$(".btn_collect").click(function(){
	 $(".popCover").show();
$("#collect_pop_1").show();
});*/

$(".pop_close_btn").click(function(){
$("#collect_pop_1,#collect_pop_2").hide();
$(".popCover").hide();
});
$(".pop_c2_btn").click(function(){
$("#collect_pop_1").hide();
$("#collect_pop_2").show();
});
$(".collect_u_sel").click(function(){
$(".collect_uSelList").toggle();
});
$(".collect_uSelList li").click(function(){
$(".collect_uSelList").hide();
$(".collect_u_sel .now").html($(this).html());
});

});  



/*个人首页我的足迹tab*/
$(document).ready(function(){
$(".my_clllect_right").click(function(){
$(this).addClass("pug_colorred");
$(".pug_content_1").show();
$(".pug_content").hide();
$(".my_clllect_more").removeClass("pug_colorred");
});
});
$(".my_clllect_more").click(function(){
$(this).addClass("pug_colorred");
$(".pug_content").show();
$(".pug_content_1").hide();
$(".my_clllect_right").removeClass("pug_colorred");
});


$(".count_right").click(function(){
	$(".count_pop_win").show();
	$(".pop_close_btn").click(function(){
        $(".count_pop_win").hide();
		}); 	
}); 



