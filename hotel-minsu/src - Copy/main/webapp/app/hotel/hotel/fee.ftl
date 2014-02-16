<#include "../../../common/freemarker/include_header.ftl">
<#include "../../../common/freemarker/include_print.ftl">

<#include "macro_hotel.ftl"> 
  <#list rhs["organize"].getRoles() as role>
	    <#assign usernameList="" />
		<#list role.getUsers() as u>
		 <#assign usernameList=usernameList+u.name+'&nbsp;' />
		</#list>
  </#list> 
<script type="text/javascript" src="<@context_module/>hotel.js"></script>
<script type="text/javascript" >
    var ecurrentnumber=<@vextp "enumber", rhs["organize"].id />;  //为了默认当前读数
    var wcurrentnumber=<@vextp "wnumber", rhs["organize"].id />;
    var para="";
    
	function getpara(){
		para = 'fee='+document.getElementById('sum_fee').innerHTML
             + '&efee='+document.getElementById('efee').innerHTML
             + '&wfee='+document.getElementById('wfee').innerHTML
             + '&hfee='+document.getElementById('hfee').innerHTML
             + '&nfee='+document.getElementById('nfee').innerHTML
             + '&enumber='+ecurrentnumber
             + '&wnumber='+wcurrentnumber
             + '&lenumber='+<@vextp "enumber", rhs["organize"].id />
             + '&lwnumber='+<@vextp "wnumber", rhs["organize"].id />           
             + '&evalue='+document.getElementById('evalue').innerHTML
             + '&wvalue='+document.getElementById('wvalue').innerHTML
             + '&contractpaydate='+document.getElementById('contractpaydate').value
             + '&depositfee='+document.getElementById('depositfee').innerHTML
             + '&usernameList='+document.getElementById('usernameList').value
             +'&organizeId=${rhs["organize"].id?if_exists}'
	         +'&remark='+escape(encodeURIComponent(document.getElementById('remark').value));
	
    }

    
	function sum(){
		document.getElementById('sum_fee').innerHTML=parseFloat(
												parseFloat(document.getElementById('efee').innerHTML)
	                                           +parseFloat(document.getElementById('wfee').innerHTML)
	                                           +parseFloat(document.getElementById('hfee').innerHTML)
	                                           +parseFloat(document.getElementById('nfee').innerHTML)
	                                           +parseFloat(document.getElementById('depositfee').innerHTML)
	                                           ).toFixed(2);
    }

	function sumefee(number){
		document.getElementById('evalue').innerHTML=number-<@vextp "enumber", rhs["organize"].id />;
		document.getElementById('efee').innerHTML=parseFloat(document.getElementById('evalue').innerHTML*<@vextp "eprice", rhs["organize"].id />).toFixed(1);
		sum();
	}
	
	function sumwfee(number){
	   
	    document.getElementById('wvalue').innerHTML=number-<@vextp "wnumber", rhs["organize"].id />;
		document.getElementById('wfee').innerHTML=parseFloat(document.getElementById('wvalue').innerHTML*<@vextp "wprice", rhs["organize"].id />).toFixed(1);
		sum();
	}
	
