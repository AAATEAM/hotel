
<#assign x=rhs["fee"] />
            <b>缴费清单</b> 
			<br>房号：${rhs["organize"].name?if_exists} &nbsp;	 &nbsp; 
	        <br>缴费日:${x.contractpaydate?if_exists}
		    <br>电费:${x.efee?if_exists}元
		    <br> ${x.evalue?if_exists}度(${x.enumber?if_exists}-${x.lenumber?if_exists})
		    <br>水费:${x.wfee?if_exists}元 
		     <br>${x.wvalue?if_exists}吨(${x.wnumber?if_exists}-${x.lwnumber?if_exists})
		    <br>房费:${x.hfee?if_exists}
		    <br>网费:${x.nfee?if_exists}
		    <br>押金:${x.depositfee?if_exists}
		  
		    <br>总额:${x.fee?if_exists}
		   		
		
		
		
		    