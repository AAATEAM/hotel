<#include "../../../common/freemarker/include_header.ftl">


<#list rhs["userlist"]?sort_by("contenddate") as user>   
  
		 	<#list user.getRoles() as role>   
		  	  <br>${role.name}
		  	</#list>
		
	  	${user.name?if_exists}</td>
	  	<br>
	          合同到期${user.contenddate?if_exists}</td>
		<br>电表:  ${user.laste?if_exists} &nbsp;水表:${user.lastw?if_exists}	
	  <br>
    </tr>
</#list>

<#--
<a href="hotel_room_list_room_date.do?sortName=name" >合约到期排序</a></li>
<a href="hotel_room_list_room_date.do?sortName=name" >按最后2位数字排序</a></li>
 <table   class="table  table-condensed">
    <thead>
		<tr>
		    <th>序号</th>
		    <th>房号</th>
			<th>姓名</th>
			<th>合约到期日期</th>
			<th>租金还有多少天</th>
        </tr>
    </thead>
<#list rhs["userlist"]?sort_by("contenddate") as user>   
  	<tr>
	  	<td>${user_index+1?if_exists}</td>

	  	<td>
		  	<#list user.getRoles() as role>   
		  	 ${role.name}
		  	</#list>
		</td>
	  	<td>${user.name?if_exists}</td>
	  	
	  	<td> ${user.contenddate?if_exists}</td>
	
	  	<td>${javacall["com.common.time.DateUtil"].compareDate(user.contenddate,null,0)}  </td>
    </tr>
</#list>
</table>



 <table   class="table  table-condensed" style="width:180px">
    <thead>
		<tr>
		  
		    <th>房号</th>
			<th>姓名</th>
			<th>到期</th>
			
        </tr>
    </thead>
<#list rhs["userlist"]?sort_by("contenddate") as user>   
  	<tr><td width=80px>
		  	<#list user.getRoles() as role>   
		  	 ${role.name}
		  	</#list>
		</td>
	  	<td width=80px>${user.name?if_exists}</td>
	  	
	  	<td width=80px> ${user.contenddate?if_exists}</td>
	
	  
    </tr>
</#list>
</table>
-->