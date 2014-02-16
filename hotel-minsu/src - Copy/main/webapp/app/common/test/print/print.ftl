<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<#---->

<style type="text/css" media="print"> 
   #header,.top_title,#jqprint,#footer,#cssprint h3,#cssprint p{display:none}
</style>

<style type="text/css"> 
#my_area{}
</style>

<script type="text/javascript" src="../../../../common/jquery151/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../../../../common/jquery-print/jquery.PrintArea.js"></script>
<script type="text/javascript"> 
$(function(){
	$("#print_btn").click(function(){
		$("#my_area").printArea();
	});
});
</script>
</head>


      <h3>2、jQuery控制打印页面中指定的区域</h3>
      <p><a href="#" id="print_btn">点击这里打印>></a></p>
     
      <div id="my_area">
      
      	<br>姓名：姚远(华工) 
		<br>房间号：205 
		<br>合约： 
		<br>2013-08-04~2014-02-04 
		<br>上期电表:1763   
		<br>上期水表:25 
		<br>
		<br>本期结算时间： 
		<br>2013-09-03 09:31:48 
		<br>本期费用
		<br>1630元
		<br>押金750
		<br>租金 850 
		<br>水电没算

      
      </div>
 
