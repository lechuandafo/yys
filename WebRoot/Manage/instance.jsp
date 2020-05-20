<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>
<%@ page import="dao.BE.*"%>
<%@ page import="vo.BE.*"%>

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
  <a class="button border-yellow" href="#add"><span class="icon-plus-square-o"></span> 添加副本信息</a>
  </div> 
  <table class="table table-hover text-center">
    <tr>
      <th width="70">副本ID</th>     
      <th width="92">回合数</th>
      <th width="87">副本队伍编号</th>  
      <th width="86">地图ID</th>
      <th width="86">式神编号1</th>
      <th width="86">式神等级1</th>
      <th width="86">式神编号2</th>
      <th width="86">式神等级2</th>
      <th width="86">式神编号3</th>
      <th width="86">式神等级3</th>      
      
    </tr>
   <%
		daoBEInstance dao = new daoBEInstance();
		ArrayList List = dao.qryInstance();  
        int i=0;      
        while(i<List.size())  
        { voBEInstance vo=(voBEInstance)List.get(i);
          i++;
     %> 
    	   <tr>
      		 <td class="caname"><%=vo.getInstanceNo()%> </td>       
      		 <td class="caname"><%=vo.getRoundTime()%> </td>  
     		 <td class="caname"><%=vo.getsGroupNo()%> </td>
      		 <td class="caname"><%=vo.getMapNo()%> </td>
      		 <td class="caname"><%=vo.getShikigamiNo1()%> </td>
     		 <td class="caname"><%=vo.getSlevel1()%> </td>
     		 <td class="caname"><%=vo.getShikigamiNo2()%> </td>
     		 <td class="caname"><%=vo.getSlevel2()%> </td>
     		 <td class="caname"><%=vo.getShikigamiNo3()%> </td>
     		 <td class="caname"><%=vo.getSlevel3()%> </td>
     		 <td width="106">
     		 <div class="button-group">
         		 <a class="button border-red" 
	      		 <%out.println("href=\"handler/delInstance.jsp?instanceNo="+vo.getInstanceNo()+"\"");%> 
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
		return true;
	}
	else{ 
		return false;
		}
}
</script>
<div id="add" class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加副本信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="../serv/BE/servBEInstanceIns">   
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
          <input type="text" class="input w50" name="sGroupNo" value="" data-validate="required:请输入副本队伍编号" />         
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
          <label>式神编号1：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="shikigamiNo1" value="" data-validate="required:请输入式神编号1" />         
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
          <label>式神编号2：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="shikigamiNo2" value="" data-validate="required:请输入式神编号2" />         
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
          <label>式神编号3：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="shikigamiNo3" value="" data-validate="required:请输入式神编号3" />         
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

