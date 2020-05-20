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
    <title>式神管理</title>  
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
  <a class="button border-yellow" href="#add"><span class="icon-plus-square-o"></span> 添加式神</a>
  </div> 
  <table class="table table-hover text-center">
    <tr>
      <th width="70">式神ID</th>     
      <th width="92">式神名</th>
      <th width="87">图片URL</th> 
      <th width="87">稀有度</th>
      <th width="86">攻击/成长</th>
      <th width="86">生命/成长</th>
      <th width="86">防御/成长</th>
      <th width="86">速度</th>
      <th width="86">暴击</th>
      <th width="86">暴击伤害</th>      
      <th width="145">传记</th>
      
    </tr>
   
    <%
		daoBEShikigami dao = new daoBEShikigami();
		ArrayList List = dao.qryShikigami();  
        int i=0;      
        while(i<List.size())  
        { voBEShikigami vo=(voBEShikigami)List.get(i);
          i++;
     %> 
           <tr>
	         <td class="caname"><%=vo.getShikigamiNo()%> </td> 
	         <td class="caname"><%=vo.getShikigamiName()%> </td> 
	         <td class="caname"><%=vo.getShikigamiURL()%> </td>
	         <td class="caname"><%=vo.getShikigamiXYD()%> </td>
	         <td class="caname"><%=vo.getAttack()+"/"+vo.getDevelopAttack()%> </td>
	         <td class="caname"><%=vo.getLife()+"/"+vo.getDevelopLife()%> </td>
	         <td class="caname"><%=vo.getDefence()+"/"+vo.getDevelopDefence()%> </td>
	         <td class="caname"><%=vo.getSpeed()%> </td>
	         <td class="caname"><%=vo.getCrit()%> </td>
	         <td class="caname"><%=vo.getCriticalDamage()%> </td>
	         <td class="caname"><%=vo.getBiography()%> </td>
	         <td width="106">
      		 <div class="button-group">
	      		 <a class="button border-red" 
	      		 <%out.println("href=\"handler/delShikigami.jsp?shikigamiNo="+vo.getShikigamiNo()+"\"");%> 
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
		
	}
}
</script>
<div id="add" class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加式神</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="../serv/BE/servBEShikigamiIns">   
      <input type="hidden" name="id"  value="" />  
      <div class="form-group">
        <div class="label">
          <label>式神ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="ID" value="" data-validate="required:请输入标题" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>式神名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="name" value="" data-validate="required:请输入标题" />         
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>式神图片URL：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="URL" value="" data-validate="required:请输入标题" />         
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>稀有度：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="XYD" value="" data-validate="required:请输入标题" />         
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
          <label>成长：</label>
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
          <label>成长：</label>
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
          <label>成长：</label>
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