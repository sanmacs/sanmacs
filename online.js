var isNS = (navigator.appName == "Netscape") ? 1 : 0; 
var EnableRightClick = 0; 
if(isNS) 
document.captureEvents(Event.MOUSEDOWN||Event.MOUSEUP); 
function mischandler(){ 
if(EnableRightClick==1){ return true; } 
else {return false; } 
} 
function mousehandler(e){ 
if(EnableRightClick==1){ return true; } 
var myevent = (isNS) ? e : event; 
var eventbutton = (isNS) ? myevent.which : myevent.button; 
if((eventbutton==2)||(eventbutton==3)) return false; 
} 
function keyhandler(e) { 
var myevent = (isNS) ? e : window.event; 
if (myevent.keyCode==96) 
EnableRightClick = 1; 
if (myevent.keyCode==116)
event.keyCode=0;
if (myevent.keyCode==8)
event.keyCode=0;

return; 
} 
document.oncontextmenu = mischandler; 
document.onkeypress = keyhandler; 
document.onmousedown = mousehandler; 
document.onmouseup = mousehandler; 
document.onkeydown = showDown; 

//--> 
function showDown() 
{ 
if (document.all) 
{ 
if (event.keyCode==116 || event.keyCode==82) 
{ 
event.keyCode =0; 
return false; 
} 
if (event.keycode!=0)
{
event.keycode=0;
return false;
}
} 
} 


