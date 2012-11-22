

var disappeardelay=250  
var enableanchorlink=0 
var hidemenu_onclick=1 


var ie5=document.all
var ns6=document.getElementById&&!document.all

function getposOffset(what, offsettype){
var totaloffset=(offsettype=="left")? what.offsetLeft : what.offsetTop;
var parentEl=what.offsetParent;
while (parentEl!=null){
totaloffset=(offsettype=="left")? totaloffset+parentEl.offsetLeft : totaloffset+parentEl.offsetTop;
parentEl=parentEl.offsetParent;
}
return totaloffset;
}

function showhide(obj, e, visible, hidden){
if (ie5||ns6)
dropmenuobj.style.left=dropmenuobj.style.top=-500
if (e.type=="click" && obj.visibility==hidden || e.type=="mouseover"){
obj.visibility=visible
}
else if (e.type=="click"){
obj.visibility=hidden
}
}

function iecompattest(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function clearbrowseredge(obj, whichedge){
var edgeoffset=0
if (whichedge=="rightedge"){
var windowedge=ie5 && !window.opera? iecompattest().scrollLeft+iecompattest().clientWidth-15 : window.pageXOffset+window.innerWidth-15
dropmenuobj.contentmeasure=dropmenuobj.offsetWidth
if (windowedge-dropmenuobj.x < dropmenuobj.contentmeasure)
edgeoffset=dropmenuobj.contentmeasure-obj.offsetWidth
}
else{
var topedge=ie5 && !window.opera? iecompattest().scrollTop : window.pageYOffset
var windowedge=ie5 && !window.opera? iecompattest().scrollTop+iecompattest().clientHeight-15 : window.pageYOffset+window.innerHeight-18
dropmenuobj.contentmeasure=dropmenuobj.offsetHeight
if (windowedge-dropmenuobj.y < dropmenuobj.contentmeasure){ 
if ((dropmenuobj.y-topedge)<dropmenuobj.contentmeasure) 
edgeoffset=dropmenuobj.y+obj.offsetHeight-topedge
}
}
return '0';
}

function dropdownmenu(obj, e, dropmenuID, isTop,lft,tp)
{
	if(dropmenuID!="dropdownmenu1")
	{
		document.getElementById("dropdownmenu1").style.visibility='hidden';
		document.getElementById("dropdownmenu1").style.display == 'none';
	}
	if(dropmenuID!="dropdownmenu2")
	{
		document.getElementById("dropdownmenu2").style.visibility='hidden';
		document.getElementById("dropdownmenu2").style.display == 'none';
	}
	if(dropmenuID!="dropdownmenu3")
	{
		document.getElementById("dropdownmenu3").style.visibility='hidden';
		document.getElementById("dropdownmenu3").style.display == 'none';
	}
	if(dropmenuID!="dropdownmenu4")
	{
		document.getElementById("dropdownmenu4").style.visibility='hidden';
		document.getElementById("dropdownmenu4").style.display == 'none';
	}
	if(dropmenuID!="dropdownmenu5")
	{
		document.getElementById("dropdownmenu5").style.visibility='hidden';
		document.getElementById("dropdownmenu5").style.display == 'none';
	}
	if(dropmenuID!="dropdownmenu6")
	{
		document.getElementById("dropdownmenu6").style.visibility='hidden';
		document.getElementById("dropdownmenu6").style.display == 'none';
	}

	var e=window.event || e
	var topmenuoffset=(typeof isTop!="undefined")? 6 : 0
	if (window.event) 
		event.cancelBubble=true
	else if (e.stopPropagation) 
		e.stopPropagation()
	
	
	if (ie5||ns6)
	{
		
		dropmenuobj=document.getElementById(dropmenuID)		

		dropmenuobj.x=getposOffset(obj, "left")
		dropmenuobj.y=getposOffset(obj, "top")
		if(ns6&&dropmenuID=='anylinkmenu2' )
			lft=lft-20;		
		dropmenuobj.style.left=dropmenuobj.x-clearbrowseredge(obj, "rightedge")+lft+"px"
		dropmenuobj.style.top=dropmenuobj.y-clearbrowseredge(obj, "bottomedge")+obj.offsetHeight-topmenuoffset+tp+"px"
		if(dropmenuobj.style.visibility=='hidden' || dropmenuobj.style.display=='none')
		{
			dropmenuobj.style.visibility='visible';
			dropmenuobj.style.display='block';			
		}else
		{
			dropmenuobj.style.visibility='hidden';
			dropmenuobj.style.display='none';			
		}
	}
	return clickreturnvalue();
}

function clickreturnvalue(){
if ((ie5||ns6) && !enableanchorlink) return false
else return true
}

function dropdownmenuhide_1()
{ 
document.getElementById("dropdownmenu1").style.display = 'none';
document.getElementById("dropdownmenu1").style.visibility='hidden';
document.getElementById("dropdownmenu2").style.display = 'none';
document.getElementById("dropdownmenu2").style.visibility='hidden';
document.getElementById("dropdownmenu3").style.display = 'none';
document.getElementById("dropdownmenu3").style.visibility='hidden';
document.getElementById("dropdownmenu4").style.display = 'none';
document.getElementById("dropdownmenu4").style.visibility='hidden';
document.getElementById("dropdownmenu5").style.display = 'none';
document.getElementById("dropdownmenu5").style.visibility='hidden';
document.getElementById("dropdownmenu6").style.display = 'none';
document.getElementById("dropdownmenu6").style.visibility='hidden';
}
function dropdownmenuhide(e)
{
	if (e && e.button && e.button != 1 && e.type == 'click')
	{
		return true;
	}
	else
	{
		dropdownmenuhide_1();
	}
}
// dropdown end


function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function tabhome(id,total){
img=id.substring(1,2,3);
var tabnames = ['tab_l1','tab_l2','tab_l3'];
for(i=1; i<=total; i++){
	document.getElementById('re'+i).style.display = 'none';
	document.getElementById('a'+i+tabnames[i-1]).src="images/"+tabnames[i-1]+"_normal.gif";
	document.getElementById('a'+i+tabnames[i-1]).parentNode.style.cursor="pointer";
}
	document.getElementById('re'+img).style.display = 'block';
	document.getElementById(id).src="images/"+tabnames[img-1]+"_over.gif";
	document.getElementById(id).parentNode.style.cursor="default";	
}

function tabhome_rgt(id,total){
img=id.substring(1,2,3,4);
var tabnames = ['tab_r1','tab_r2','tab_r3','tab_r4'];
for(i=1; i<=total; i++){
	document.getElementById('rgt'+i).style.display = 'none';
	document.getElementById('a'+i+tabnames[i-1]).src="images/"+tabnames[i-1]+"_normal.gif";
	document.getElementById('a'+i+tabnames[i-1]).parentNode.style.cursor="pointer";
}
	document.getElementById('rgt'+img).style.display = 'block';
	document.getElementById(id).src="images/"+tabnames[img-1]+"_over.gif";
	document.getElementById(id).parentNode.style.cursor="default";	
}

function tabhomethree(id,total){
img=id.substring(1,2,3);
var tabnames = ['tab_r1','tab_r2','tab_r3'];
for(i=1; i<=total; i++){
	document.getElementById('rgt'+i).style.display = 'none';
	document.getElementById('a'+i+tabnames[i-1]).src="images/"+tabnames[i-1]+"_normal.gif";
	document.getElementById('a'+i+tabnames[i-1]).parentNode.style.cursor="pointer";
}
	document.getElementById('rgt'+img).style.display = 'block';
	document.getElementById(id).src="images/"+tabnames[img-1]+"_over.gif";
	document.getElementById(id).parentNode.style.cursor="default";	
}


