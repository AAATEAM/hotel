<#include "../../../common/freemarker/include_header.ftl">
<#include "macro_hotel.ftl">
<script type="text/javascript" src="<@context/>app/ea/organize/organize.js"></script>
<script type="text/javascript" src="<@context_module/>hotel.js"></script>

<#macro digui_orgnaize treeNodes  flag >
	<#list treeNodes?sort_by("name") as organize>
		<tr>
		    <td>${flag}<b>${organize.name}</b>
		        <#if organize.allUser()?size gt 0 > 
					 &nbsp;&nbsp; 
			          <#--
	                   <@vextp "begindate", organize.id />
				        ~ 
				        -->
					   <#if organize.getRoles()?size gt 0 >      
						        合同到期<@vextp "enddate", organize.id /> &nbsp; &nbsp;
						       <#assign day_number=javacall["com.app.manager.hotel.javacall.HotelJavacall"].getHowManyDayToPay(organize.id?string)?number />
						           
						              <span <#if day_number gt 25> style="color:red" </#if>  >   
						              		  距上次缴费： ${day_number}天
						              </span>
				        </#if>
				 <#else>
			
		         </#if>  
		    </td>
		    <td>
		       <#if organize.getRoles()?size gt 0 > 
			    <a title="开房登记" href="hotel_hotel_contract.do?organizeId=${organize.id}" onclick="return hs.htmlExpand(this, { objectType: 'iframe' })" target=_blank>开房登记</a>
			    &nbsp;&nbsp;&nbsp;
			    <a  title="日常收费 " href="hotel_hotel_fee.do?organizeId=${organize.id}"  onclick="return hs.htmlExpand(this, { objectType: 'iframe' })" target=_blank>费用</a>
		    	&nbsp;&nbsp;&nbsp; 备注<input  value="${organize.organizedescription?if_exists}" 
		        style="WIDTH: 320px"  onchange="javascript:action_organize('update.do','column=organizedescription&id=${organize.id?if_exists}&columnValue='+escape(encodeURIComponent(this.value)))" /> 
		       <#--
		       <input type=radio  checked/>未交  <input type=radio />已交 （最后一笔月缴费时间的跟今天不要超过30天）
		       -->
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
		     <th width=70%></th>
		</tr>
	</thead>
	<tbody>
	    <@digui_orgnaize rhs["organizeRootList"],""/>
	</tbody>
</table>
<div id="dialog" ><div id=div_organize_dialog></div></div>

<span id="div_action_result" style="display:none">${rhs["info"]?if_exists}</span>



