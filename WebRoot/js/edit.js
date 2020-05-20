// JavaScript Document
$(function() {
//获取class为caname的元素
	$(".caname").click(function() {
		var td = $(this);
		var oldtxt = td.text();
		var input = $("<input type='text'value='" + oldtxt + "'/>");
		td.html(input);
		input.click(function() { return false; });
		//获取焦点
		input.trigger("focus");
		//文本框失去焦点后提交内容，重新变为文本
		input.blur(function() {
			var newtxt = $(this).val();
			//判断文本有没有修改
			if (newtxt != oldtxt) {
				if(confirm("是否确定修改？")){
					td.html(newtxt);
					
					
					//var tdList = td.parent().children().text(); //得到所有同胞元素  
					//tdList.css({"color":"red","border":"2px solid red"});
					//var rowLen = tdList.length; //得到行的长度，即列数
					
					var uptIndex = td.index();//得到当前td元素是tr当中的第几列
					var pkValue = td.parent().children("td").eq(0).text();//得到同胞元素中的第一个td元素的内容，即主码的值
					
					//alert(uptIndex);
					//alert(newtxt);
					$.ajax({ 
					    type: "POST", 
					    url: "../serv/OD/servODUpt?pkValue="+pkValue+"&uptIndex="+uptIndex+"&newValue="+newtxt,
					    cache: false, 			     
					    success: function(data) {  			     		
					    	if(data == "false") alert("修改失败！"); 
					    	else alert("修改成功！");
					    }, 
					    error: function(XMLHttpRequest, textStatus, errorThrown) { 
					     	alert("获取数据异常" );//
					    } 
				 	});
				}
				else{
					td.html(oldtxt);
				}
			}
			else
			{
				td.html(oldtxt);
			}
		});
	});
}); 