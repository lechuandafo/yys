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
    <title></title>  
    <link rel="stylesheet" href="../css/pintuer.css">
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="../css/youtiy.css" media="all">
    <script src="../js/jquery.js"></script>
    <script src="../js/pintuer.js"></script>  
    
    <script> 
	jQuery(document).ready(function($) {
		$('.theme-reply').click(function(){
			$('.theme-popover-mask').fadeIn(100);
			$('.theme-popover').slideDown(200);
			
			var button = $(this);
			var leaveMessageNo = button.parent().parent().siblings("td").eq(0).text();//获取所回复的留言的编号
			$("#leaveMessageNo").attr("value",leaveMessageNo);
			//alert(leaveMessageNo);  
		})
		$('.theme-poptit .close').click(function(){
			$('.theme-popover-mask').fadeOut(100);
			$('.theme-popover').slideUp(200);
		})
 
	})
	</script>
</head>
<body>

<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 留言管理</strong></div>
  <div class="padding border-bottom">
    <ul class="search">
      <li>
        <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
        <button type="submit" class="button border-red"><span class="icon-trash-o"></span> 批量删除</button>
      </li>
    </ul>
  </div>
  <table class="table table-hover text-center">
    <tr>
      <th width="120">留言ID</th>
      <th width="120">用户ID</th> 
      <th width="120">留言内容</th>
      <th width="120">留言时间</th>
      <th width="120">回复内容</th> 
        
    </tr>      
    <%
		daoBDLeaveMessage daoLM = new daoBDLeaveMessage();
		daoBDReply daoR = new daoBDReply();
		ArrayList LMList = daoLM.qryLeaveMessage();  
        for(int i=0; i<LMList.size(); i++)  
        { 
          	voBDLeaveMessage voLM = (voBDLeaveMessage)LMList.get(i);
          	ArrayList RList = daoR.qryReplyByLeaveMessageNo(voLM.getLeaveMessageNo());
          	String allReplyContent = ""; 
          	for(int j=0; j<RList.size(); j++)
          	{
	          	voBDReply voR = (voBDReply)RList.get(j);
	          	allReplyContent = allReplyContent + voR.getAdministratorNo() + ": ";//回复内容前加上相应管理员编号
          		allReplyContent = allReplyContent + voR.getReplyContent() + "<br>";
          	} 
          
     %> 
		    <tr>
		    <td class="caname"><%=voLM.getLeaveMessageNo()%></td>      
		    <td class="caname"><%=voLM.getUserNo()%></td>  
		    <td class="caname"><%=voLM.getLeaveMessageContent()%></td>
		    <td class="caname"><%=voLM.getLeaveMessageDate()%></td>
		    <td class="caname"><%=allReplyContent%></td>  
		    <td width="106">
		    <div class="button-group">      
				<a class="button border-green theme-reply" href="javascript:;"><span class="icon-plus-square-o"></span> 回复</a>
			</div>
		    </td>
		  	</tr> 
  	<%
        }
	 %>  
  
    <tr>
      <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
    </tr>
  </table>
</div>
<!-- 回复表单  -->
<div class="theme-popover">
     <div class="theme-poptit">
	      回复内容
     <a href="javascript:;" title="关闭" class="close"></a>
     </div>
     <div class="theme-popbod dform">
           <form class="theme-signin" id="replyform" name="replyform" action="../serv/BD/servBDReplyIns" method="post">
           <ol> 
           <!--
           		<input type="hidden" id="replyNo" name="replyNo" value="">
           		<input type="hidden" id="adminNo" name="adminNo" value="">
           	-->
           		<input type="hidden" id="leaveMessageNo" name="leaveMessageNo" value="">
           	<!-- 
           			<input type="hidden" id="replyDate" name="replyDate" value="">
           	-->
		        <li><textarea id="replyContent" name="replyContent" rows="10" cols="50"></textarea></li>                             					 
		        <li><input class="btn btn-primary" type="submit" name="submit" value=" 提交 " onclick="getReplyInfo()" /></li>  
		   </ol>              
           </form>
     </div>
</div>
<div class="theme-popover-mask"></div>


<script type="text/javascript">



function del(id){
	if(confirm("您确定要删除吗?")){
		
	}
}

$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false; 		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

</script>
</body></html>