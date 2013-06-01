/**
 * javascript工具类集合
 */
(function (window){
    window.x4pass = {
        version: '1.0.0',
        author: 'Jonathan Lai(xingbing.lai@downjoy.com)',
        $d:function(id){
            return document.getElementById(id);
        }
    };

    x4pass.utils = {
        encodeHtml:function (str){
            var s;
            if (str.length == 0) return "";
            s = str.replace(/&/g, "&gt;");
            s = s.replace(/</g, "&lt;");
            s = s.replace(/>/g, "&gt;");
            s = s.replace(/ /g, "&nbsp;");
            s = s.replace(/\'/g, "&#39;");
            s = s.replace(/\"/g, "&quot;");
            s = s.replace(/\n/g, "<br>");
            return s;
        },
        decodeHtml: function(str){
            var s;
            if (str.length == 0) return "";
            s = str.replace(/&gt;/g, "&");
            s = s.replace(/&lt;/g, "<");
            s = s.replace(/&gt;/g, ">");
            s = s.replace(/&nbsp;/g, " ");
            s = s.replace(/&#39;/g, "\'");
            s = s.replace(/&quot;/g, "\"");
            s = s.replace(/<br>/g, "\n");
            return s;
        }
    };
})(window);