function ects_img_detail(originImg)
{	
	
	var pos=getElementPos(originImg);	
	var newDiv = document.createElement("div"); 
	var newImg = document.createElement("img");
	
	//娑堥櫎娴忚鍣ㄤ笂涓�涓脊鍑哄眰鏈攢姣侀棶棰�
	var ego_img_detail=document.getElementById("ego_img_detail");	
	if(ego_img_detail!=null)
	{	
		document.body.removeChild(ego_img_detail.parentNode);
	}
	
	newImg.id = "ego_img_detail";	
    newImg.src=originImg.src;
    
    newImg.width="100";
    newImg.height="100";
    
    newDiv.style.position = "absolute";
    newDiv.style.zIndex = "9999";      
   
    newDiv.style.bottom = window.screen.availHeight - 170 -pos.y - originImg.height+ "px";    
    newDiv.style.left = pos.x -3 + "px";  
        
    newDiv.style.border = "3px solid #0066cc";    
     
    newDiv.appendChild(newImg);  
    newDiv.onmouseout=function(){remove_img_detail();};
    
    document.body.appendChild(newDiv);
    
    ego_img_detail_interval=setInterval(ego_expand_detail,10);
}

function remove_img_detail()
{
	var ego_img_detail=document.getElementById("ego_img_detail");
	if(ego_img_detail!=null)
		document.body.removeChild(ego_img_detail.parentNode);
}

function ego_expand_detail()
{
	var ego_img_detail=document.getElementById("ego_img_detail");
	if(ego_img_detail!=null)
		if(ego_img_detail.height<200) 
		{
			ego_img_detail.height+=20;
			ego_img_detail.width+=20;
		}
		else
			clearInterval(ego_img_detail_interval);
		
}

function getElementPos(element)
{
	 var ua = navigator.userAgent.toLowerCase();
	 var isOpera = (ua.indexOf('opera') != -1);
	 var isIE = (ua.indexOf('msie') != -1 && !isOpera); // not opera spoof
	 var el = element;//document.getElementById(elementId);
	 if(el.parentNode === null || el.style.display == 'none') {
	  return false;
	 }      
	 var parent = null;
	 var pos = [];     
	 var box;     
	 if(el.getBoundingClientRect)    //IE
	 {         
	  box = el.getBoundingClientRect();
	  var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
	  var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);
	  return {x:box.left + scrollLeft, y:box.top + scrollTop};
	 }else if(document.getBoxObjectFor)    // gecko    
	 {
	  box = document.getBoxObjectFor(el); 
	  var borderLeft = (el.style.borderLeftWidth)?parseInt(el.style.borderLeftWidth):0; 
	  var borderTop = (el.style.borderTopWidth)?parseInt(el.style.borderTopWidth):0; 
	  pos = [box.x - borderLeft, box.y - borderTop];
	 } else    // safari & opera    
	 {
	  pos = [el.offsetLeft, el.offsetTop];  
	  parent = el.offsetParent;     
	  if (parent != el) { 
	   while (parent) {  
	    pos[0] += parent.offsetLeft; 
	    pos[1] += parent.offsetTop; 
	    parent = parent.offsetParent;
	   }  
	  }   
	  if (ua.indexOf('opera') != -1 || ( ua.indexOf('safari') != -1 && el.style.position == 'absolute' )) { 
	   pos[0] -= document.body.offsetLeft;
	   pos[1] -= document.body.offsetTop;         
	  }    
	 }              
	 if (el.parentNode) { 
	    parent = el.parentNode;
	   } else {
	    parent = null;
	   }
	 while (parent && parent.tagName != 'BODY' && parent.tagName != 'HTML') { // account for any scrolled ancestors
	  pos[0] -= parent.scrollLeft;
	  pos[1] -= parent.scrollTop;
	  if (parent.parentNode) {
	   parent = parent.parentNode;
	  } else {
	   parent = null;
	  }
	 }
	 return {x:pos[0], y:pos[1]};
}