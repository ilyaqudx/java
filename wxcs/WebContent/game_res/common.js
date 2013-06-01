$(document).ready(function() {
    var userInfo = USER.getCookie("DJ_MEMBER_INFO");
    var dmbi = USER.getCookie("dmbi");
    if (userInfo && dmbi) {
        $("#login_span").hide();
        $("#username").text(userInfo);
        $("#logined_span").show();
        $.ajax({
            url: 'http://www.d.cn/djwebst/asych/getmsgcnt/?jsonCallback=?&dmbi=' + dmbi,
            dataType: "jsonp",
            success: function(data) {
                $("#logined_span em").html(data.newMessageCnt);
            }
        });
    } else {
        $("#loginLink").attr("href", "http://my.d.cn/index.html?to=" + window.location.href);
    }
});
var oInput = {};
function initSelect() {
    var upKeyCode = 38;
    var downKeyCode = 40;
    var enterKeyCode = 13;
    oInput = document.getElementById("searchKeyword");
    oInput.options = $("#searchResult li")
    oInput.seletedIndex = -1;
    
    oInput.focus();
    oInput.onkeyup = function(event) {
        if (event == undefined) {
            event = window.event;
        }
        switch (event.keyCode) {
            case upKeyCode:
                clearSelectedOptBgColor(this);
                this.seletedIndex--;
                if (this.seletedIndex < 0)
                    this.seletedIndex = this.options.length - 1;
                setSelectedOptBgColor(this);
                break;
            
            case downKeyCode:
                clearSelectedOptBgColor(this);
                this.seletedIndex++;
                if (this.seletedIndex >= this.options.length)
                    this.seletedIndex = -1;
                setSelectedOptBgColor(this);
                break;
            
            case enterKeyCode:
                //if(this.seletedIndex!=-1){
                //genNewPage(this); 
                //}
                break;
            default:
                genShortResult();
                clearSelectedOptBgColor(this);
                this.seletedIndex = -1;
                break;
        }
    };
    oInput.onblur = function() {
        clearSelectedOptBgColor(this);
        this.seletedIndex = -1;
        clearHover();
    };
}
function clearSelectedOptBgColor(target) {
    if (target.seletedIndex >= 0) {
        removeClass(target.options[target.seletedIndex], "searchTitleHoverLi");
    }
}
function setSelectedOptBgColor(target) {
    addClass(target.options[target.seletedIndex], "searchTitleHoverLi");
}

function genNewPage(target) {
    if (hasClass(target.options[target.seletedIndex], "searchTitleHoverLi")) {
        var url = target.options[target.seletedIndex].firstChild.getAttribute("href");
        window.open(url);
    }
}

function hasClass(obj, cls) {
    if (typeof (obj) == "undefined" || obj == null)
        return false;
    return obj.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
}

function addClass(obj, cls) {
    if (typeof (obj) == "undefined" || obj == null)
        return;
    if (!this.hasClass(obj, cls))
        obj.className += " " + cls;
}

function removeClass(obj, cls) {
    if (hasClass(obj, cls)) {
        var reg = new RegExp('(\\s|^)' + cls + '(\\s|$)');
        obj.className = obj.className.replace(reg, ' ');
    }
}
function searchSubmit() {
    var val = $("#searchKeyword").val();
    val = $.trim(val);
    if (val == '请输入搜索内容' || val == "") {
        if (oInput) {
            oInput.seletedIndex = -1;
        }
        return false;
    }
    if (typeof (oInput) == "undefined" || oInput == null || oInput.seletedIndex == -1) {
        return true;
    }
    if (oInput && oInput.seletedIndex >= 0) { // 回车 进入选中页
        var url = oInput.options[oInput.seletedIndex].firstChild.getAttribute("href");
        $("#form1").attr("action", url).attr("target", "_blank").attr("method", "post");
        setTimeout(function() {
            $("#form1").attr("action", "http://android.d.cn/search/app.html").attr("target", "").attr("method", "get");
        }, 100);
        return true;
    }
}

function redirectURL(url) {
    window.location.href = url;
}

function clearHover() {
    var el = $("#searchKeyword");
    var val = el.val();
    if (val == '' || val == '请输入搜索内容') {
        el.val('请输入搜索内容');
    }
    el.css("color", '#B8B7B7');
    el.removeClass("searchTextHover");
    hideShortResult();
}

var shortResultTimeOut = "";

