$(function(){
	$("#login_form").validate({
		rules: {
			"gameInfo.name": "required",
			"gameInfo.version": "required",
			"gameInfo.download_Times":{
				required:true,
				number:true	
			},
			"gameInfo.discription":{
				required:true,
				minlength:10
			}
		},
		messages:{
			"gameInfo.discription":{
				minlength:"描述不能少于10个字符"
			}
		}
	});
	
	$("#upload_logo").validate({
		rules: {
			logo: "required"
		},
		messages:{
			logo:{
				required:"必须选择一个图片"
			}
		}
	});
});