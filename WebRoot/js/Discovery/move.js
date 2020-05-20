var pa = {left: $("#a").position().left + $("#a").width(), top: $("#a").position().top};//A点位置 
var pb = {left: $("#b").position().left + $("#b").width(), top: $("#b").position().top};//B点位置 
var pc = {left: $("#c").position().left + $("#c").width(), top: $("#c").position().top};//C点位置 
var pd = {left: $("#d").position().left + $("#d").width(), top: $("#d").position().top};//D点位置 
var pe = {left: $("#e").position().left + $("#e").width(), top: $("#e").position().top};//E点位置 
var pf = {left: $("#f").position().left + $("#f").width(), top: $("#f").position().top};//F点位置 
var pg = {left: $("#g").position().left + $("#g").width(), top: $("#g").position().top};//G点位置 
var ph = {left: $("#h").position().left + $("#h").width(), top: $("#h").position().top};//H点位置 
var pi = {left: $("#i").position().left + $("#i").width(), top: $("#i").position().top};//I点位置 

$("#pep").css({left: pa.left, top: pa.top});//初始将OK放在A点 

$("#unit1").click(function() {//点击第1章移动到B点 
	$("#pep").fadeIn().animate({ 
		left: pb.left, 
		top: pb.top 
	}, 2000);
	setTimeout(function(){//设置两秒后打开模态框
		$('#Modal_ts1').modal({
        show:true,
        backdrop:true
        }) ;
	},2000);	   
}); 

$("#unit2").click(function() {//点击第2章按移动到C点 
$("#pep").fadeIn().animate({ 
left: pc.left, 
top: pc.top 
}, 2000); 
	setTimeout(function(){
		$('#Modal_ts2').modal({
        show:true,
        backdrop:true
        }) ;
	},2000);	
});

$("#unit3").click(function() {//点击第3章按移动到d点 
$("#pep").fadeIn().animate({ 
left: pd.left, 
top: pd.top 
}, 2000); 
	setTimeout(function(){
		$('#Modal_ts3').modal({
        show:true,
        backdrop:true
        }) ;
	},2000);	
});

$("#unit4").click(function() {//点击第4章按移动到g点 
$("#pep").fadeIn().animate({ 
left: pg.left, 
top: pg.top 
}, 2000); 
	setTimeout(function(){
		$('#Modal_ts4').modal({
        show:true,
        backdrop:true
        }) ;
	},2000);	
});

$("#unit5").click(function() {//点击第5章按移动到i点 
$("#pep").fadeIn().animate({ 
left: pi.left, 
top: pi.top 
}, 2000); 
	setTimeout(function(){
		$('#Modal_ts5').modal({
        show:true,
        backdrop:true
        }) ;
	},2000);	
});

$("#unit6").click(function() {//点击第6章按移动到f点 
$("#pep").fadeIn().animate({ 
left: pf.left, 
top: pf.top 
}, 2000); 
	setTimeout(function(){
		$('#Modal_ts6').modal({
        show:true,
        backdrop:true
        }) ;
	},2000);	
});

$("#unit7").click(function() {//点击第7章按移动到h点 
$("#pep").fadeIn().animate({ 
left: ph.left, 
top: ph.top 
}, 2000); 
	setTimeout(function(){
		$('#Modal_ts7').modal({
        show:true,
        backdrop:true
        }) ;
	},2000);	
});

$("#unit8").click(function() {//点击第8章按移动到e点 
$("#pep").fadeIn().animate({ 
left: pe.left, 
top: pe.top 
}, 2000); 
	setTimeout(function(){
		$('#Modal_ts8').modal({
        show:true,
        backdrop:true
        }) ;
	},2000);	
});