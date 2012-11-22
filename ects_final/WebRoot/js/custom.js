$(document).ready(function(){ 

	$("#basketItemsWrap li:first").hide();
	
	$(".box_center a img").click(function() {

		var productIDValSplitter 	= (this.id).split("_");
		var productIDVal 			= productIDValSplitter[1];
	
		$("#notificationsLoader").html('<img src="images/loader.gif">');
	
		$.ajax({  
		type: "POST",  
		url: "/addToCart1.do",  
		data: { productId: productIDVal, action: "addToBasket"},  
		success: function(theResponse) {
			
			if( $("#productID_" + productIDVal).length > 0){
				$("#productID_" + productIDVal).animate({ opacity: 0 }, 500, function() {
					$("#productID_" + productIDVal).before(theResponse).remove();
				});				
				$("#productID_" + productIDVal).animate({ opacity: 0 }, 500);
				$("#productID_" + productIDVal).animate({ opacity: 1 }, 500);
				$("#notificationsLoader").empty();			
			} else {
				$("#basketItemsWrap li:first").before(theResponse);
				$("#basketItemsWrap li:first").hide();
				$("#basketItemsWrap li:first").show("slow");  
				$("#notificationsLoader").empty();			
			}
			
		}  
		});  
		
	});
	
	
	
	$("#basketItemsWrap li img").live("click", function(event) { 
														
		var productIDValSplitter 	= (this.id).split("_");
		var productIDVal 			= productIDValSplitter[1];	
	
		$("#notificationsLoader").html('<img src="images/loader.gif">');
	
		$.ajax({  
		type: "POST",  
		url: "/deleteCart1.do",  
		data: { productID: productIDVal, action: "deleteFromBasket"},  
		success: function(theResponse) {
			
			$("#productID_" + productIDVal).hide("slow",  function() {$(this).remove();});
			$("#notificationsLoader").empty();
		
		}  
		});  
		
	});

});
