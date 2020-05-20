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
    <title>副本出战管理</title>  
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>
    <script src="../js/edit.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder">内容列表</strong></div>
  <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
       <a class="button border-yellow" href="#add"><span class="icon-plus-square-o"></span>添加副本出战信息</a>
  </div> 
  <table class="table table-hover text-center">
    <tr>
      <th width="70">副本ID</th>     
      <th width="92">回合数</th> 
      <th width="92">副本队伍编号</th>      
      <th width="92">地图编号</th> 
    </tr>
    <%
		daoBDInstanceFight dao = new daoBDInstanceFight();
		ArrayList List = dao.qryInstanceFight();  
        int i=0;      
        while(i<List.size())  
        { voBDInstanceFight vo=(voBDInstanceFight)List.get(i);
          i++;
     %>
    	   <tr>
      		 <td class="caname"><%=vo.getInstanceNo()%> </td> 
	  		 <td class="caname"><%=vo.getRoundTime()%> </td>
	  		 <td class="caname"><%=vo.getSGroupNo()%> </td>
	  		 <td class="caname"><%=vo.getMapNo()%> </td>      
             <td width="106">
             <div class="button-group">
                 <a class="button border-red" 
	             <%out.println("href=\"handler/delInstanceFight.jsp?InstanceNo="+vo.getInstanceNo()+"\"");%>
	             onclick="return del()"><span class="icon-trash-o"></span> 删除</a>
             </div>
             </td>
            </tr> 
     <%
        }
	 %>   
   
  </table>
</div>
<script>
function del(id){
	if(confirm("您确定要删除吗?")){
		return true;
	}
	else 
		return false;
}
</script>
<div id="add" class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加副本出战信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="../serv/BD/servBDInstanceFightIns">   
      <input type="hidden" name="id"  value="" />  
      <div class="form-group">
        <div class="label">
          <label>副本ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="instanceNo" value="" data-validate="required:请输入副本ID" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>回合数：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="roundTime" value="" data-validate="required:请输入回合数" />         
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>副本队伍编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="sGroupNo" value="" data-validate="required:请输入副本队伍ID" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>地图ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="mapNo" value="" data-validate="required:请输入地图ID" />         
          <div class="tips"></div>
        </div>
      </div>   
     <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>