//CONFIGURE MESSAGES AND VARIABLES
var tickercontents=new Array()



tickercontents[0]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/kalinga_2012/kalinga_2012.htm"><b>KIIT University, Bhubaneshwar, Orissa (KIITEE) MCA 2012 <br> <b>Testdate:</b>22-04-2012  </b></b></a>'

tickercontents[1]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/mk_2012/mk_2012.htm"><b>Madurai Kamaraj University <br>MCA 2012 <br> <b>Testdate:</b> 11th March 2012 </b></b></a>'
tickercontents[2]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/pune_2012/pune_2012.htm"><b>University of Pune MCA 2012 <br> <b>Testdate:</b> 26th Feb 2012 </b></b></a>'
tickercontents[3]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/iitr_2012/iitr_2012.htm"><b>Joint Admission Test <br>(JAM 2012) <br> <b>Testdate:</b> 12 February 2012 </b></b></a>'


var tickerwidth="200px"
var tickerheight="74px"
var fontcss="font: 11px sans-serif; color:black"
var tickdelay=2500 //delay btw messages
var highlightspeed=1 //1 pixels at a time.
var highlightcolor="#D7EEFC"
var backdroptextcolor="#676868"

////Do not edit pass this line////////////////

document.write('<style>#highlighterbg a{color:'+backdroptextcolor+'}</style>')
document.write('<div style="width:'+tickerwidth+'; height:'+tickerheight+';'+fontcss+'">')
document.write('<span id="highlighterbg" style="position:absolute;left:0;top:0;color:'+backdroptextcolor+'; width:'+tickerwidth+'; height:'+tickerheight+';padding: 4px"></span><span id="highlighter" style="position:absolute;left:0;top:0;clip:rect(auto auto auto 0px); background-color:'+highlightcolor+'; width:'+tickerwidth+';height:'+tickerheight+';padding: 4px"></span>')
document.write('</div>')

var currentmessage=0
var clipbottom=1

function changetickercontent(){
msgheight=clipbottom=crosstick.offsetHeight
crosstick.style.clip="rect("+msgheight+"px auto auto 0px)"
crosstickbg.innerHTML=tickercontents[currentmessage]
crosstick.innerHTML=tickercontents[currentmessage]
highlightmsg()
}

function highlightmsg(){
//var msgheight=crosstick.offsetHeight
if (clipbottom>0){
clipbottom-=highlightspeed
crosstick.style.clip="rect("+clipbottom+"px auto auto 0px)"
beginclip=setTimeout("highlightmsg()",20)
}
else{
clipbottom=msgheight
clearTimeout(beginclip)
if (currentmessage==tickercontents.length-1) currentmessage=0
else currentmessage++
setTimeout("changetickercontent()",tickdelay)
}
}

function start_ticking(){
crosstickbg=document.getElementById? document.getElementById("highlighterbg") : document.all.highlighterbg
crosstick=document.getElementById? document.getElementById("highlighter") : document.all.highlighter
crosstickParent=crosstick.parentNode? crosstick.parentNode : crosstick.parentElement
if (parseInt(crosstick.offsetHeight)>0)
crosstickParent.style.height=crosstick.offsetHeight+'px'
else
setTimeout("crosstickParent.style.height=crosstick.offsetHeight+'px'",100) //delay for Mozilla's sake
changetickercontent()
}

if (document.all || document.getElementById)
window.onload=start_ticking
