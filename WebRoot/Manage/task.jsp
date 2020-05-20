<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BE.*"%>
<%@ page import="vo.BE.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>网站信息</title>  
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>
    <script src="../js/edit.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
  <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="#add"> 添加任务</a> </li>
        <li>搜索：</li>
        <li>选择搜索项
          <select name="s_ishome" class="input" onchange="changesearch()" style="width:100px; line-height:17px; display:inline-block">
            <option value="">选择</option>
            <option value="1">任务ID</option>
            <option value="0">任务名</option>
          </select>
          </li>
        </if>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>  
  <table class="table table-hover text-center">
    <tr>
      <th width="70">任务ID</th>     
      <th width="92">任务名</th>
      <th width="87">任务描述</th>  
      <th width="86">数量</th>
      
    </tr>
  <!--查询显示并提供删除链接，删除链接以URL的形式传递主码信息，故只需写相应的jsp调用dao和vo来删除 -->
	<%
		daoBETaskInfo dao = new daoBETaskInfo();
		ArrayList List = dao.qryTaskInfo();  
        int i=0;      
        while(i<List.size())  
        { voBETaskInfo vo=(voBETaskInfo)List.get(i);
          i++;
     %> 
           <tr>
	         <td class="caname"><%=vo.getTaskNo()%> </td> 
	         <td class="caname"><%=vo.getTaskName()%> </td> 
	         <td class="caname"><%=vo.getTaskDescription()%> </td>
	         <td class="caname"><%=vo.getQuate()%> </td> 
	         <td width="106">
      		 <div class="button-group">
	      		 <a class="button border-red" 
	      		 <%out.println("href=\"handler/delTaskInfo.jsp?taskNo="+vo.getTaskNo()+"\"");%> 
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
function del(){
	if(confirm("您确定要删除吗?")){
		//window.location="removeService.jsp?serviceID="+serviceID;
		return true;
	}
	else 
		return false;
}
</script>
<div id="add" class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加任务</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="../serv/BE/servBETaskInfoIns">   
      <input type="hidden" name="id"  value="" />  
      <div class="form-group">
        <div class="label">
          <label>任务ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="taskNo" value="" data-validate="required:请输入标题" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>任务名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="taskName" value="" data-validate="required:请输入标题" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>任务描述：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="taskDescription" value="" data-validate="required:请输入标题" />         
          <div class="tips"></div>
        </div>
      </div>
      
      
       <div class="form-group">
        <div class="label">
          <label>数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="quate" value="" />         
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