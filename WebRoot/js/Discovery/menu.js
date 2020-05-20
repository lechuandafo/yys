	/**
	Author��xiaoyan
	create��2015-02-16 by FY
	mySite��http://xiaoyan421123.blog.163.com
*/

var _doc = window.document,
	_docEle = _doc.documentElement;

var xyLib = {
	isIE: !-[1,],
	//�����ӿ�
	create: function(){
		return function(){
			return this.initialize.apply(this, arguments);
		}
	},
	createEle: function(name){
		return _doc.createElement(name);
	},
	//��������
	exchange: function(destination, source){
		for(attr in source) destination[attr] = source[attr];
		return destination;
	},
	each: function (callback) {
		var length = this.elements.length;
		if (length > 0) {
			for (var i = 0; i < length; i++) {
				callback.call(this, i, this.elements[i]);
			}
		}
	},
	//���¼�
	bind: function (obj, type, fn) {
		if (obj.addEventListener) {
			obj.addEventListener(type, fn, false);
		}else if (obj.attachEvent) {
			obj.attachEvent('on' + type, fn);
		}else {
			obj['on' + type] = fn;
		}
	},
	unbind: function(obj, type, fn){
		if (element.removeEventListener) {
            element.removeEventListener(type, fn, false);
        } else if (element.detachEvent) {
            element.detachEvent("on" + type, fn);
        } else {
            element["on" + type] = null;
        }
	},
	// ��ֹ�¼�ð��
	stopBubble : function(e){
		e.stopPropagation ? e.stopPropagation() : e.cancelBubble = true;
	},
	// ��ֹ�����Ĭ����Ϊ
	stopDefault : function(e){
		e.preventDefault ? e.preventDefault() : e.returnValue = false;
	},
	clearTxt: function(){
		try{
			window.getSelection ? window.getSelection().removeAllRanges() : _doc.selection.empty();
		}catch(_){};
	},
	mouseWheel: function(obj, handle){
		var _this = this;
		function getWheelData(event){
			var evt = event || window.event,
				delta = evt.wheelDelta ? -evt.wheelDelta : evt.detail*40;
			handle(delta);
			_this.stopDefault(event);
		}
		_this.bind(obj, 'mousewheel', getWheelData);
		_this.bind(obj, 'DOMMouseScroll', getWheelData);
	},
	//callBack: xyLib.$('#list') , xyLib.$('.list') , xyLib.$('div')
	$: function(str, obj) {
		var oParent = obj || document;
			_mark = str.charAt(0),
			_str = str.substr(1);
		switch(_mark){
			case '#':
				return document.getElementById(_str);
				break;
			case '.':
				var cls = oParent.getElementsByTagName('*'),
					arr = [],
					len = cls.length,
					exp = new RegExp('(^|\s)'+_str+'(\s|$)', 'i');
				for(var i=0;i<len;i++){
					if(exp.test(cls[i].className)) {
						arr.push(cls[i]);
					}
				}
				return arr;
				break;
			default:
				return oParent.getElementsByTagName(str);
				break;
		}
	},
	
	//�˶����
	mx: {
		/*
			[��ǿ���ȡcss]
			css(li, "paddingTop");
			css(li, {"opacity" : "0", "height" : "0"});
			css(li, {"display" : "block", "opacity" : "0", "height" : (count += 10) + "px"});
			
			css(li, "height", iHeight + "px");
			css(li, "opacity", (alpha += 10));
			css(li, "opacity", 100);
		*/
		css: function(obj, attr, value){
			var args = arguments.length;
			if(typeof obj != 'object') return;
			switch(args){
				case 2:
					if(typeof arguments[1] === "object"){
						for(var i in attr){
							i === "opacity" ? (obj.style["filter"] = "alpha(opacity="+ attr[i] +")", obj.style[i] = attr[i]/100) : obj.style[i] = attr[i];
						}
					}else{
						return obj.currentStyle ? obj.currentStyle[attr] : document.defaultView.getComputedStyle(obj, false)[attr];
					}
					break;
				case 3:
					attr === "opacity" ? (obj.style["filter"] = "alpha(opacity="+ value +")", obj.style[attr] = value/100) : obj.style[attr] = value;
					break;
			}
		},
		/*
			callback: doMoveBuffer(oUl,{height:50, opacity:100}, 1000, function(){...});
			fx: ȡֵ100-1000���
		*/
		doMoveBuffer: function(obj, json, fx, fn){
			var _this = this,
				s = new Date().getTime(),d = fx || 500,b,c,
				//Tween����  t:��ǰʱ��  b:��ʼֵ  c:�仯ֵ  d:��ʱ��
				tween=function(t,b,c,d){return -c*(t/=d)*(t-2) + b},
				scale,
				iTar = {};
				
			for(var i in json){
				iTar[i] = 0;
				iTar[i] = (i == 'opacity') ? parseInt(parseFloat(_this.css(obj, i)).toFixed(2)*100) : parseInt(_this.css(obj, i));
			}
			
			clearInterval(obj.timer);
			obj.timer = setInterval(function(){
				for(var attr in json){
					scale = 1 - Math.max(0, s - new Date().getTime() + d)/d;
					t = scale*d;
					b = iTar[attr]; //����д��iTar[i]
					c = json[attr] - b;
					var value = tween(t,b,c,d);
					
					
					if(attr == 'opacity'){
						obj.style.filter = 'alpha(opacity:'+value+')';
						obj.style.opacity = value/100;
					}else{
						obj.style[attr] = value + 'px';
					}
				}
				 if(scale == 1){
					clearInterval(obj.timer);
					obj.timer = null;
					fn && fn.call(obj);
				} 
			}, 5);
		}
	}
};


