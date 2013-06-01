/* JavaScript Document hxl 2012.10.10*/

$(function(){


/*我的收藏*/
/*$(document).ready(function(){
$(".my_collect_menu a").click(function(){
	$(".my_collect_content").toggle();
$(this).addClass("current").siblings().removeClass("current");
})
});*/
/*搜索*/
$(document).ready(function(){
$(".s_arrow,.sel").click(function(){
	$(".sel_list").toggle();
});
$(".sel_list li").click(function(){
	$(".sel_list").toggle();
	$(".sel").html($(this).html());
});});
/*lefttab*/
  $('.data_content li').each(function(i){
		  $(this).click(function(){
				   $('.data_content li').removeClass('now').eq(i).addClass('now');
				   $('.personal_center_body_right').hide().eq(i).show();
				   $(".personal_center_body_content").removeClass("height");
		  	});
	 });

/*注销账户*/
$(".agree_a").click(function(){
$(".login_warn").show()	;
$(".logout").hide();				
});
$(".agree_know").click(function(){
$(".login_warn_reason").show();	
$(".login_warn").hide();
});
/*注销账户注销原因切换*/	 
$(".infor_save").click(function(){	
$("#save_id").fadeIn("slow");
$("#save_id").fadeOut("slow");		
});
$("#save_id").hide();
$(".skin_pic").click(function(){
$(".theme_pop_win").show();	
});
$(".theme_pop_win").hide();
/* page life*/
/*$('.appBox_theme').width($(".appBox_theme li").length*98);

var appListPageAt=0;
$(".theme_page_pre").click(function(){
	appListPageAt=appListPageAt-1;
	if(appListPageAt>=0){
	$(".appBox_theme").animate({marginLeft:-616*appListPageAt+"px"},500);
	$(".theme_page").html(appListPageAt+1);
	}
	else{
	appListPageAt=2;
	$(".appBox_theme").animate({marginLeft:-616*appListPageAt+"px"},500);
	$(".theme_page").html(appListPageAt+1);
	}
});
$(".theme_page_next").click(function(){
	appListPageAt=appListPageAt+1;
	if(appListPageAt<3){
	$(".appBox_theme").animate({marginLeft:-616*appListPageAt+"px"},500);
	$(".theme_page").html(appListPageAt+1);
	}
	else{
	appListPageAt=0
	$(".appBox_theme").animate({marginLeft:-616*appListPageAt+"px"},500);
	$(".theme_page").html(1);
	}
});
*/
$(".pop_close_btn").click(function(){
$(".theme_pop_win").hide();
});
/*个人中心消息中心*/
/*
$(document).ready(function(){
	$(".personal_news_menu a").click(function(){
		var index = $(this).index();
		$(this).addClass("current").siblings().removeClass("current");
		$(".my_collect_content").eq(index).show().siblings().hide();  
    });
});
$(".de_all").click(function(){
$(".de_all").hide();
$(".news_de_all").show();
});
$(".sys_news_li,a").click(function(){
$(".sye_news_li_con").hide();
$(".sys_news_content").hide();
$(".sys_news_content").show();
});
$(".personal_news_menu,a").click(function(){
$(".sys_news_content").hide();
$(".sye_news_li_con").show();
});
*/
/*登录*/
$(".jing").click(function(){
$(this).removeClass("login_move1");
$(this).addClass("login_move2");
$(".dong").removeClass("login_phone2");
$(".dong").addClass("login_phone1");
$(".login_content_tab_content2").hide();
$(".login_content_tab_content1").show();
});
$(".dong").click(function(){
$(this).removeClass("login_phone1");
$(this).addClass("login_phone2");
$(".jing").removeClass("login_move2");
$(".jing").addClass("login_move1");
$(".login_content_tab_content1").hide();
$(".login_content_tab_content2").show();
});
/*注册*/
$(".phone_r").click(function(){
$(this).removeClass("login_phone1");
$(this).addClass("login_phone2");
$(".email_r").removeClass("login_email2");
$(".email_r").addClass("login_email1");
$(".login_content_tab_content2").hide();
$(".login_content_tab_content1").show();
});
$(".email_r").click(function(){
$(this).removeClass("login_email1");
$(this).addClass("login_email2");
$(".phone_r").removeClass("login_phone2");
$(".phone_r").addClass("login_phone1");
$(".login_content_tab_content1").hide();
$(".login_content_tab_content2").show();
});

});
$(document).ready(function(){
  $(".change_head_pic").mouseover(function(){
    $(".geng_a").show();
  });
  $(".change_head_pic").mouseout(function(){
    $(".geng_a").hide();
  });
});
/*基本信息*/
$(document).ready(function(){
	$(".personal_dd  a").click(function(){
	$(".personal_a").toggleClass("personal_b");
	$(".personal_details").toggle();
	$(".personal_center_body_content").addClass("height");
});
});
$(document).ready(function(){
$(".bang_email").click(function(){
	 $(".emile_pop_win").show();
	 $(".pop_close_btn").click(function(){
$(".emile_pop_win").hide();
});
});
$(".bang_name").click(function(){
	 $(".save_success_bang").show();
});
});
$(document).ready(function(){
$(".change_phone").click(function(){
	 $(".change_pop_win").show();
	 $(".pop_close_btn").click(function(){
$(".change_pop_win").hide();
});
});
});
/*$(document).ready(function(){
$(".personal_my_collect_a").click(function(){
	 $(".change_app").show();
	  $(".app_news_two").show();
	  $(".personal_my_collect_a").hide();
	  $(".app_news").hide();
	 
});
$(".change_app").click(function(){
	 $(".personal_my_collect_a").show();
	  $(".app_news").show();
	  $(".change_app").hide();
	  $(".app_news_two").hide();
	  $(".app_news_three").hide();
	 
});

});*/
/*$(document).ready(function(){
	$(".de_kind").click(function(){
	$(".right_wrong").show();
	$(".app_news_two li").addClass("bold_border");
	 });
	$(".app_news_two,li").click(function(){
  $(this).removeClass("bold_border").addClass("bold_red");
});
});
$(document).ready(function(){
$(".in_kind").click(function(){
	$(".app_news_three").show();
	$(".app_news_two").hide();
	$(".right_wrong").hide();
	
	});
	});
$(document).ready(function(){
	$(".de_move").click(function(){
	$(".right_wrong").show();
	$(".app_news_three li").addClass("mover_border");
	 });
	$(".app_news_three,li").click(function(){
  $(this).removeClass("mover_border").addClass("mover_red");
});
});
$(document).ready(function(){
	$(".new_kind").click(function(){
	$(".new_kind_pop_win").show();
	$(this).addClass("mover_border");
	 });
});
$(document).ready(function(){
	$(".p_span,a").click(function(){
	$(this).addClass("color_red");
	 });
});
$(document).ready(function(){
$(".pop_close_btn").click(function(){
$(".new_kind_pop_win").hide();
});
});*/

/*我的足迹
$(document).ready(function(){
$(".arrow_fo").click(function(){
$(this).removeClass("arrow_fo");
$(this).addClass("arrow_si");
$(".pug_down").addClass("arrow_fi");
$(".pug_down").removeClass("arrow_se");
});
});
$(document).ready(function(){
$(".arrow_fi").click(function(){
$(this).removeClass("arrow_fi");
$(this).addClass("arrow_se");
$(".pug_up").addClass("arrow_fo");
$(".pug_up").removeClass("arrow_si");
});
});
$(document).ready(function(){
$(".pug_li_a .data").click(function(){
$(".pc_data_open").toggle();
$(".pc_data_close").toggle();
$(".data_content").toggle();
});
});
});*/


