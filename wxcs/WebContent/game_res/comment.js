function getByDomId(id) {
    return jQuery("#" + id);
}
var COMMENT = {
    resourceId : 0,
    resourceTypeId : 0,
    forumId:0,
    topicId:0,
    pageNo : 0,
    pageSize : 10,
    pageCount : 0,
    commentFormDivId : '',
    commentListDivId : '',
    commentPagerDivId : '',
    init : function(options) {
        COMMENT.resourceId = options.resourceId;
        COMMENT.resourceTypeId = options.resourceTypeId;
        COMMENT.forumId=options.forumId;
        COMMENT.topicId=options.topicId;
        COMMENT.pageNo = options.pageNo;
        COMMENT.pageSize = options.pageSize;
        COMMENT.pageCount = options.pageCount;
        COMMENT.commentFormDivId = options.commentFormDivId;
        COMMENT.commentListDivId = options.commentListDivId;
        COMMENT.commentPagerDivId = options.commentPagerDivId;
        COMMENT.genPager(COMMENT.pageNo);
    },
    starOver : function(obj) {
        var rating_num = jQuery(obj).attr("id").substr(5, 1);
        for ( var i = 1; i <= 5; i++) {
            if (i <= rating_num) {
                jQuery("#star_" + i).addClass("star5").removeClass("star0");
            } else {
                jQuery("#star_" + i).addClass("star0").removeClass("star5");
            }
        }
        jQuery("#stars").val(rating_num);
    },
    getComments : function(pageNo) {
        var url = "/asych/gcs?pageNo=" + pageNo + "&pageSize=" + COMMENT.pageSize + "&forumId=" + COMMENT.forumId
                + "&topicId=" + COMMENT.topicId;
        jQuery.getJSON(url, success);
        function success(data, textStatus) {
            if (textStatus === "success") {
                getByDomId(COMMENT.commentListDivId).html(writeHtml(data));
                COMMENT.pageNo = data.model.pageNo;
                COMMENT.pageCount = data.model.pageCount;
                COMMENT.genPager(COMMENT.pageNo);
            }
        }
        function writeHtml(data) {
            var list = data.model.comments;
            var size = list.length;
            var str = "";
            for ( var i = 0; i < size; i++) {
                var channel = "";
                var version = "";
                var showName = "";
                var comment = list[i];
                if (comment.showName == null || comment.showName == "") {
                    showName = "匿名";
                } else {
                    showName = comment.showName;
                }
                if (comment.version != null && comment.version != "") {
                    version = "v" + comment.version;
                }
                if (comment.channelFlag == 2) {
                    channel = "来自&nbsp;手机用户";
                } else if (comment.channelFlag == 4) {
                    channel = "来自&nbsp;"
                            + comment.device
                            + '<a href="http://app.d.cn" target="_blank"><img src="http://img.d.cn/android2012/images/diguaicobg.gif" alt="当乐游戏中心">当乐游戏中心</a>'
                            + version;
                }
                str += '';
                str += '<div class="messages">';
                str += '  <div class="photo"  id="user-pic-'+comment.createdBy+'"><img src="http://img.d.cn/android2012/images/guest.gif" alt="' + showName + '" /></div>';
                str += '  <ul>';
                str += '    <li><b>' + showName + '&nbsp;说：</b><span class="floor">' + comment.floor + '</span></li>';
                str += '    <li class="msg">' + x4pass.utils.encodeHtml(comment.comment) + '</li>';
                str += '    <li><div class="come_from">' + channel + '</div></li>';
                str += '    <li><span class="time">' + comment.createdDate  + '</span><div class="star_reply"><div class="rom_star rom_star' + (comment.stars)
                        + '"></div><a href="javascript:" onclick="COMMENT.replyComment(\'' + comment.floor
                        + '\',\'' + comment.id+ '\');return false;" title="回复"></a></div></li>';
                str += '  </ul>';
                str += '  <div class="clear"></div>';
                str += '</div>';
            }
            return str;
        }
    },
    ctrlEnter : function() {
        var $form = getByDomId(COMMENT.commentFormDivId);
        $form.find("[name='comment']").keydown(function(e) {
            if (!e)
                e = window.event;
            if (e.ctrlKey && e.keyCode == 13) {
                COMMENT.validateCallback($form);
            }
        });
    },
    validateCallback : function(form) {
        var $form = jQuery(form);
        var comment = $form.find("[name='comment']").val();
        if (comment == '' || jQuery.trim(comment) == '') {
            showMsg("评论不能为空!");
            return false;
        }
        $form.find("[name='comment']").val(comment.replace(/回复[0-9]*楼:/i, ""));
        var data=jQuery.merge($form.serializeArray(),[{name:"resourceId",value:COMMENT.resourceId},{name:"resourceType",value:COMMENT.resourceTypeId},{name:"forumId",value:COMMENT.forumId},{name:"topicId",value:COMMENT.topicId}]);
        jQuery.post($form.attr("action"), data, success, "json");
        return false;
        function success(data, textStatus) {
            if (textStatus === "success") {
                if (data.model.msg) {
                    showMsg(data.model.msg);
                } else {
                    showMsg("评论成功");
                    $form[0].reset();
                    COMMENT.getComments(1);
                }
            }
        }
    },
    replyComment : function(floor, quoteId) {
        var comment = "回复" + floor + "楼:";
        var $form = getByDomId(COMMENT.commentFormDivId);
        $form.find("[name='comment']").val(comment);
        $form.find("[name='quoteId']").val(quoteId);
    },
    genPager : function(pageNo) {
        var html = "";
        var extEvent = 'COMMENT.getComments(pageNo);';
        pageNo = pageNo <= 0 ? 1 : pageNo;
        pageNo = pageNo >= this.pageCount ? this.pageCount : pageNo;
        var tempEvent = "";
        if (this.pageCount <= 1) {
            return;
        }
        if (pageNo > 1) {
            tempEvent = extEvent.replace(/pageNo/g, "" + 1);
            html = html + "<a href='javascript:' onclick='COMMENT.genPager(" + 1 + ");" + tempEvent + "'>首页</a>";
            tempEvent = extEvent.replace(/pageNo/g, "" + (pageNo - 1));
            html = html + "&nbsp;<a href='#comments-top' onclick='COMMENT.genPager(" + (pageNo - 1) + ");" + tempEvent + "'>上一页</a>";
        }
        var begin = pageNo - (COMMENT.pageSize / 2);
        begin = (begin <= 0) ? 1 : begin;
        var end = begin + COMMENT.pageSize - 1;
        end = (end > this.pageCount) ? this.pageCount : end;
        for ( var i = begin; i <= end; i++) {
            tempEvent = extEvent.replace(/pageNo/g, "" + i);
            if (i != pageNo) {
                html = html + "&nbsp;<a href='#comments-top' onclick='COMMENT.genPager(" + i + ");" + tempEvent + "'>" + i + "</a>";
            } else {
                html = html + "&nbsp;" + i;
            }
        }
        if (pageNo < this.pageCount) {
            tempEvent = extEvent.replace(/pageNo/g, "" + (pageNo + 1));
            html = html + "&nbsp;<a href='#comments-top' onclick='COMMENT.genPager(" + (pageNo + 1) + ");" + tempEvent + "'>下一页</a>";
            tempEvent = extEvent.replace(/pageNo/g, "" + this.pageCount);
            html = html + "&nbsp;<a href='#comments-top' onclick='COMMENT.genPager(" + this.pageCount + ");" + tempEvent + "'>尾页</a>";
        }
        getByDomId(COMMENT.commentPagerDivId).html(html);
    }
};

function showMsg(msg) {
    var $msg = jQuery("#msg");
    $msg.html(msg);
    $msg.css({
        left : ($(window).width() - $msg.outerWidth()) / 2,
        top : ($(window).height() - $msg.outerHeight()) / 2 + jQuery(document).scrollTop()
    });
    $msg.show();
    setTimeout(function() {
        $msg.hide();
    }, 3000);
}

// 日期处理
function dateStr(date) {
    var str = "";
    str = str + (date.year + 1900) + "-";

    if (date.month < 9) {
        str = str + "0" + (date.month + 1) + "-";
    } else {
        str = str + (date.month + 1) + "-";
    }

    if (date.date < 10) {
        str = str + "0" + (date.date) + " ";
    } else {
        str = str + (date.date) + " ";
    }

    if (date.hours < 10) {
        str = str + "0" + (date.hours) + ":";
    } else {
        str = str + (date.hours) + ":";
    }

    if (date.minutes < 10) {
        str = str + "0" + (date.minutes) + ":";
    } else {
        str = str + (date.minutes) + ":";
    }

    if (date.seconds < 10) {
        str = str + "0" + (date.seconds) + " ";
    } else {
        str = str + (date.seconds) + " ";
    }
    return str;
}