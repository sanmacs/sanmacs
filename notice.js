//CONFIGURE MESSAGES AND VARIABLES
var tickercontents=new Array()




tickercontents[0]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/mca_entrance_results/haryana_result_2010.htm"><b>Haryana Combined Online Entrance Test Result 2010</b></a>'

tickercontents[1]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/mca_entrance_results/bhu_result_2010.htm"><b>Banaras Hindu University <br>MCA Entrance Result 2010</b></a>'
tickercontents[2]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/mca_entrance_results/jnu_result_2010.htm"><b>Jawaharlal Nehru University <br>MCA Entrance Result 2010</b></a>'
tickercontents[3]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/mca_entrance_results/puchd_result_2010.htm"><b>Panjab University <br>MCA Entrance Result 2010</b></a>'
tickercontents[4]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/mca_entrance_results/ip_counselling_2010.htm"><b>IP University MCA Counselling Postponed</b></a>'
tickercontents[5]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/mca_entrance_results/bit_results_2010.htm"><b>BIT - Mesra<br>MCA Entrance Result 2010</b></a>'
tickercontents[6]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/mca_entrance_results/up_results_2010.htm"><b>U.P. Technical University MCA Entrance Result 2010</b></a>'
tickercontents[7]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/mca_entrance_results/ip_result_2010.htm"><b>Indraprastha University MCA Entrance Result 2010 </b></a>'



var tickerwidth="190px"
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


