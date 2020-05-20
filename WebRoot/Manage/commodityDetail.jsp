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
    <title>商品详情</title>  
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
       <a class="button border-yellow" href="#add"><span class="icon-plus-square-o"></span> 添加商品详情</a>
  </div> 
  <table class="table table-hover text-center">
    <tr>
      <th width="70">物品ID</th>     
      <th width="92">商品ID</th> 
      <th width="92">数量</th>      
    </tr>
    <%
		daoBDCommodityDetail dao = new daoBDCommodityDetail();
		ArrayList List = dao.qryCommodityDetail();  
        int i=0;      
        while(i<List.size())  
        { voBDCommodityDetail vo=(voBDCommodityDetail)List.get(i);
          i++;
     %>
    	   <tr>
      		 <td class="caname"><%=vo.getProductNo()%> </td> 
	  		 <td class="caname"><%=vo.getCommodityNo()%> </td>
	  		 <td class="caname"><%=vo.getPcount()%> </td>      
             <td width="106">
             <div class="button-group">
                 <a class="button border-red" 
	             <%out.println("href=\"handler/delCommodityDetail.jsp?ProductNo="+vo.getProductNo()+"\"");%>
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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加商品详情</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="../serv/BD/servBDCommodityDetailIns">   
      <input type="hidden" name="id"  value="" />  
      <div class="form-group">
        <div class="label">
          <label>物品ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="productNo" value="" data-validate="required:请输入物品ID" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>商品ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="commodityNo" value="" data-validate="required:请输入商品ID" />         
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="pcount" value="" data-validate="required:请输入数量" />         
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