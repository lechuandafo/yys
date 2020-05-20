<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BE.*"%>
<%@ page import="vo.BE.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html> <!--  lang="zh-cn" -->
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
        <li> <a class="button border-main icon-plus-square-o" href="#add"> 添加物品</a> </li>
        <li>搜索：</li>
        <li>选择搜索项
          <select name="s_ishome" class="input" onchange="changesearch()" style="width:100px; line-height:17px; display:inline-block">
            <option value="">选择</option>
            <option value="1">物品ID</option>
            <option value="0">物品名</option>
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
      <th width="70">物品ID</th>     
      <th width="92">物品名</th>      
      <th width="145">物品详情</th>
      
    </tr>
   
    <%
		daoBEProductInfo dao = new daoBEProductInfo();
		ArrayList List = dao.qryProductInfo();  
        int i=0;      
        while(i<List.size())  
        { voBEProductInfo vo=(voBEProductInfo)List.get(i);
          i++;
     %> 
           <tr>
	         <td class="caname"><%=vo.getProductNo()%> </td> 
	         <td class="caname"><%=vo.getProductName()%> </td> 
	         <td class="caname"><%=vo.getProductDescription()%> </td>
	         <td width="106">
      		 <div class="button-group">
	      		 <a class="button border-red" 
	      		 <%out.println("href=\"handler/delProductInfo.jsp?productNo="+vo.getProductNo()+"\"");%> 
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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加物品</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="../serv/BE/servBEProductInfoIns">   
      <input type="hidden" name="id"  value="" />  
      <div class="form-group">
        <div class="label">
          <label>物品ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="productNo" value="" data-validate="required:请输入标题" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>物品名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="productName" value="" data-validate="required:请输入标题" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>物品详情：</label>
        </div>
        <div class="field">
          <textarea type="text" class="input" name="productDescription" style="height:100px;" ></textarea>
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