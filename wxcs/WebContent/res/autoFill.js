ClAutoFill = function(initData){
	this.init(initData);
};
ClAutoFill.prototype = {
	filldatas:new Array(),/* 总数据的存放元素*/
	divX:new Object(),/* 弹出框的左坐标*/
	divY:new Object(),/* 弹出框的顶坐标*/
	textField:new Object(),/* 输入号码的文档框*/
	table:new Object(),
	div:new Object(),/* 弹出框的存放元素*/
	bodyOldKeyDownHandler:new Object(),
	promptIndex:-1,/* 当前选中的提示信息的索引*/
	results:new Array(),/*匹配结果集*/
	selectColor:"#dddddd",/*被选中时的颜色*/
	unselectColor:"#f0f0f0",/*未被选中时的颜色*/
	maxPrompt:10,/*最大显示提示数*/
	promptBoxName:"autoPrompt",/*提示框table默认的id*/
	inputBoxName:"autoInputField",/*自动填充输入框默认的id*/
	keyChar:"@",/*触发自动提示的字符*/
	trClassName:"trpromptItem",/*提示项tr的class属性名*/
	tdClassName:"tdpromptItem",/*提示项td的class属性名*/
	bodyOldHandler:new Object(),
	/* 返回元素在页面中的横坐标*/
	init:function (initData) {
		/*设置号码数据*/
		if(initData.filldatas){
			this.filldatas = initData.filldatas;
		}
		/*获取存放弹出框元素*/
		if(initData.selectColor){
			this.selectColor = initData.selectColor;
		}
		if(initData.unselectColor){
			this.unselectColor = initData.unselectColor;
		}
		if(initData.promptBoxName){
			this.promptBoxName = initData.promptBoxName;
		}
		if(initData.inputBoxName){
			this.inputBoxName = initData.inputBoxName;
		}
		if(initData.maxPrompt){
			this.maxPrompt = initData.maxPrompt;
		}
		if(initData.keyChar){
			this.keyChar = initData.keyChar;
		}
		if(initData.tableClassName){
			this.tableClassName = initData.tableClassName;
		}
		if(initData.trClassName){
			this.trClassName = initData.trClassName;
		}
		if(initData.tdClassName){
			this.tdClassName = initData.tdClassName;
		}
		this.table = document.getElementById(this.promptBoxName);
		this.textField = document.getElementById(this.inputBoxName);
		this.table.style.position = "absolute";
		this.table.style.zIndex = "1";
		this.table.style.display = "none";
		this.table.style.backgroundColor = this.unselectColor;
		/*this.table.width = this.textField.width;*/
		this.table.width = this.textField.clientWidth;
		(this.textField.onkeyup = function(e){
			if (!e) {
				e = window.event;
			}
			var autoFileImpl = arguments.callee.impl;
			/* 如果按键为上下键或者回车键这里不做处理*/
			if (e.keyCode == 38 || e.keyCode == 40 || e.keyCode == 13) {
				return;
			}
			var text = autoFileImpl.parseInput(this.value);
			if (null == text) {
				autoFileImpl.deleteDiv();
				return;
			}
			autoFileImpl.divX = autoFileImpl.getX(autoFileImpl.textField);/* 设置弹出框的横坐标*/
			autoFileImpl.divY = autoFileImpl.getY(autoFileImpl.textField);
			autoFileImpl.divY += autoFileImpl.textField.offsetHeight;/* 设置弹出框的纵坐标*/
			autoFileImpl.search(text);/* 搜多联系人列表，把匹配的数据放到临时数组中*/
			autoFileImpl.deleteDiv();/* 删除旧的提示框*/
			autoFileImpl.createDiv();/* 创建提示框*/
		}).impl = this;
		/*给body元素追加(原来的效果继续有效)点击事件执行的函数*/
		this.bodyOldKeyDownHandler = document.body.onkeydown;
		this.bodyOldHandler = document.body.onclick;
		(document.body.onclick = function(){
			var autoFileImpl = arguments.callee.impl;
			if (null != autoFileImpl.bodyOldHandler) {
				autoFileImpl.bodyOldHandler();
			}
			autoFileImpl.deleteDiv();
		}).impl=this;
		/*根据浏览器类型设置table元素*/
		if(this.table.firstChild && this.table.firstChild.nodeName.toLocaleLowerCase() == "tbody"){
			this.div = this.table.firstChild;
		} else {
			this.div = this.table;
		}
	},
    getX:function (e) {
		var x = 0;
		while (e) {
			x += e.offsetLeft;
			e = e.offsetParent;
		}
		return x;
	},
	/* 返回元素在页面中的纵坐标*/
	getY:function (e) {
		var y = 0;
		while (e) {
			y += e.offsetTop;
			e = e.offsetParent;
		}
		return y;
	},
	/* 根据用户输入的内容生成正则表达式*/
	parseInput:function (text) {
		if(this.isBlank(this.keyChar)){
			return text;
		}else{
			var fillRegExp = new RegExp("[\\S]+"+this.keyChar+"[\\S]*");
			if(!(fillRegExp.test(text))){
				return null;
			}
			var flagIndex = text.lastIndexOf(this.keyChar);
			if(flagIndex == text.length - 1){
				return "";
			} else {
				return text.substring(flagIndex + 1);
			}
		}
	},
	search:function (text) {
		this.results = new Array();
		if(text == ""){
			for ( var i = 0; i < this.filldatas.length; i++) {
				this.results.push(this.filldatas[i]);
			}
		} else {
			var regExp = new RegExp("^" + text + "[\\S]+");
			for ( var i = 0; i < this.filldatas.length; i++) {
				if (regExp.test(this.filldatas[i])) {
					this.results.push(this.filldatas[i]);
				}
			}
		}
	},
	/* 生成自动填充框*/
	createDiv:function () {
		for ( var i = 0; i < this.results.length && i < this.maxPrompt; i++) {
			var tr = document.createElement("tr");
			var td = document.createElement("td");
			tr.setAttribute("class",this.trClassName);
			td.id = i + "filldata";/* 设置td的id*/
			td.setAttribute("class",this.tdClassName);
			td.appendChild(document.createTextNode(this.results[i]));
			(td.onclick = function(){
				var id = parseInt(this.id);
				var autoFillImpl = arguments.callee.impl;
				autoFillImpl.promptIndex = -1;
				var textValue = autoFillImpl.textField.value;
				var autoFillValue = autoFillImpl.results[id];
				if(!autoFillImpl.isBlank(autoFillImpl.keyChar)){
					autoFillValue = textValue.substring(0,textValue.lastIndexOf(autoFillImpl.keyChar) + 1) + autoFillImpl.results[id];
				}
				autoFillImpl.textField.value = autoFillValue;
				autoFillImpl.textField.focus();
				autoFillImpl.deleteDiv();
			}).impl = this;
			(td.onmouseover = function(){
				this.style.backgroundColor = arguments.callee.impl.selectColor;
			}).impl = this;
			(td.onmouseout = function(){
				this.style.backgroundColor = arguments.callee.impl.unselectColor;
				arguments.callee.impl.promptIndex = parseInt(this.id);
			}).impl = this;
			(document.body.onkeydown = function(e){
				if (!e) {
					e = window.event;
				}
				var autoFillImpl = arguments.callee.impl;
				/* 执行body本身的按键事件*/
				if (null != autoFillImpl.bodyOldKeyDownHandler) {
					autoFillImpl.bodyOldKeyDownHandler();
				}
				/* 上键的按键响应*/
				if (38 == e.keyCode) {
					if (-1 == autoFillImpl.promptIndex || 0 == autoFillImpl.promptIndex) {
						return;
					}
					autoFillImpl.promptIndex--;
					autoFillImpl.changeColor();
					return;
				}
				/* 下键的按键响应*/
				if (40 == e.keyCode) {
					if (-1 == autoFillImpl.promptIndex || (autoFillImpl.results.length - 1) <=autoFillImpl.promptIndex) {
						autoFillImpl.promptIndex = 0;
					} else {
						autoFillImpl.promptIndex++;
					}
					autoFillImpl.changeColor();
					return;
				}
				/* 回车键的按键响应*/
				if (13 == e.keyCode) {
					if(-1!=autoFillImpl.promptIndex){
						var textValue = autoFillImpl.textField.value;
						var autoFillValue = autoFillImpl.results[autoFillImpl.promptIndex];
						if(!autoFillImpl.isBlank(autoFillImpl.keyChar)){
							autoFillValue = textValue.substring(0,textValue.lastIndexOf(autoFillImpl.keyChar) + 1) + autoFillImpl.results[autoFillImpl.promptIndex];
						}
						autoFillImpl.textField.value = autoFillValue;
						autoFillImpl.textField.focus();
						autoFillImpl.deleteDiv();
						autoFillImpl.promptIndex = -1;
					    document.body.onkeydown = autoFillImpl.bodyOldKeyDownHandler;
				    }
					return;
				}
			}).impl = this;
			tr.appendChild(td);
			this.div.appendChild(tr);
		}
		this.table.style.display = "";
	},
	deleteDiv:function () {
		while (this.div.firstChild) {
			this.div.removeChild(this.div.firstChild);
		}
		this.table.style.display = "none";
		document.body.onkeydown=this.bodyOldKeyDownHandler;/* 网页窗体onclick事件处理还原*/
	},
	isBlank:function(str){
		if(!str || str==null || str.length==0){
			return true;
		}
		return false;
	},
	/* 改变提示项的颜色*/
	changeColor:function () {
		for ( var i = 0; i < this.results.length&&i<this.maxPrompt; i++) {
			var td=document.getElementById(i + "filldata");
			if (i == this.promptIndex) {
				td.style.backgroundColor = this.selectColor;
				continue;
			}
			td.style.backgroundColor = this.unselectColor;
		}
	}
}
