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
    <title>副本队伍管理</title>  
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
       <a class="button border-yellow" href="#add"><span class="icon-plus-square-o"></span> 添加副本队伍</a>
  </div> 
  <table class="table table-hover text-center">
    <tr>
      <th width="92">副本队伍ID</th>     
      <th width="92">式神ID1</th>  
      <th width="92">式神等级1</th>      
      <th width="92">式神ID2</th>  
      <th width="92">式神等级2</th>  
      <th width="92">式神ID3</th>  
      <th width="92">式神等级3</th>  
    </tr>
    <%
		daoBDSGroup dao = new daoBDSGroup();
		ArrayList List = dao.qrySGroup();  
        int i=0;      
        while(i<List.size())  
        { voBDSGroup vo=(voBDSGroup)List.get(i);
          i++;
     %>
    	   <tr>
      		 <td class="caname"><%=vo.getSGroupNo()%> </td> 
	  		 <td class="caname"><%=vo.getShikigamiNo1()%> </td>
	  		 <td class="caname"><%=vo.getSlevel1()%> </td>
	  		 <td class="caname"><%=vo.getShikigamiNo2()%> </td>
	  		 <td class="caname"><%=vo.getSlevel2()%> </td>
	  		 <td class="caname"><%=vo.getShikigamiNo3()%> </td>
	  		 <td class="caname"><%=vo.getSlevel3()%> </td>      
             <td width="106">
             <div class="button-group">
                 <a class="button border-red" 
	             <%out.println("href=\"handler/delSGroup.jsp?SGroupNo="+vo.getSGroupNo()+"\"");%>
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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加地图</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="../serv/BD/servBDSGroupIns">   
      <input type="hidden" name="id"  value="" />  
      <div class="form-group">
        <div class="label">
          <label>副本队伍ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="SGroupNo" value="" data-validate="required:请输入副本队伍ID" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>式神ID1：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="shikigamiNo1" value="" data-validate="required:请输入式神ID1" />         
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>式神等级1：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="slevel1" value="" data-validate="required:请输入式神等级1" />         
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>式神编号ID2：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="shikigamiNo2" value="" data-validate="required:请输入式神ID2" />         
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>式神等级2：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="slevel2" value="" data-validate="required:请输入式神等级2" />         
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>式神ID3：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="shikigamiNo3" value="" data-validate="required:请输入式神ID3" />         
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>式神等级3：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="slevel3" value="" data-validate="required:请输入式神等级3" />         
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