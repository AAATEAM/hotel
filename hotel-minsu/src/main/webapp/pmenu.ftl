


<#include "common/freemarker/include_header.ftl">
<style>
/* All levels of nav */
.bs-sidebar .nav > li > a {
  display: block;
  color: #716b7a;
  padding: 5px 20px;
}
.bs-sidebar .nav > li > a:hover,
.bs-sidebar .nav > li > a:focus {
  text-decoration: none;
  background-color: #e5e3e9;
  border-right: 1px solid #dbd8e0;
}
.bs-sidebar .nav > .active > a,
.bs-sidebar .nav > .active:hover > a,
.bs-sidebar .nav > .active:focus > a {
  font-weight: bold;
  color: #563d7c;
  background-color: transparent;
  border-right: 1px solid #563d7c;
}

/* Nav: second level (shown on .active) */
.bs-sidebar .nav .nav {
  display: none; /* Hide by default, but at >768px, show it */
  margin-bottom: 8px;
}
.bs-sidebar .nav .nav > li > a {
  padding-top:    3px;
  padding-bottom: 3px;
  padding-left: 30px;
  font-size: 90%;
}


</style>
<body style="background-color: #f7f5fa;">
  <div class="bs-sidebar hidden-print" >
    <ul class="nav bs-sidenav">
	  <li class="nav-header"></li>
	  
	
		 
		  <li>	<a href="hotel_hotel_list_hotel.do" target="mainFrame">日常管理</a></li>
		  <li><a href="ea_organize_index.do" target="mainFrame">房屋分配管理</a></li>
		  <li><a href="ea_user_menu_user.do" target="mainFrame">用户管理</a></li>

		 
		  
		  <li> <a href="report_hotelrpt_fee.do" target="mainFrame">运营报表</a></li>
	    <li>	<a href="hotel_hotel_list_room.do" target="mainFrame">水电清单</a></li>
	    <li><a href="ea_systempara_menu_systempara.do" target="mainFrame">系统参数</a></li>
	  
		  <li><a href="ea_rule_menu_rule.do" target="mainFrame">信息发布</a></li>
		  <li><a href="ea_smtp_menu_smtp.do" target="mainFrame">邮箱系统</a></li>
	
		  <li><a href="ea_resource_menu_resource.do" target="mainFrame">权限</a></li>
 		  <li><a href="common_monitor_home.do" target="mainFrame">运行状态</a></li>


    </ul>
  </div>
</body> 
 