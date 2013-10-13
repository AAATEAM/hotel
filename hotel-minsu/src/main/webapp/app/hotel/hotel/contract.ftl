<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript" src="<@context_module/>hotel.js"></script>


<#include "macro_hotel.ftl">
	<table class="table table-condensed table-hover">
	<tr>
		<td valign=top width=30%>
		     <b>${rhs["organize"].name}</b>
			<br><@inputextp "enumber", rhs["organize"].id ,"Organize" />
			<br><@inputextp "wnumber", rhs["organize"].id,"Organize" />
			<br><@inputextp "begindate", rhs["organize"].id,"Organize","1" />
			<br><@inputextp "enddate", rhs["organize"].id,"Organize" ,"1"/>
			<br><@inputextp "price", rhs["organize"].id,"Organize" />
			<br><@inputextp "eprice", rhs["organize"].id,"Organize" />
			<br><@inputextp "wprice", rhs["organize"].id ,"Organize"/>
			<br><@inputextp "nprice", rhs["organize"].id ,"Organize"/>
			
		</td>
		<td valign=top  width=20%>
			<b>住宿人员</b>
			<br>
			<#list rhs["organize"].getRoles() as role>
				[${role.name?if_exists}]
				<br>
				<a   onclick="document.getElementById('div_add_new_user').style.display ='';document.getElementById('organize_id').value ='${rhs["organize"].id}';document.getElementById('role_id').value ='${role.id}'" >登记新用户</a>
				<a   onclick="document.getElementById('div_add_new_user').style.display ='none';ajax_role_user_list('${role.id}','${rhs["organize"].id}');" >设置用户</a>
				 <#---
				 <a   onclick="document.getElementById('div_add_new_user').style.display ='';document.getElementById('role_id').value=${role.id?if_exists};" >登记新用户</a>
				 $('#div_action_result',window.parent.parent.frames['topFrame'].document).html(document.getElementById('div_action_result').innerHTML);
				 -->
				<br>
				 <#list role.getUsers() as u>
		           ${u.name}&nbsp;&nbsp 
		         </#list>
			</#list> 
		</td>		
		<td valign=top width=70%>
		<div id=div_user_select> </div>
	    <div id=div_add_new_user style="display:none">
		    <b> 新用户身份登记 </b> 
				<br>姓名 <input id=name value="" style="WIDTH: 120px"   />
				           拼音 <input id=account value="" style="WIDTH: 120px"   />
		        <br>身份证 <input   value="" style="WIDTH: 120px"   /> 
		                                        手机号码      <input  value="" style="WIDTH: 120px"   /> 
		        <br>邮箱    <input  value="" style="WIDTH: 120px"   />
		              QQ<input  value="" style="WIDTH: 120px"   />
		      <input id=organize_id name=id type=hidden value=""/>
		            <br>   <input id=role_id  type=hidden   value=""/>
		  
		   	<button class="btn  btn-mini" onclick="javascript:ajax_add_new_user()"">新增</button>
		   	<#--
		   	<a class="btn  btn-mini" onclick="window.location.reload();">关闭</a>
		   	-->
	   </div>


	 	</td>
		
	</tr>
	<tr><td  colspan=3 >
	</td></tr>
</table>
<span id="div_action_result" style="display:none"></span>
