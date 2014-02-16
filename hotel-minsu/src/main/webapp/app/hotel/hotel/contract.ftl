<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript" src="<@context_module/>hotel.js"></script>
<script type="text/javascript" src="<@context/>app/ea/ea/ea.js"></script>
<#macro digui_rolegroup rolegroupNodes  flag >
	<#list rolegroupNodes as rolegroup>
	     <option value="${rolegroup.id}">	${flag} ${rolegroup.name?if_exists}</option> 
		  <#if !(rolegroup.getChildRolegroups()?size<1)> 
		      <@digui_rolegroup rolegroup.getChildRolegroups()?sort_by('sortNob'),flag+"&nbsp;&nbsp;&nbsp;" />	
		  </#if>
	</#list> 
</#macro>


<#include "macro_hotel.ftl">
	<table class="table table-condensed table-hover">
	<tr>
		<td valign=top width=30%>
		     <b>${rhs["organize"].name}</b>
		     <br><@inputextp "begindate", rhs["organize"].id,"Organize","1" />
			<@inputextp "enddate", rhs["organize"].id,"Organize" ,"1"/>
			
			<br><@inputextp "enumber", rhs["organize"].id ,"Organize" />
			<@inputextp "wnumber", rhs["organize"].id,"Organize" />
			
			<br><@inputextp "eprice", rhs["organize"].id,"Organize" />
			<@inputextp "wprice", rhs["organize"].id ,"Organize"/>
			
			<br><@inputextp "price", rhs["organize"].id,"Organize" />
			<@inputextp "nprice", rhs["organize"].id ,"Organize"/>
			
			
			
		</td>
		
</table>
<span id="div_action_result" style="display:none"></span>
