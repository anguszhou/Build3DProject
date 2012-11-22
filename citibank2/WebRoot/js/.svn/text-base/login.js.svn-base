	
	function AsynLogin(url,caller)
	{		
		
		var pos=getElementPos(caller);
		var newDiv = document.getElementById('citi_AsynLogin_form_div');
		if(newDiv !== null)
		{
			return;
		}
				
		newDiv = document.createElement("div");
		newDiv.id="citi_AsynLogin_form_div";	
		
	    newDiv.style.position = "absolute";
	    newDiv.style.zIndex = "9999";      
	   
	    newDiv.style.bottom = window.screen.availHeight - 170 -pos.y + "px";    
	    newDiv.style.left = pos.x - 300 + "px"; 
	    newDiv.style.width = 270 + 'px'; 
	    newDiv.style.height = 200+ 'px'; 
	    newDiv.style.backgroundColor = "#b5d0d0";
	        
	    newDiv.style.border = "3px solid #0066cc";
	    
	    newDiv.innerHTML='<form action="' + url + '" method = "post">'+'<div id="ects_message" class="form_row" style="margin-left:50px;">您尚未登录，请先登录！</div><div class="form_row"><label class="contact"><strong>用户名：</strong></label><input type="text" name="name" /></div><div class="form_row"><label class="contact"><strong>密&nbsp;码&nbsp;：&nbsp;</strong></label><input type="password" name="password"/></div><input type="button" style="margin-left:75px;" value="登录" onclick="login(this.form);"/><input type="button" style="margin-left:20px;" value="取消" onclick="closeDiv();"/></div><div class="form_row"><a href="regist.jsp" style="margin-left: 70px;">新用户？来注册吧！</a></div><div class="form_row">'+'</form>'; 
	    
	    document.body.appendChild(newDiv);	
	    
	}
	
	function login(form)
	{
		if(form.name.value == null || form.name.value == '')
		{
			alert("姓名不能为空！");
			return ;
		}
		if(form.password.value == null || form.password.value == '')
		{
			alert("密码不能为空！");
			return ;
		}
		var ajaxUrl = "/citibank/login.AsynLogin?name="+form.name.value+"&password="+form.password.value;
				
		$.post(ajaxUrl,function(data,textStatus)
		{			
			if(data == 'true')
			{				
				window.location = form.action;
			}
			else
			{
				document.getElementById("citi_message").innerText="用户名或密码错误，请重新登录！";
			}
		});
				
	}
	
	function testUserName(caller,messageId)
	{
		
		var ajaxUrl = "/citibank/testUserName.AsynLogin?name="+caller.value;
				
		$.post(ajaxUrl,function(data,textStatus)
		{
			
			if(data == 'true')							
				document.getElementById(messageId).innerText="用户名可以使用";			
			else
			{											
				document.getElementById(messageId).innerText="该用户名已存在，请重新输入";
				caller.value = '';
			}
				
		});
	}
	
	function closeDiv()
	{
		var newDiv = document.getElementById('citi_AsynLogin_form_div');		
		document.body.removeChild(newDiv);
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
	