function genShortResult() {
    var el = $("#searchKeyword");
    var val = el.val();
    if (val == '请输入搜索内容') {
        el.val('');
    }
    el.css("color", 'black');
    el.addClass("searchTextHover");
    if (shortResultTimeOut == "") {
        shortResultTimeOut = "aaa";
        setTimeout('shortResultTime()', 100);
    }
}

function shortResultTime() {
    shortResultTimeOut = "";
    var el = $("#searchKeyword");
    var keyWord = el.val();
    if ($.trim(keyWord).length > 0) {
        var url = "http://api.search.d.cn/shortresult.html?jsonCallback=?";
        $
        .ajax({
            url: url,
            data: {
                'kwd': keyWord,
                'from': 'web_android',
                'cgy': 10,
                'os': 1,
                'pn': 1
            },
            dataType: "jsonp",
            success: function(data) {
                var html = "";
                if (data.RESOURCE && data.RESOURCE.foundCnt > 0) {
                    html += '<div class="searchResultCon">';
                    html += '<div><a href="/search/app/?keyword=' + keyWord 
                    + '" class="searchResultTitle">应用&gt;&gt;</a></div>';
                    html += '<ul class="resourcesCon">';
                    $
                    .each(
                    data.RESOURCE.resultList, 
                    function(ind, obj) {
                        var v = obj.url.indexOf("ng.d.cn") >= 0 ? '' : 'v';
                        html += '<li><a href="' + obj.url + '" target="_blank" title="' + obj.name + '&nbsp;' + v + obj.version + '"><img src="' 
                        + obj.icon + '" alt="' + obj.name + '" />' + obj.nameWithHighLight + '&nbsp;' + v + obj.version + '</a></li>';
                    });
                    html += '</ul><div class="clear"></div></div>';
                }
                if (data.MEMBER && data.MEMBER.foundCnt > 0) {
                    html += '<div class="searchResultCon"><ul class="resourcesCon userCon">';
                    $.each(data.MEMBER.resultList, function(ind, obj) {
                        html += '<li><a href="' + obj.url + '" target="_blank" title="' + obj.showName 
                        + '"><span class="img"><img src="' + obj.avatar + '" alt="' + obj.showName + '" /></span><span>' 
                        + obj.showNameWithHighLight + '(' + obj.memberIdWithHighLight + ')</span></a></li>';
                    });
                    html += '</ul><div class="clear"></div></div>';
                }
                if (data.FORUM_AND_NEWS && data.FORUM_AND_NEWS.foundCnt > 0) {
                    html += '<div class="searchResultCon searchResultarticleCon">';
                    html += '<div><a href="/search/news/?keyword=' + keyWord 
                    + '" class="searchResultTitle">资讯&gt;&gt;</a></div>';
                    html += '<ul class="articleCon">';
                    $.each(data.FORUM_AND_NEWS.resultList, function(ind, obj) {
                        html += '<li><a href="' + obj.url + '" target="_blank" title="' + obj.title + '">' + obj.titleWithHighLight 
                        + '</a></li>';
                    });
                    html += '</ul><div class="clear"></div></div>';
                }
                if (html != "") {
                    var srEl = $("#searchResult");
                    $(".searchResultBg", srEl).html(html);
                    initSelect();
                    if (html != "") {
                        srEl.show();
                    } else {
                        srEl.hide();
                    }
                }
            }
        });
    } else {
        hideShortResult();
        if (typeof (oInput) == "undefined" || oInput == null) {
            oInput.seletedIndex = -1;
        }
    }
}

function hideShortResult() {
    $("#searchResult").fadeOut();
}

function stopEvent(event) {
    if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style) {
        event.cancelBubble = true;
    } else {
        event.stopPropagation();
    }
}

