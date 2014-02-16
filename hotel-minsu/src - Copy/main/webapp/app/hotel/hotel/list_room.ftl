<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_print.ftl">
<#include "macro_hotel.ftl">
<script type="text/javascript" src="<@context/>app/ea/organize/organize.js"></script>
<script type="text/javascript" src="<@context_module/>hotel.js"></script>

<#macro digui_orgnaize treeNodes  flag >
	<#list treeNodes?sort_by("name") as organize>
	
		        <#if organize.allUser()?size gt 0 > 
		       <br> <b style="font-size:16px">${organize.name}房</b><br> 
		                     <#----->
							<#list javacall["com.app.manager.hotel.javacall.HotelJavacall"].getFeeList(organize.id?string) as x>   
								<#if !x_has_next>
								        上期时间：${x.contractpaydate?if_exists}
								    <br>费用：${x.fee?if_exists}
								    <br>合同：
								    <br><@vextp "begindate", organize.id />~<@vextp "enddate", organize.id /> 
								    <br> 房费：${x.hfee?if_exists} 网费：30元 	
								    <br> 电表：${x.enumber?if_exists}(${x.efee?if_exists}元) 
								    <br>水表：${x.wnumber?if_exists}(${x.wfee?if_exists}元) 
									
								</#if>
							</#list>
						

				       
				 <#else>
			
		         </#if>  
		
	       
		<#if !(organize.getChildOrganizes()?size<1)> 
		      <@digui_orgnaize organize.getChildOrganizes()?sort_by('sortNob') ,flag+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />	
		</#if>
	</#list> 
</#macro>

   <button class="btn  btn-mini"  type=button id="print_btn" >打印</button>
<div id="print_area" style="background-color: #F6F7FB;border:1px solid #c3d9ff;font-size:14px;margin:0px;padding:0px">
	    <@digui_orgnaize rhs["organizeRootList"],""/>
</div>		



