String.prototype.trim = function () {
	return this .replace(/^\s\s*/, '' ).replace(/\s\s*$/, '' );
};
$(document).ready(function(){
	$("input[type='password']").live("keydown",function(e){
	    if(e.keyCode==32){
	           return false;
	    }
	});
});