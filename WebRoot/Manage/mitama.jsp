<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
    <title>御魂管理</title>  
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
  <a class="button border-yellow" href="#add"><span class="icon-plus-square-o"></span> 添加御魂</a>
  </div> 
  <table class="table table-hover text-center">
    <tr>
      <th width="70">御魂ID</th>     
      <th width="92">御魂名</th>
      <th width="87">图片URL</th>  
      <th width="86">攻击/成长百分比</th>
      <th width="86">生命/成长百分比</th>
      <th width="86">防御/成长百分比</th>
      <th width="86">速度/成长百分比</th>
      <th width="86">暴击/成长百分比</th>
      <th width="86">暴击伤害/成长百分比</th> 
      <th width="86">效果命中/成长百分比</th>
      <th width="86">效果抵抗/成长百分比</th> 
      <th width="86">套装属性</th> 
      
      
    </tr>
   <%
		daoBEMitama dao = new daoBEMitama();
		ArrayList List = dao.qryMitama();  
        int i=0;      
        while(i<List.size())  
        { voBEMitama vo=(voBEMitama)List.get(i);
          i++;
     %> 
           <tr>
	         <td class="caname"><%=vo.getMitamaNo()%> </td> 
	         <td class="caname"><%=vo.getMitamaName()%> </td> 
	         <td class="caname"><%=vo.getMitamaURL()%> </td>
	         <td class="caname"><%=vo.getCreateAttack()+"/"+vo.getDevelopAttack()%> </td>
	         <td class="caname"><%=vo.getCreateLife()+"/"+vo.getDevelopLife()%> </td>
	         <td class="caname"><%=vo.getCreateDefence()+"/"+vo.getDevelopDefence()%> </td>
	         <td class="caname"><%=vo.getCreateSpeed()+"/"+vo.getDevelopSpeed()%> </td>
	         <td class="caname"><%=vo.getCreateCrit()+"/"+vo.getDevelopCrit()%> </td>
	         <td class="caname"><%=vo.getCreateCriticalDamage()+"/"+vo.getDevelopCriticalDamage()%> </td>
	         <td class="caname"><%=vo.getCreateBlocking()+"/"+vo.getDevelopBlocking()%> </td>
	         <td class="caname"><%=vo.getCreateResistance()+"/"+vo.getDevelopResistance()%> </td>
	         <td class="caname"><%=vo.getSuitNature()%> </td>
	         <td width="106">
      		 <div class="button-group">
	      		 <a class="button border-red" 
	      		 <%out.println("href=\"handler/delMitama.jsp?mitamaNo="+vo.getMitamaNo()+"\"");%> 
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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加御魂</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="../serv/BE/servBEMitamaIns">   
      <input type="hidden" name="id"  value="" />  
      <div class="form-group">
        <div class="label">
          <label>御魂ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="ID" value="" data-validate="required:请输入" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>御魂名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="name" value="" data-validate="required:请输入" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>御魂图片URL：</label>
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
          <label>成长百分比：</label>
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
          <label>成长百分比：</label>
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
          <label>成长百分比：</label>
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
        <div class="label">
          <label>成长百分比：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="speed_percent" value="" />         
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
        <div class="label">
          <label>成长百分比：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="critical_attack_percent" value="" />         
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
        <div class="label">
          <label>成长百分比：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="critical_damage_percent" value="" />         
          <div class="tips"></div>
        </div>
      </div>
       
      <div class="form-group">
        <div class="label">
          <label>效果命中：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="blocking" value="" />       
          <div class="tips"></div>
        </div>
        <div class="label">
          <label>成长百分比：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="blocking_percent" value="" />         
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>效果抵抗：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="resistance" value="" />       
          <div class="tips"></div>
        </div>
        <div class="label">
          <label>成长百分比：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="resistance_percent" value="" />         
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>套装属性：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="suitnature" value="" />       
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