<#macro  vextp  key  modelid><#if rhs["extvmap"][key+'_'+modelid]?exists>${rhs["extvmap"][key+'_'+modelid].value?default('0')}<#else>0</#if></#macro>
<#macro  showextp  key  modelid >
    <#if rhs["extvmap"][key+'_'+modelid]?exists>
  	 	<span title="${rhs["system_para_map"]["organize_extp_hotel"][key]?if_exists}">${rhs["extvmap"][key+'_'+modelid].value?default('0')} </span>
    <#else>0</#if>
</#macro>

<#macro  inputextp  key  modelid modelname dateflag="0">
  	 	${rhs["system_para_map"]["hotel_organize_extp"][key]?if_exists}
  	 	<input  value="<#if rhs["extvmap"][key+'_'+modelid]?exists> ${rhs["extvmap"][key+'_'+modelid].value?default('-')} <#else>0</#if>" 
  	    <#if dateflag=="1" > onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"</#if>
  	    style="WIDTH: 120px" onchange="javascript:action_common('ea_extp_update_extp.do','modelname=${modelname?if_exists}&modelid=${modelid?if_exists}&extpalias=${key}&value='+escape(encodeURIComponent(this.value)))" /> 
</#macro>