var USER = {
    memberId: 0,
    init: function(options) {
        USER.memberId = options.memberId;
    },
    checkLogin: function(memberId, url, submitFormId, doFunc, funcParaArray) {
        if (memberId == null || memberId == 0) {
            USER.showLoginForm(url, submitFormId, 1, doFunc, funcParaArray);
            return false;
        }
        return true;
    },
    showLoginForm: function(url, submitForumId, errorTip, doFunc, funcParaArray) {
        var name;
        var pwd;
        var type;
        var isRememberPsw;
        var errorTip1 = '<div class="user"><p style="font-size:12px">您需要登录后才能进行操作！</p></div>';
        var errorTip2 = '<div class="user"><p style="color:#be0000; font-size:12px">登录失败！请确认您的登录信息是否正确？</p></div>';
        var htmlContent = '<form id="textInput" style="margin:0; padding:0">';
        if (errorTip == 1) {
            htmlContent = htmlContent + errorTip1;
        } else if (errorTip == 2) {
            htmlContent = htmlContent + errorTip2;
        } else if (errorTip) {
            htmlContent = htmlContent + '<div class="user"><p style="color:#be0000; font-size:12px">' + errorTip + '</p></div>';
            ;
        }
        var qqLogin = $("#qqLoginBtn").html();
        htmlContent = htmlContent 
        + '<div class="user">\
                        <p class="left40">账号：</p> \
                        <input id="name" tabIndex="1" type="text" class="input" onFocus="if(this.value==\'乐乐号/用户名/邮箱\'){this.value=\'\'};this.style.color=\'black\';" value="乐乐号/用户名/邮箱"/> \
                        <span id="wb_connect_btn" ><a class="sinalogin" href="javascript:void(0)" onclick="USER.weiboLogin();"></a></span>\
                      </div>\
                      <div class="user">\
                        <p class="left40">密码：</p> \
                        <input id="password" tabIndex="2" type="password" class="input" /> \
                        <span id="qqLoginBtnInner">' 
        + qqLogin 
        + '</span> \
                        </div>\
                        <div class="user" style="width:80%; margin-left:20%">\
                        <a href="http://my.d.cn/goFindPassword.html" target="_blank" class="forgot">忘记密码？</a><a href="http://my.d.cn/register.html" target="_blank" class="signnew">注册新用户</a>\
                      </div>\
                      <div class="clear"></div>\
                    <div class="clear"></div>\
                      </form>';
        $.fn.jmodal({
            title: "登录",
            fixed: true,
            content: function(body) {
                body.html(htmlContent);
                name = $('#name');
                pwd = $('#password');
            },
            buttonText: {
                ok: '确定',
                cancel: '取消'
            },
            okEvent: function(data, args) {
                if ($.trim(name.val()) == '') {
                    args.isCancelling = true;
                    alert('请填写用户名/乐号.');
                } else if ($.trim(pwd.val()) == '') {
                    args.isCancelling = true;
                    alert('请填写密码.');
                } else {
                    args.isCancelling = false;
                    var qsData = {
                        'userName': name.val(),
                        'password': pwd.val()
                    };
                    $.ajax({
                        async: true,
                        url: "http://d.cn/connect/dj/asyncLogin",
                        type: "GET",
                        contentType: "application/json; charset=utf-8",
                        dataType: 'jsonp',
                        jsonp: 'jsoncallback',
                        data: qsData,
                        timeout: 5000,
                        success: function(json) { // 客户端jquery预先定义好的callback函数,成功获取跨域服务器上的json数据后,会动态执行这个callback函数
                            USER.loginResult(json[0], url, submitForumId, doFunc, funcParaArray);
                        },
                        complete: function(XMLHttpRequest, textStatus) {
                            USER.loginResult(XMLHttpRequest.responseText);
                        },
                        error: function(xhr) {
                            alert("请求出错(请检查相关度网络状况.)");
                        }
                    });
                }
            }
        });
    },
    writeMemberIdRadio: function(num, midArray, infoArray, sigArray, toUrl, age) {
        var midsDiv = '<form method="post" action="http://d.cn/connect/dj/dealNumLogin" id="mid_form">\
              <div class="jmodal-content-mob" id="jmodal-container-content" >\
              <div style="font-size:12px">\
              <div class="wz"><img src="http://res.d.cn/buggy/em73.gif" />亲，您的手机号<span style="color:#be0000;margin:0 5px;font-size:12px" id="num_span">' 
        + num 
        + '</span>已验证多个乐号。<br/>请选择需登录的乐号：</div>\
              </div>\
              <div class="mob" id="radio-div"></div>';
        for (var i = 0; i < midArray.length; i++) {
            midsDiv = midsDiv + "<div class=\"yhm\"><a href=\"javascript:void(0);\" onclick=\"submitMid('" + midArray[i] + "|" 
            + sigArray[i] + "')\" >" + infoArray[i] + "</a>" + "</div>";
        }
        midsDiv = midsDiv + '<input name="info" type="hidden" id="mid_info_input"/>';
        midsDiv = midsDiv + '<input name="toUrl" type="hidden" value="' + toUrl + '"/>';
        midsDiv = midsDiv + '<input name="age" type="hidden" value="' + age + '"/>';
        midsDiv = midsDiv + "</form>";
        
        $.fn.jmodal({
            title: "登录",
            fixed: true,
            noCancel: true,
            content: function(body) {
                body.html(midsDiv);
            },
            buttonText: {
                ok: '取消',
                cancel: '取消'
            }
        
        });
    },
    submitMid: function(info) {
        $("#mid_info_input").val(info);
        $("#mid_form").submit();
    },
    loginResult: function(json, url, submitForumId, doFunc, funcParaArray) {
        var data = json.msg;
        if (data != undefined && data.length > 0) {
            USER.showLoginForm(url, submitForumId, data, doFunc, funcParaArray);
        } else {
            if (!json.dmbi) {
                if (json.mids && json.infos && json.sigs && json.num && json.toUrl && json.age) {
                    var num = json.num;
                    var mids = json.mids;
                    var infos = json.infos;
                    var sigs = json.sigs;
                    var midArray = mids.split(",");
                    var infoArray = infos.split(",");
                    var sigArray = sigs.split(",");
                    USER.writeMemberIdRadio(json.num, midArray, infoArray, sigArray, json.toUrl, json.age);
                } else {
                    USER.showLoginForm(url, submitForumId, data, doFunc, funcParaArray);
                }
            } else {
                var dmbi = json.dmbi;
                var info = json.info;
                var age = json.age;
                var to = json.url;
                
                var _frm = document.createElement("iframe");
                _frm.style.display = "none";
                _frm.src = "http://my.d.cn/setcookie.html?type=add&dmbi=" + dmbi + "&info=" + info + "&age=" + age;
                document.body.appendChild(_frm);
                if (_frm.attachEvent) {
                    _frm.attachEvent("onload", USER.test(url, submitForumId, doFunc, funcParaArray));
                } else {
                    _frm.addEventListener("load", USER.test(url, submitForumId, doFunc, funcParaArray), false);
                }
            }
        }
    },
    test: function(url, submitForumId, doFunc, funcParaArray) {
        if (url != null && url.length > 0) {
            window.location.href = url;
        } else if (submitForumId != null && submitForumId.length > 0) {
            $("#" + submitForumId).submit();
        } else if (doFunc != null) {
            doFunc(funcParaArray[0], funcParaArray[1], funcParaArray[2], funcParaArray[3], funcParaArray[4]);
        } else {
            window.location.reload();
        }
    },
    weiboLogin: function() {
        WB2.login(function() {
            WB2.anyWhere(function(W) {
                W.parseCMD("/account/get_uid.json", function(sResult, bStatus) {
                    if (bStatus == true) {
                        var accessToken = $.cookie('weibojs_1936015137').split('&')[0].split('=')[1];
                        $.ajax({
                            async: true,
                            url: "http://d.cn/connect/weibo/trylogin",
                            type: "GET",
                            dataType: 'jsonp',
                            jsonp: 'jsoncallback',
                            data: {
                                uid: sResult.uid,
                                token: accessToken
                            },
                            success: function(json) {
                                var msg = json[0].msg;
                                if (msg.length != 0) { // 如果有错误信息
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
                            error: function(xhr) {
                                alert("\u8bf7\u6c42\u51fa\u9519(\u8bf7\u68c0\u67e5\u76f8\u5173\u5ea6\u7f51\u7edc\u72b6\u51b5.)");
                            }
                        });
                    }
                }, {}, {
                    method: 'get'
                });
            });
        });
    },
    logout: function() {
        $.ajax({
            async: true,
            url: "http://d.cn/connect/dj/logout",
            type: "GET",
            dataType: 'jsonp',
            jsonp: 'jsoncallback',
            data: {},
            success: function(json) {
                $.ajax({
                    async: true,
                    url: "http://my.d.cn/setcookie.html",
                    type: "GET",
                    dataType: 'jsonp',
                    jsonp: 'jsoncallback',
                    data: {
                        type: 'remove'
                    },
                    success: function(json) {
                        try {
                            QC.Login.signOut();
                            if (WB2.checkLogin()) {
                                WB2.logout(function() {
                                });
                            }
                        } catch (e) {
                            var url = document.URL;
                            if (url.indexOf("my.d.cn") >= 0) {
                                url = 'http://my.d.cn/';
                            }
                            window.location.href = url;
                        }
                        var url = document.URL;
                        if (url.indexOf("my.d.cn") >= 0) {
                            url = 'http://my.d.cn/';
                        }
                        window.location.href = url;
                    }
                });
            }
        });
    },
    getCookie: function(name) { // 取cookies函数
        var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
        if (arr != null)
            return decodeURI(unescape(arr[2], 'utf-8'));
        return null;
    }
};