<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <% --%>
<%-- String path = request.getContextPath(); --%>
<%-- String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; --%>
<%-- %> --%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.BE.*"%>
<%@ page import="vo.BE.*"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>主角管理</title>  
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>
    <script src="../js/edit.js" charset="utf-8"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
  <div class="padding border-bottom">  
  <a class="button border-yellow" href="#add"><span class="icon-plus-square-o"></span> 添加主角</a>
  </div> 
  <table class="table table-hover text-center">
    <tr>
      <th width="70">主角ID</th>     
      <th width="92">主角名</th>
      <th width="87">图片URL</th>  
      <th width="86">攻击</th>
      <th width="60">攻击成长</th>
      <th width="86">生命</th>
      <th width="60">生命成长</th>
      <th width="86">防御</th>
      <th width="60">防御成长</th>
      <th width="86">速度</th>
      <th width="86">暴击</th>
      <th width="86">暴击伤害</th>      
      <th width="145">传记</th>
      
    </tr>
   <%
		daoBELeader dao = new daoBELeader();
		ArrayList List = dao.qryLeader();  
        int i=0;      
        while(i<List.size())  
        { voBELeader vo=(voBELeader)List.get(i);
          i++;
     %> 
           <tr>
	         <td class="caname"><%=vo.getLeaderNo()%> </td> 
	         <td class="caname"><%=vo.getLeaderName()%> </td> 
	         <td class="caname"><%=vo.getLeaderURL()%> </td>
	         <td class="caname"><%=vo.getLeaderCreateAttack()%> </td>
	         <td class="caname"><%=vo.getLeaderDevelopAttack()%> </td>
	         <td class="caname"><%=vo.getLeaderCreateLife()%> </td>
	         <td class="caname"><%=vo.getLeaderDevelopLife()%> </td>
	         <td class="caname"><%=vo.getLeaderCreateDefence()%> </td>
	         <td class="caname"><%=vo.getLeaderDevelopDefence()%> </td>
	         <td class="caname"><%=vo.getLeaderCreateSpeed()%> </td>
	         <td class="caname"><%=vo.getLeaderCreateCrit()%> </td>
	         <td class="caname"><%=vo.getLeaderCreateCriticalDamage()%> </td>
	         <td class="caname"><%=vo.getBiography()%> </td>
	         <td width="106">
      		 <div class="button-group">
	      		 <a class="button border-red" 
	      		 <%out.println("href=\"handler/delLeader.jsp?leaderNo="+vo.getLeaderNo()+"\"");%> 
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
	else {
	return false;
	}
}
</script>
<div id="add" class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加主角</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="../serv/BE/servBELeaderIns">   
      <input type="hidden" name="id"  value="" />  
      <div class="form-group">
        <div class="label">
          <label>主角ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="ID" value="" data-validate="required:请输入ID" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>主角名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="name" value="" data-validate="required:请输入主角名" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>主角图片URL：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="URL" value="" data-validate="required:请输入" />         
          <div class="tips"></div>
        </div>
      </div>
     
      
       <div class="form-group">
        <div class="label">
          <label>攻击：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="attack" value="" />         
          <div class="tips"></div>
        </div>
        
        <div class="label">
          <label>攻击成长：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="attack_percent" value="" />         
          <div class="tips"></div>
        </div>
      </div>       
      <div class="form-group">
        <div class="label">
          <label>生命：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="life" value="" /> 
          <div class="tips"></div>        
        </div>
        <div class="label">
          <label>生命成长：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="life_percent" value="" />         
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>防御：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="defense" value=""/>   
          <div class="tips"></div>      
        </div>
        <div class="label">
          <label>防御成长：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="defense_percent" value="" />         
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>速度：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="speed" value=""/>
          <div class="tips"></div>
        </div>
     </div>
    
     <div class="form-group">
        <div class="label">
          <label>暴击：</label>
        </div>
		<div class="field">
          <input type="text" class="input w50" name="critical_attack" value=""/>
          <div class="tips"></div>
        </div>
        
     </div>
      <div class="form-group">
        <div class="label">
          <label>暴击伤害：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="critical_damage" value="" />       
          <div class="tips"></div>
        </div>
       
      </div>  
      <div class="form-group">
        <div class="label">
          <label>传记：</label>
        </div>
        <div class="field">
          <textarea type="text" class="input" name="biography" style="height:100px;" ></textarea>
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
