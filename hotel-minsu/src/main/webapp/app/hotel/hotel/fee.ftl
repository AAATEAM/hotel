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
    var ecurrentnumber=<@vextp "enumber", rhs["organize"].id />;
    var wcurrentnumber=<@vextp "wnumber", rhs["organize"].id />;
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
	sum();
</script>
	<div id="dialog"><div id=div_fee_dialog> </div></div>
    <div id=div_fee  style="display:" >
	    <table width=100%>
		    <tr>
			    <td valign=top width=50%>             
					<br>电费 <@vextp "eprice", rhs["organize"].id />元/度:<input id=input_enumber value="<@vextp "enumber", rhs["organize"].id />"  onchange="javascript:sumefee(this.value);ecurrentnumber=this.value" style='WIDTH: 50px'/>-<@vextp "enumber", rhs["organize"].id />上期=<span id=evalue>0</span>度
			        <br>水费 <@vextp "wprice", rhs["organize"].id />元/吨:<input id=input_wnumber value="<@vextp "wnumber", rhs["organize"].id />"  onchange="javascript:sumwfee(this.value);wcurrentnumber=this.value" style='WIDTH: 50px' />-<@vextp "wnumber", rhs["organize"].id />上期=<span id=wvalue>0</span>吨 
			        
			        <br>房费 <@vextp "price", rhs["organize"].id />元/月:<input value="<@vextp "price", rhs["organize"].id />"  onchange="javascript:document.getElementById('hfee').innerHTML=this.value;sum();"  style="WIDTH: 30px" />
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
                    <#--
                                                                       今日：${javacall["com.common.time.TimeUtil"].getTimeStr("yyyy年MM月dd日")} 		
                    -->
                   
                                                           
			        	<table   class="table  table-condensed">
					 	<tr><td>电费</td><td>水费</td><td>房费</td><td>网费</td><td>押金</td><td>总额</td></tr>
					 	<tr><td id=efee>0</td><td id=wfee>0</td><td id=hfee><@vextp "price", rhs["organize"].id /></td><td id=nfee><@vextp "nprice", rhs["organize"].id /></td><td id=depositfee>0</td><td id=sum_fee>0</td></tr>
				    </table>
			
		        <button class="btn  btn-mini" type=button value=确定缴费  onclick="javascript:sum();action_fee('hotel_hotel_fee_create.do',
		                                                                'fee='+document.getElementById('sum_fee').innerHTML
		                                                                 + '&efee='+document.getElementById('efee').innerHTML
		                                                                 + '&wfee='+document.getElementById('wfee').innerHTML
		                                                                 + '&hfee='+document.getElementById('hfee').innerHTML
		                                                                 + '&nfee='+document.getElementById('nfee').innerHTML
		                                                                 + '&enumber='+ecurrentnumber
		                                                                 + '&wnumber='+wcurrentnumber
		                                                                 + '&evalue='+document.getElementById('evalue').innerHTML
		                                                                 + '&wvalue='+document.getElementById('wvalue').innerHTML
		                                                                     
		                                                                     
		                                                                  + '&depositfee='+document.getElementById('depositfee').innerHTML
		                                                               + '&usernameList='+document.getElementById('usernameList').value
		                                                                +'&organizeId=${rhs["organize"].id?if_exists}'
		                                                                +'&remark='+escape(encodeURIComponent(document.getElementById('remark').value))); this.disabled=true;document.getElementById('input_enumber').disabled=true;document.getElementById('input_wnumber').disabled=true;document.getElementById('bt_refresh').disabled=false;">确定 </button>
	        <button id="bt_refresh" class="btn  btn-mini" type=button value=确定缴费  onclick="javascript:window.location.reload();" disabled=true;>继续缴费</button>
	        <button class="btn  btn-mini" type=button   onclick="javascript:alert(123)">打印清单 </button>
	<br><input    type="button"  id="print_btn"   value="打印"> 
	<div id="print_area" style="background-color: #F6F7FB;border:1px solid #c3d9ff;width:250px">
		        <b>缴费清单收据</b> 
				<br>姓名：
			    <br>房间号：${rhs["organize"].name?if_exists}	
				<br>合同有效时间：
				
			  	<br>
				------------------------------------
				<div id=div_print_e_fee> </div>
			    <div id=div_print_w_fee> </div>
			 	<div id=div_print_h_fee> </div>
				<div id=div_print_n_fee><b>宽带:30元</b> </div>
			 	<div id=div_print_sp_fee> </div>
				------------------------------------
						
	</div>		   			
	                                                   
		        </td>
	        </tr>
	        <tr>
	        <td colspan=2>
	        <hr> 历史缴费清单
				      <div id=div_fee_table>
				      	<#include "include_list_fee.ftl"> 
			             <#--只列出合同期之后的费用                                                       
			            <table>
						 	<tr><td>日期</td><td>电费</td><td>水费</td><td>房费</td><td>网费</td><td>押金</td><td>金额</td><td>操作</td></tr>
						 	<tr><td>2013-09-22</td><td>10</td><td>45</td><td>950</td><td>30</td><td>950</td><td>1930</td><td><a>编辑</a><a>删除</a></td></tr>
						 	<tr><td>2013-10-22</td><td>30</td><td>25</td><td>950</td><td>30</td><td>0</td><td>1930</td><td><a>编辑</a><a>删除</a></td></tr>
						 	<tr><td>2013-11-22</td><td>50</td><td>15</td><td>950</td><td>30</td><td>0</td><td>1930</td><td><a>编辑</a><a>删除</a></td></tr>
	
					    </table>
					    -->
                    </div>
	        
	        </td>
	        </tr>
        </table>
        
        </div>
        <span id="div_action_result" style="display:none"> ${rhs["info"]?if_exists}</span>
        <br><br><br><br>