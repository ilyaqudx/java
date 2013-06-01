MiscUtil.prototype = {};

function MiscUtil() {
};

MiscUtil.addCookie = function(name, value, options) {
	var str = name + "=" + escape(value);
	options = options || {}; // 对象options或者空
	var hours = options.hours;
	var path = options.path;
	if (hours > 0) {
		var date = new Date();
		var ms = hours * 3600 * 1000;
		date.setTime(date.getTime() + ms);
		str += "; expires=" + date.toGMTString();
	}
	if (path) {
		str += "; path=" + path;
	}
	document.cookie = str;
};

MiscUtil.deleteCookie = function(name) {
	var date = new Date();
	date.setTime(date.getTime() - 10000);
	document.cookie = name + "=; expires=" + date.toGMTString();
};

MiscUtil.getCookie = function(name) {
	var arrStr = document.cookie.split("; ");
	for ( var i = 0; i < arrStr.length; i++) {
		var temp = arrStr[i].split("=");
		if (temp[0] == name) {
			return unescape(temp[1]);
		}
	}

	return "";
};

MiscUtil.getHashCode = function(str) {
	var hash = 0;
	if (str.length == 0) {
		return hash;
	}
	for ( var i = 0; i < str.length; i++) {
		char = str.charCodeAt(i);
		hash = ((hash << 5) - hash) + char;
		hash = hash & hash;
	}
	return hash;
};

ClientInfo.prototype = {

	cookieEnable : "",

	platform : "",

	browserLanguage : "",

	userLanguage : "",

	userAgent : "",

	referrer : "",

	pageTitle : "",

	screenSize : "",

	currentURL : "",

	init : function() {
		if (navigator) {
			this.cookieEnable = navigator.cookieEnabled || "";
			if (this.cookieEnable) {
				this.cookieEnable = this.cookieEnable + "";
			}
			this.platform = navigator.platform || "";
			this.userAgent = navigator.userAgent || "";
			this.browserLanguage = navigator.browserLanguage || "";
			this.userLanguage = navigator.userLanguage || "";
		}

		if (screen) {
			this.screenSize = screen.width + "x" + screen.height;
		}

		if (document) {
			this.pageTitle = "";
			this.referrer = document.referrer.length < 300 || "";
		}

		this.currentURL = window.location.href;
	}
};

function ClientInfo() {
	this.init();
};

CookieValue.prototype = {

	duta : "",

	dutb : "",

	dutc : "",

	dutz : "",

	dmbi : "",

	djtk : "",

	init : function() {
		if (this.isEmpty()) {
			this.refresh();
			this.checkValue();
		}
	},

	isEmpty : function() {
		return (this.duta == "" && this.dutb == "" && this.dutc == ""
				&& this.dutz == "" && this.dmbi == "" && this.djtk == "");
	},

	refresh : function() {
		this.duta = MiscUtil.getCookie("__duta") || "";
		this.dutb = MiscUtil.getCookie("__dutb") || "";
		this.dutc = MiscUtil.getCookie("__dutc") || "";
		this.dutz = MiscUtil.getCookie("__dutz") || "";
		this.dmbi = MiscUtil.getCookie("dmbi") || "";
		this.djtk = MiscUtil.getCookie("djtk") || "";
	},

	checkValue : function() {
		var nowTime = new Date().getTime();
		if (this.dutc != "") {
			var needAddCookie = false;
			if (this.dutb != "") {
				var array = this.dutb.split("\\.");
				var expires = parseInt(array[2]);
				if (nowTime - expires > 30 * 60 * 1000) {
					needAddCookie = true;
				}
			}
			if (this.dutb == "" || needAddCookie) {
				var options = {
					hours : 0.5,
					path : '/',
				};
				MiscUtil.addCookie("__dutb", this.dutb, options);
			}
		}
		this.refresh();
	}
};

function CookieValue() {
	this.init();
};

RequestInfo.prototype = {

	cookieValue : null,

	clientInfo : null,

	domain : "",

	command : "",

	params : {},

	init : function(cookieValue, clientInfo, domain, command, params) {
		this.cookieValue = cookieValue;
		this.clientInfo = clientInfo;
		if (!domain || domain == "") {
			domain = document.domain.replace("http://", "");
		}
		this.domain = domain;
		this.command = command;
		this.params = params;
	}
};

function RequestInfo(cookieValue, clientInfo, domain, command, params) {
	this.init(cookieValue, clientInfo, domain, command, params);
};

/*
 * DOWNJOY POST QUERY
 */