/*
	-----------------------------------
	### JS���������Ч��
	-----------------------------------
	>>>ע��: ��������div�Ŀ�Ⱥ͸߶�
	var _scroll = new addScroll();
		_scroll.init({id:'#wgt_scrollBox1',cid:'#contentBox1',height:320,width:155,srType:false,srW:8,fixed:false});
	-----------------------------------
*/
var addScroll = function(){
	var fx = function(){},
		_wheelDelta = -1;
	fx.prototype = {
		//��������
		setOptions: function(options){
			defaults = {
				id: null,				//������ID
				cid: null,				//������ID
				height: 300,			//������߶�
				width: 200,				//��������
				srType: false,			//true: ������ť�͹����������һ��	false:��������ϸ��
				thick: 8,				//��������ť���
				fixed: true				//���������� (true:�̶�	false:����)
			};
			return xyLib.exchange(defaults, options || {});
		},
		//��ʼ���ӿ�
		init: function(options){
			var _this = this,
			opt = _this.setOptions(options),
			
			obj = xyLib.$(opt.id),
			content = xyLib.$(opt.cid),
			_height = (content.clientHeight < opt.height) ? content.clientHeight : opt.height,
			_width = opt.width;
			
			xyLib.mx.css(obj, {overflow:'hidden',position:'relative',height:_height+'px', width:_width+'px'});
			xyLib.mx.css(content, {position:'absolute',left:0,top:0});
			
			_this._setbtnScroll(obj, content, opt.srType, opt.thick, opt.fixed);
		},
		//����������
		_createScroll: function(obj){
			var auto_scroll_box = xyLib.createEle('div'),
				auto_scroll_box_btn = xyLib.createEle('div');
			auto_scroll_box.className = 'auto_scroll_box';
			auto_scroll_box_btn.className = 'auto_scroll_box_btn';
			
			auto_scroll_box.appendChild(auto_scroll_box_btn);
			obj.appendChild(auto_scroll_box);
			return auto_scroll_box_btn;
		},
		//���ù�����
		_setbtnScroll: function(obj, content, srType, thick, fixed){
			var _this = this,
				_W = obj.clientWidth,
				_H = obj.clientHeight,
				_conW = content.offsetWidth,
				_conH = content.offsetHeight,
				_btnW = parseInt(_W*(_W/_conW)),
				_btnH = parseInt(_H*(_H/_conH));
				
			
			if(_btnH >= _H){
				xyLib.mx.css(content,{width:_W+'px'});
			}else{
				//����������
				var _scroll_btn = _this._createScroll(obj),
					_scroll_box = _scroll_btn.parentNode;
				
				//��������ť����
				if(!srType){
					if(thick < 6){
						thick = 6;
					}
					if(thick > 12){
						thick = 12;
					}
				}
				xyLib.mx.css(_scroll_btn,{height:_btnH+'px',width:thick+'px'});
				
				//���һ��
				if(srType){
					xyLib.mx.css(_scroll_box,{height:_H+'px',width:_scroll_btn.offsetWidth+'px'});
					if(fixed){
						xyLib.mx.css(content,{width:(_W - _scroll_btn.offsetWidth)+'px'});
						xyLib.mx.css(_scroll_box,{right: 0});
					}else{
						xyLib.mx.css(_scroll_box,{right: -_scroll_btn.offsetWidth+'px'});
						obj.onmouseover = function(){
							xyLib.mx.doMoveBuffer(_scroll_box,{right: 0},250);
						}
						obj.onmouseout = function(){
							xyLib.mx.doMoveBuffer(_scroll_box,{right: -_scroll_btn.offsetWidth},250);
						}
						
						xyLib.mx.css(content,{width:_W+'px'});
					}
				}else{ //����ϸ��
					xyLib.mx.css(_scroll_box,{height:_H+'px',width:_scroll_btn.offsetWidth-6+'px'});
					if(fixed){
						xyLib.mx.css(content,{width:(_W - _scroll_btn.offsetWidth)+'px'});
						xyLib.mx.css(_scroll_box,{right: 3+'px'});
						xyLib.mx.css(_scroll_btn,{right: -3+'px'});
					}else{
						xyLib.mx.css(_scroll_box,{right: -5+'px'});
						xyLib.mx.css(_scroll_btn,{right: -3+'px'});
						obj.onmouseover = function(){
							xyLib.mx.doMoveBuffer(_scroll_box,{right: 3},250);
						}
						obj.onmouseout = function(){
							xyLib.mx.doMoveBuffer(_scroll_box,{right: -5},250);
						}
						
						xyLib.mx.css(content,{width:_W+'px'});
					}
				}
				
				_this._mouseWheel(obj, content, _scroll_btn);
				_this._dragScroll(obj, content, _scroll_btn);
				_this._clickScroll(obj, content, _scroll_btn);
			}
		},
		_mouseWheel: function(obj, content, btn){
			var flag = 0,wheelFlag = 0;
			
			if(obj){
				xyLib.mouseWheel(obj, function(data){
					wheelFlag += data;
					if(obj._wheelDelta >= 0){
						flag = obj._wheelDelta;
						wheelFlag = obj._wheelDelta*12;
						obj._wheelDelta = -1;
					}else{
						flag = wheelFlag/12;
					}
					
					if(flag <= 0){
						flag = 0;
						wheelFlag = 0;
					}
					if(flag >= (obj.offsetHeight - btn.offsetHeight)){
						flag = (obj.offsetHeight - btn.offsetHeight);
						wheelFlag = (obj.clientHeight - btn.offsetHeight)*12;
					}
					//btn.style.top = flag + "px";
					//content.style.top = -flag*(content.offsetHeight/obj.offsetHeight) + "px";
					//��̬Ч��
					xyLib.mx.doMoveBuffer(btn,{top: flag});
					xyLib.mx.doMoveBuffer(content,{top: -flag * (content.offsetHeight/obj.offsetHeight)});
				});
			}
		},
		//�϶�������
		_dragScroll: function(obj, content, btn){
			var _H = obj.clientHeight;
			btn.onmousedown = function(event){
				var _scrollTop = btn.offsetTop;
				var evt = event||window.event;
				var top = evt.clientY;
				document.onmousemove = scrollGo;
				document.onmouseup = function(){
					this.onmousemove = null;
				}
				function scrollGo(event){
					//���ѡ������
					xyLib.clearTxt();
					
					var evt = event||window.event;
					var _top = evt.clientY;
					var _t = _top - top + _scrollTop;
					if(_t > (_H - btn.offsetHeight)){
						_t = _H - btn.offsetHeight;
					}
					if(_t <= 0){
						_t = 0;
					}
					btn.style.top = _t + "px";
					content.style.top = -_t * (content.offsetHeight/obj.offsetHeight)+"px";
					//_wheelDelta = _t;
					obj._wheelDelta = _t; //���������_wheelDelta = _t;�ڶ������ʵ���л��ͻ
				}
			}
			btn.onmouseover=function(){
				this.style.background = "#aaa"; 
			}
			btn.onmouseout=function(){
				this.style.background = "#ccc"; 
			}
		},
		//���������
		_clickScroll: function(obj, content, btn){
			var _p = btn.parentNode;
			_p.onclick = function(event){
				var evt = event || window.event,
					t = evt.target || evt.srcElement,
					sTop = (document.documentElement.scrollTop > 0) ? document.documentElement.scrollTop : document.body.scrollTop,
					top = obj.offsetTop,
					_top = evt.clientY + sTop - top -btn.offsetHeight/2;
				
				if(_top <= 0){
					_top = 0;
				}
				if(_top >= (obj.clientHeight - btn.offsetHeight)){
					_top = obj.clientHeight - btn.offsetHeight;
				}
				
				if(t != btn){
					//btn.style.top = _top + 'px';
					//content.style.top = -_top * (content.offsetHeight/obj.offsetHeight)+"px";
					//��̬Ч��
					xyLib.mx.doMoveBuffer(btn,{top: _top});
					xyLib.mx.doMoveBuffer(content,{top: -_top * (content.offsetHeight/obj.offsetHeight)});
					obj._wheelDelta = _top;
				}
			}
		}
	};
	return fx;
}();