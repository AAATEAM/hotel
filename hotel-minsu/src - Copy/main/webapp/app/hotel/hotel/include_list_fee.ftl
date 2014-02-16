  	<table   class="table  table-condensed">
		<tr>
		 
			<th>合同日期</th>
			<th>房费</th>
			<th>电费</th>
			<th>水费</th>
			<th>网费</th>
			<th>押金</th>
			<th>电度数(读数)</th>
			<th>水吨数(读数)</th>
			
			<th>金额</th>
		    <th>备注</th>
		    <th>操作</th>
		</tr>
		<#list rhs["feelist"] as x>   
		<tr title="${x.operationname?if_exists}录入${x.feedate?if_exists}">
		     <td>${x.contractpaydate?if_exists}</td>
		     <td>${x.hfee?if_exists}</td>
		    <td>${x.efee?if_exists}</td>
		    <td>${x.wfee?if_exists}</td>
		    <td>${x.nfee?if_exists}</td>
		    <td>${x.depositfee?if_exists}</td>
		    <td>${x.evalue?if_exists}(${x.enumber?if_exists})</td>
		    <td>${x.wvalue?if_exists}(${x.wnumber?if_exists})</td>
		    <td>${x.fee?if_exists}</td>
		    <td>${x.remark?if_exists}</td>
		    
		    <td>
		      	<a onclick="javascript:action_fee_dialog('hotel_hotel_fee_load.do','feeid=${x.id}&organizeId=${rhs["organizeId"]?if_exists}');$('#dialog').dialog('open');">编辑</a>
				<a onclick="javascript:action_fee('hotel_hotel_fee_delete.do','feeid=${x.id}&organizeId=${rhs["organizeId"]?if_exists}');">删除</a>
	 			
		    </td>
		</tr>
		</#list>
	</table>
		