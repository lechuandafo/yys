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
        <li> <a class="button border-main icon-plus-square-o" href="#add"> 添加商品</a> </li>
        <li>搜索：</li>
        <li>选择搜索项
          <select name="s_ishome" class="input" onchange="changesearch()" style="width:100px; line-height:17px; display:inline-block">
            <option value="">选择</option>
            <option value="1">商品ID</option>
            <option value="0">商品名</option>
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
      <th width="70">商品ID</th>     
      <th width="92">商品名</th>      
      <th width="145">总价</th>
      
    </tr>
   <!--查询显示并提供删除链接，删除链接以URL的形式传递主码信息，故只需写相应的jsp调用dao和vo来删除 -->
	<%
		daoBECommodityInfo dao = new daoBECommodityInfo();
		ArrayList List = dao.qryCommodityInfo();  
        int i=0;      
        System.out.println("commodity.jsp: "+List.size());
        while(i<List.size())  
        { voBECommodityInfo vo=(voBECommodityInfo)List.get(i);
          i++;
     %> 
           <tr>
	         <td class="caname"><%=vo.getCommodityNo()%> </td> 
	         <td class="caname"><%=vo.getCommodityName()%> </td> 
	         <td class="caname"><%=vo.getPrice()%> </td>
	         <td width="106">
      		 <div class="button-group">
	      		 <a class="button border-red" 
	      		 <%out.println("href=\"handler/delCommodityInfo.jsp?commodityNo="+vo.getCommodityNo()+"\"");%> 
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
		//window.location="removeCommodity.jsp?CommodityID="+CommodityID;
		return true;
	}
	else 
		return false;
}
</script>
<div id="add" class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加商品</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="../serv/BE/servBECommodityInfoIns">   
      <input type="hidden" name="id"  value="" />  
      <div class="form-group">
        <div class="label">
          <label>商品ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="commodityNo" value="" data-validate="required:请输入标题" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>商品名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="commodityName" value="" data-validate="required:请输入标题" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>总价：</label>
        </div>
        <div class="field">
          <textarea type="text" class="input" name="price" style="height:100px;" ></textarea>
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