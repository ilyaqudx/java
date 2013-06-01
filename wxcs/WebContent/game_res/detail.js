function setTab(name,cursel,n){
    for(var i=1;i<=n;i++){
        var menu=document.getElementById(name+i);
        var con=$(document.getElementById("con_"+name+"_"+i));
        menu.className=i==cursel?"hover":"";
        if(i==cursel){
            con.removeClass("hideTab");
        } else{
            con.addClass("hideTab");
        }
    }
}
//安装包权限 
function quanxian(name, cursel, n) {
    for (var i = 1; i <= n; i++) {
        var con = document.getElementById("con_" + name + "_" + i);
        con.style.display = "block";
    }
}
function closebtn(name, n) {
    for (var j = 1; j <= n; j++) {
        var con = document.getElementById("con_quanxian" + "_" + j);
        con.style.display = "none";
    }
}
// 安装包权限
function addRating(targetId, isGood, resourceId, resourceTypeId) {
    var url = "/asych/addRating?isGoodRating=" + isGood + "&resourceId="
        + resourceId + "&resourceTypeId=" + resourceTypeId;
    $.getJSON(url, {}, function(data) {
        writeRatingHtml(data, targetId);
    });
}

function writeRatingHtml(data, targetId) {
    var isSucess = data.model.isSucess;
    if (isSucess == "true") {
        var totalCnt = document.getElementById(targetId).innerHTML;
        document.getElementById(targetId).innerHTML = parseInt(totalCnt) + 1;
    }
}

function wandoujiaPV(obj){
    var url='/asych/wandoujiaPV';
    $.getJSON(url,function(data){});
    return wdapi_apkdl_m(obj,'api_303');
}

function logPV(resourceTypeId, resourceId, packageId, downloadChannal){
    var url='/asych/logPV';
    $.getJSON(url,{resourceTypeId:resourceTypeId,resourceId:resourceId,packageId:packageId,downloadChannal:downloadChannal},function(data){});
}

function setCookie(name,value){
    var Days = 1; //此 cookie 将被保存 1 天
    var exp  = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape(value) +";expires="+ exp.toGMTString();
}

function getCookie(name){
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
    if(arr != null) return unescape(arr[2]); return null;
}


var __djqi = __djqi || [];
__djqi.push([ "setDomain", {
    "domain" : "android.d.cn"
} ]);
__djqi.push([ "getTracker" ]);
if (!__djqi.djpq) {
    __djqi = new DJQI(__djqi);
}
function sendData(event, id, categoryId, resourceTypeId, rdmark) {
    var arr = new Array();
    if (event == 'addComment') {
        var content = $("#comment").val();
        var params = {
            'gameId' : id,
            'gameCategory' : categoryId,
            'gameFlag' : resourceTypeId,
            'content' : content
        };
        arr[2] = params;
    } else {
        var params = {
            'gameId' : id,
            'gameCategory' : categoryId,
            'gameFlag' : resourceTypeId,
            'rdmark':rdmark
        };
        arr[2] = params;
    }
    arr[0] = 'clickEvent';
    arr[1] = event;
    __djqi.push(arr);
}

function guessGame(id, resourceType, categoryId){
    var url="http://recommend.d.cn:7031/recommend/android/item_item.html?jsonCallback=?";
    jQuery.ajax({
        url: url,
        data: {
            'id':id,
            'num':5
        },
        dataType: "jsonp",
        success: function(data) {
            if(data.code==0){
                var html='';
                jQuery.each(
                    data.itemList,
                    function(index, obj) {
                        html+='<dd><span class="romTxtAll"><a href="'+obj.webDetailUrl+'"class="imgText" target="_blank">'
                            +'<span class="img"><img src="'+obj.icon+'"alt="'+obj.name+'"/></span><span class="text">'
                            +obj.name+'</span><span class="star_num"><span class="star star'+obj.stars+'"></span></span>'
                            +'</a></span></dd>';
                    }
                );
                if (html.length > 0) {
                    $("#guessGame").html(html);
                    $(".romRankCon dd").hover(function(){
                            $(this).addClass("romRankConHover");},
                        function(){
                            $(this).removeClass("romRankConHover");});
                    $("#guess").show();

                }
                else {
                    html = hotGame(resourceType, categoryId, id);
                }
            } else {
                html = hotGame(resourceType, categoryId, id);
            }
        }
    });
}

function hotGame(resourceType, categoryId, id) {
    var url = "/djwebandroid/asych/lsresource";
    var html = '';
    $.getJSON(url, {
        sort : 'hot',
        threshold : 20,
        resourceTypeId : resourceType,
        categoryId : categoryId
    }, function(data, textStatus) {
        if (textStatus == "success") {
            html = genGuessResourceHtml(data, resourceType, id);
            $("#guessGame").html(html);
            $(".romRankCon dd").hover(function(){
                    $(this).addClass("romRankConHover");},
                function(){
                    $(this).removeClass("romRankConHover");});
            $("#guess").show();
        }
    });
}

function genGuessResourceHtml(data, resourceTypeId, id) {
    var list = data.model.resources;
    var str = '';
    var urlType = "game";
    if (resourceTypeId == "1") {
        urlType = "game";
    } else if (resourceTypeId == "2") {
        urlType = "software";
    }

    var arr = new Array();
    while(arr.length < 5){
        var num = Math.floor(Math.random() * 20);
        if(!has(arr, num) && (list[num].id != id))
        {
            arr.push(num);
        }
    }

    for (var i = 0; i < arr.length; i++) {
        var resource = list[arr[i]];

        str += '<dd><span class="romTxtAll"><a href="/' + urlType + '/' + resource.id + '.html" class="imgText" target="_blank">'
            +'<span class="img"><img src="' + resource.icon + '"alt="' + resource.name + '"/></span><span class="text">'
            +resource.name+'</span><span class="star_num"><span class="star star'+resource.stars+'"></span></span>'
            +'</a></span></dd>';
    }

    return str;
}

function has(arr, n){
    for(var i =0;i<arr.length;i++){
        if(n== arr[i]){
            return true;
        }
    }
    return false;
}