DJPQ.prototype = {

	POST_URL : "http://dut.d.cn/union.gif",
	
	callbackFlag:true,

	/*
	 * change object to json string
	 * 
	 * @param obj requestInfo
	 */
	obj2str : function(o) {
		var r = [];
		if (typeof o == "string") {
			return "\""
					+ o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, " \\n")
							.replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t")
					+ "\"";
		}
		if (typeof o == "undefined") {
			return "";
		}
		if (typeof o == "object") {
			if (o === null) {
				return "null";
			}
			if (!o.sort) {
				for ( var i in o) {
					if (typeof o[i] != "function") {
						r.push("\"" + i + "\":" + this.obj2str(o[i]));
					}
				}
				r = "{" + r.join() + "}";
			} else {
				for ( var i = 0; i < o.length; i++) {
					if (typeof o[i] != "function") {
						r.push(this.obj2str(o[i]));
					}
				}
				r = "[" + r.join() + "]";
			}
			return r;
		}
		return o.toString();
	},

	getPostUrl : function(url, command, dmbi) {
		var date = new Date().getTime();
		var vCode = MiscUtil.getHashCode(url) ^ parseInt(date /1000) ^ 0101;
		return this.POST_URL + "?fd=" + date + "&v=" + vCode + "&command="
				+ command + "&dmbi=" + dmbi;
	},

	/*
	 * ajax request to the server
	 * 
	 * @param requestInfo object what need give the server, it will be changed
	 * to json string
	 * 
	 * @param callback object what has sucess method and error method
	 */
	doAjax : function(requestInfo, command, callback) {
		$.ajax({
			async : false,
			url : this.getPostUrl(requestInfo.clientInfo.currentURL, command,
					requestInfo.cookieValue.dmbi),
			type : "GET",
			contentType : "application/json; charset=utf-8",
			dataType : 'jsonp',
			jsonp : 'jsoncallback',
			data : {
				"requestInfo" : encodeURI(this.obj2str(requestInfo))
			},
			success : function(json) {
				callback.success(json[0]);
			},
			error : function(xhr) {
				callback.error(xhr);
			},
			complete : function(XMLHttpRequest, textStatus) {
			}
		});
	},

	/*
	 * create or modify cookie; verify request need getRequestInfo and write
	 * callback @command string
	 */
	getTracker : function(command, action, params, domain) {
		RequestInfo
		requestInfo = new RequestInfo(new CookieValue(), new ClientInfo(),
				domain, action, params);
		var callback = {
			success : function(reply) {
				var options = {
					hours : 0,
					path : '/'
				};
				if (reply.body.cookie.duta && reply.body.cookie.duta != "") {
					options.hours = 24 * 365 * 2;
					MiscUtil.addCookie("__duta", reply.body.cookie.duta,
							options);
				}
				if (reply.body.cookie.dutb && reply.body.cookie.dutb != "") {
					options.hours = 0.5;
					MiscUtil.addCookie("__dutb", reply.body.cookie.dutb,
							options);
				}
				if (reply.body.cookie.dutc && reply.body.cookie.dutc != "") {
					options.hours = 0;
					MiscUtil.addCookie("__dutc", reply.body.cookie.dutc,
							options);
				}
				if (reply.body.cookie.dutz && reply.body.cookie.dutz != "") {
					options.hours = 24 * 30 * 6;
					MiscUtil.addCookie("__dutz", reply.body.cookie.dutz,
							options);
				}
			},
			error : function(reply) {
				callbackFlag = false;
			}
		};
		this.doAjax(requestInfo, command, callback);
	},

	/*
	 * request the server with params, then server will be record the pageView
	 */
	pageView : function(command, action, params, domain) {
		RequestInfo
		requestInfo = new RequestInfo(new CookieValue(), new ClientInfo(),
				domain, action, params);
		var callback = {
			success : function(reply) {
			},
			error : function(reply) {
			}
		};
		this.doAjax(requestInfo, command, callback);
	},

	/*
	 * 
	 * it used to record the click count that the same href in (different
	 * position,different pager,different domain)
	 * 
	 * @command array
	 */
	clickEvent : function(command, action, params, domain) {
		RequestInfo
		requestInfo = new RequestInfo(new CookieValue(), new ClientInfo(),
				domain, action, params);
		var callback = {
			success : function(reply) {
			},
			error : function(reply) {
			}
		};
		this.doAjax(requestInfo, command, callback);
	}
};

function DJPQ() {
};

/*
 * DOWNJOY QUERY INVOKE
 */
DJQI.prototype = {

	djpq : new DJPQ(),

	domain : "",

	METHOD_TYPE : {
		GET_TRACKER : "getTracker",
		PAGE_VIEW : "pageView",
		CLICK_EVENT : "clickEvent",
		SET_DOMAIN : "setDomain"
	},

	init : function(array) {
		for ( var i = 0; i < array.length; i++) {
			this.push(array[i]);
		}
	},

	push : function(array) {
		if (!array || array.length == 0) {
			return;
		}
		var commandStr = "";
		var action = "";
		var params = {};
		if (array.length == 1) {
			commandStr = array[0];
			action = array[0];
		} else if (array.length == 2) {
			commandStr = array[0];
			params = array[1];
		} else if (array.length == 3) {
			commandStr = array[0];
			action = array[1];
			params = array[2];
		} else {
			return;
		}
		if (commandStr == this.METHOD_TYPE.GET_TRACKER) {
			this.djpq.getTracker(commandStr, action, params, this.domain);
		}else if (commandStr == this.METHOD_TYPE.SET_DOMAIN) {
			this.domain = params.domain;
		}
		if(this.djpq.callbackFlag){			
		    if (commandStr == this.METHOD_TYPE.PAGE_VIEW) {
				this.djpq.pageView(commandStr, action, params, this.domain);
			} else if (commandStr == this.METHOD_TYPE.CLICK_EVENT) {
				this.djpq.clickEvent(commandStr, action, params, this.domain);
			} 
		}
	}
};

function DJQI(array) {
	this.init(array);
};


