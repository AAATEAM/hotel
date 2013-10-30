<#include "../../../common/freemarker/include_header.ftl">
<#include "macro_hotel.ftl">
<script type="text/javascript" src="<@context/>app/ea/organize/organize.js"></script>
<script type="text/javascript" src="<@context_module/>hotel.js"></script>

<#macro digui_orgnaize treeNodes  flag >
	<#list treeNodes?sort_by("name") as organize>
		<tr>
		    <td>${flag}<b>${organize.name}</b>
		        <#if organize.allUser()?size gt 0 > 
				
	                   <@vextp "begindate", organize.id /> ~ <@vextp "enddate", organize.id /> 
				       
				 <#else>
			
		         </#if>  
		    </td>
		
		</tr>
	       
		<#if !(organize.getChildOrganizes()?size<1)> 
		      <@digui_orgnaize organize.getChildOrganizes()?sort_by('sortNob') ,flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />	
		</#if>
	</#list> 
</#macro>

<table class="table table-condensed table-hover">
    <thead>
		<tr>
		    <th width=30%>房号</th>
		   
		</tr>
	</thead>
	<tbody>
	    <@digui_orgnaize rhs["organizeRootList"],""/>
	</tbody>
</table>
<div id="dialog" ><div id=div_organize_dialog></div></div>

<span id="div_action_result" style="display:none">${rhs["info"]?if_exists}</span>



