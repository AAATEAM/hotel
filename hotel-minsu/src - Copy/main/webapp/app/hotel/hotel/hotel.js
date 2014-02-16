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
