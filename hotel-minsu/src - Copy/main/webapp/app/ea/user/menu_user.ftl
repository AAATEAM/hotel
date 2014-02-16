
<#include "../../../common/freemarker/include_header.ftl">
<script type="text/javascript" src="<@context_module/>user.js"></script>
<div  style="margin:5px">
	&nbsp;&nbsp;&nbsp;<a class="btn btn-mini" onclick="javascript:action_user('create.do','');action_user('ajax_page_data.do','pageId=${rhs.maxPage}');"  >新人员记录</a>
	<#--
	<a href="ea_ea_menu_person_deploy.do" target="_blank">&nbsp;&nbsp;人员部署</a>  
	<a href="ea_ea_report_user_check.do?resultftl=menu_check_deploy_error" target="_blank">&nbsp;&nbsp;人员分配合理性检查</a><br>
	-->
	&nbsp;&nbsp;排序:
		<a href="ea_user_menu_user.do?sortName=assessLev" >评级</a>
		<a href="ea_user_menu_user.do?sortName=account" >帐号</a></li>
		<a href="ea_user_menu_user.do?sortName=name" >姓名</a></li>
	&nbsp;&nbsp;过滤：
	                                                      级别
					<select  style="width:50px" onchange="javascript:action_user('search_by_level.do','assessLev='+escape(encodeURIComponent(this.value)))" >
					    <option value="T">T</option>
		  				<option value="A">A</option>
		  				<option value="B">B</option>
		  				<option value="C">C</option>
		 			<select>
		 		
    <br>		
	<div id=div_user_table><#include "ajax_user.ftl"></div>
</div>

