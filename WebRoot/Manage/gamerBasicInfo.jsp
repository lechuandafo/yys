<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BD.*"%>
<%@ page import="vo.BD.*"%>
<!DOCTYPE html>
<html> <!--  lang="zh-cn" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="../css/pintuer.css">
<link rel="stylesheet" href="../css/admin.css">
<script src="../js/jquery.js"></script>
<script src="../js/pintuer.js"></script>
<script src="../js/edit.js"></script>
</head>
<body>

<form method="post" action="gamerBasicInfo.jsp" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        
        <li><font color="#00CC99">选择搜索项</font>
          <select id="choice" name="choice" class="input" onchange="" style="width:100px; line-height:17px; display:inline-block">
            <option value="0">选择</option>
            <option value="1">用户编号</option>
            <option value="2">大区编号</option>
            <option value="3">玩家昵称</option>
            <option value="4">注册日期</option>
          </select>
          &nbsp;&nbsp;
        </if>
        <li>
          <input type="text" id="keywords" name="keywords" placeholder="请输入搜索关键字" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    
    <table class="table table-hover text-center">
    
    <tr>
      
          
        <td colspan="7" style="text-align:left;padding-left:20px;">
        复杂查询：
          <select name="ishome" style="padding:5px 20px; border:1px solid #ddd;" onchange="changeishome(this)">
            <option value="">排名</option>
            <option value="1">1~10</option>
            <option value="0">11~20</option>
          </select>
           &nbsp;
          <select name="isvouch" style="padding:5px 20px; border:1px solid #ddd;" onchange="changeisvouch(this)">
            <option value="">推荐</option>
            <option value="1">是</option>
            <option value="0">否</option>
          </select>
           &nbsp;
          <select name="istop" style="padding:5px 20px; border:1px solid #ddd;" onchange="changeistop(this)">
            <option value="">置顶</option>
            <option value="1">是</option>
            <option value="0">否</option>
          </select>
          &nbsp;&nbsp;&nbsp;
          
          </td>
      </tr>
      
      
      
      
    <tr>
      <th width="70">用户ID</th>     
      <th width="92">区号</th>
      <th width="86">玩家昵称</th>
      <th width="87">玩家头像URL</th> 
      <th width="86">注册日期</th>
      <th width="86">所在工会编号</th>
      <th width="86">工会职务</th>
      <th width="86">斗技分</th>
      <th width="86">是否在线</th>
    </tr>
   
        <!--查询显示并提供删除链接，删除链接以URL的形式传递主码信息，故只需写相应的jsp调用dao和vo来删除 -->
		<!-- js和java通过表单进行数据传递 -->
	<%
		request.setCharacterEncoding("utf-8");
		String choice = request.getParameter("choice");//通过标签的name属性获取
		String keywords = request.getParameter("keywords");//通过标签的name属性获取
//System.out.println("gamer.jsp: choice="+choice+" keywords="+keywords);

		daoBDGamer dao = new daoBDGamer();
		ArrayList List = null;
		
		if(choice == null || choice.equals("0"))//第一次进入页面 ||未选择搜索项
			List = dao.qryGamer();
		else
			List = dao.searchGamer(Integer.valueOf(choice), keywords);  
        
        int i=0;      
        while(i<List.size())  
        { voBDGamer vo=(voBDGamer)List.get(i);
          i++;
     %> 
           <tr>
	         <td height="66"><%=vo.getUserNo()%> </td> 
	         <td><%=vo.getServiceNo()%> </td>
	         <td><%=vo.getGamerName()%> </td>
	         <td><%=vo.getImageURL()%> </td> 
             <td><%=vo.getRegistTime()%> </td> 
             <td><%=vo.getUnionNo()%> </td> 
             <!--输出工会名
			 	daoBEUnionInfo daoUnion = new daoBEUnionInfo();
				ArrayList ListUnion = daoUnion.qryUnionInfo();
				voBEUnionInfo voUnion = (voBEUnionInfo) ListUnion.get(0);
				
			  -->
             <td><%=vo.getUnionJob()%> </td> 
             <td><%=vo.getPvpGrade()%> </td> 
             <td><%=String.valueOf(vo.getStatus())%> </td> 
	         
		   </tr>    
     <%
        }
	 %>   
    
      
    </table>
  </div>
</form>
<script type="text/javascript">

//搜索
function changesearch(){
// 	var myselect = document.getElementById("choice");
// 	var index = myselect.selectedIndex;
// 	var keywords = document.getElementById("keywords").value;
// 	if(myselect.options[index].value == 1){
// 		alert(keywords);
// 	}
	if(document.getElementById("choice").value != 0 && document.getElementById("keywords").value == "") 
		alert("请输入搜索关键字！");
	else if(document.getElementById("choice").value == 0 && document.getElementById("keywords").value != "")
		alert("请选择搜索项！");
	else
		document.getElementById("listform").submit();
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>