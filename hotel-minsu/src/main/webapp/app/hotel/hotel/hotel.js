$(function(){
    
	$('#dialog').dialog({
		autoOpen: false,
		modal: true,
		width: 500
	});
	
});
    
	function action_fee_dialog(url,para){
      $.ajax({
          type:"POST",
          url: url,
          data:para,
          cache: false,
          success: function(html){
              document.getElementById('div_fee_dialog').innerHTML=html;
              	tip_info();      
         }
	  });  
	}
     
     function ajax_add_new_user() {
	  	$.ajax({
	        type:"POST",
	     	url: "hotel_hotel_save_new_user.do",
	     	data:"name="+document.getElementById('name').value+"&account="+document.getElementById('account').value+"&roleId="+document.getElementById('role_id').value,
	     	cache: false,
	     	success: function(html){
	     	
	     	    document.getElementById('div_action_result').innerHTML=html;
	     
	     	    tip_info();
	     	    window.location.reload();
	       }	
	    });  
	}
	
     var roleId=0;
	 function createUserRoleRelation(userId,roleId) {
	  	$.ajax({
	        type:"POST",
	     	url: "ea_ea_create_user_role_relation.do",
	     	data:"userId="+userId+"&roleId="+roleId,
	     	cache: false,
	     	success: function(html){
	     	  //document.getElementById('div_organize_rolelist').innerHTML=html;   
	       }	
	    });  
	}
	
	 function ajax_role_user_list(roleId,organizeId) {
	    $.ajax({
	        type:"POST",
	     	url: "ea_ea_ajax_role_user_list.do",
	     	data:"roleId="+roleId+"&organizeId="+organizeId,
	     	cache: false,
	     	success: function(html){
	     	  document.getElementById('div_user_select').innerHTML=html;  
	     	   
	       }	
	    });  
	}
	
    
    function action_fee(url,para){ 
       
       $.ajax({
	         type:"POST",
	         url: url,
	         data:para,
	         cache: false,
	         success: function(html){
	            document.getElementById('div_fee_table').innerHTML=html;
	       	  	tip_info();         	
	         }
	    });  
    }    
	  //用弹出窗口，牵涉到麻烦的中文字符传送
    function action_print(url,para){ 
     // alert(url+para);
      $.ajax({
	         type:"POST",
	         url: url,
	         data:para,
	         cache: false,
	         success: function(html){
	            
	            document.getElementById('print_area').innerHTML=html;
	       	  	     	
	         }
	    });  
    }    