</script>
	<div id="dialog"><div id=div_fee_dialog> </div></div>
   
	    <table width=100%>
	        <tr><td colspan=2>
       			 历史缴费清单<div id=div_fee_table><#include "include_list_fee.ftl"> </div>
 	        
	        <hr>
	        </td></tr>
		    <tr>
			    <td valign=top width=50%>             
					电费 <@vextp "eprice", rhs["organize"].id />元/度:<input id=input_enumber value="<@vextp "enumber", rhs["organize"].id />"  onchange="javascript:sumefee(this.value);ecurrentnumber=this.value" style='WIDTH: 50px'/>-<@vextp "enumber", rhs["organize"].id />上期=<span id=evalue>0</span>度
			        <br>水费 <@vextp "wprice", rhs["organize"].id />元/吨:<input id=input_wnumber value="<@vextp "wnumber", rhs["organize"].id />"  onchange="javascript:sumwfee(this.value);wcurrentnumber=this.value" style='WIDTH: 50px' />-<@vextp "wnumber", rhs["organize"].id />上期=<span id=wvalue>0</span>吨 
			        <br>房费 <@vextp "price", rhs["organize"].id />元/月:<input value="<@vextp "price", rhs["organize"].id />"  onchange="javascript:document.getElementById('hfee').innerHTML=this.value;sum();"  style="WIDTH: 30px" />
			     	<br>应缴费日期:<input id=contractpaydate value="" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"   style='WIDTH: 80px' />
			     	<br>
			     	   网费 <@vextp "nprice", rhs["organize"].id />元/月:<input value=" <@vextp "nprice", rhs["organize"].id />" onchange="javascript:document.getElementById('nfee').innerHTML=this.value;sum();" style='WIDTH: 30px' />
			        	押金 :<input value="0" onchange="javascript:document.getElementById('depositfee').innerHTML=this.value;sum();"  style='WIDTH: 30px' />
			        <br>备注 :<input id=remark value=""  style='WIDTH: 250px' />
			  	    <br>
					<#list  rhs["system_para_map"]["hotel_fee_reason"]?keys as key>
		                <input type="checkbox" onclick="javascript:document.getElementById('remark').value=document.getElementById('remark').value+','+this.value" name=businesstype value="${rhs["system_para_map"]["hotel_fee_reason"][key]?if_exists}" >${rhs["system_para_map"]["hotel_fee_reason"][key]?if_exists}</input>
					</#list> 
			        <br><input id=usernameList value="${rhs["organize"].name?if_exists}-${usernameList?if_exists}" type=hidden />
			        
	
	            </td>
		        <td valign=top width=50%>
                                                      房号：${rhs["organize"].name?if_exists} &nbsp;	 &nbsp; 
                    &nbsp;  开始  <@vextp "begindate", rhs["organize"].id />
			        &nbsp;  结束 <@vextp "enddate", rhs["organize"].id />

                    <br>姓名：
						${usernameList?if_exists}                                                
                        <#---->
			        <table   class="table  table-condensed">
					 	<tr><td>电费</td><td>水费</td><td>房费</td><td>网费</td><td>押金</td><td>总额</td></tr>
					 	<tr><td id=efee >0</td><td id=wfee>0</td><td id=hfee><@vextp "price", rhs["organize"].id /></td><td id=nfee><@vextp "nprice", rhs["organize"].id /></td><td id=depositfee>0</td><td id=sum_fee>0</td></tr>
				    </table>
					<br>	
		 		        <button class="btn  btn-mini" type=button value=确定缴费  onclick="javascript:sum();getpara();action_fee('hotel_hotel_fee_create.do', para); this.disabled=true;document.getElementById('input_enumber').disabled=true;document.getElementById('input_wnumber').disabled=true;document.getElementById('bt_refresh').disabled=false;">
				          确定 </button>
			        <button id="bt_refresh" class="btn  btn-mini" type=button value=确定缴费  onclick="javascript:window.location.reload();" disabled=true;>继续缴费</button>
			 	  
			       <button class="btn  btn-mini"  type=button   onclick="javascript:getpara();action_print('hotel_hotel_print_free.do', para);">缴费预览</button>
			       <button class="btn  btn-mini"  type=button   onclick="javascript:getpara();action_print('hotel_hotel_print_notify.do', para);">催缴通知单预览</button>
			       <button class="btn  btn-mini"  type=button id="print_btn" >打印</button>
			   
		        </td>
	        </tr>
        </table>
       <span id="div_action_result" style="display:none"> ${rhs["info"]?if_exists}</span>
    	<div id="print_area" style="background-color: #F6F7FB;border:1px solid #c3d9ff;font-size:14px;margin:0px;padding:0px"></div>	
        <br><br><br><br> <br><br><br><br><br><br>
          
        

		   		