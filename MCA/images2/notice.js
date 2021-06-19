//CONFIGURE MESSAGES AND VARIABLES
var tickercontents=new Array()



tickercontents[0]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/pant_nagar_2010/pant_nagar_2010.htm"><b>G.B. Pant University, Pant Nagar, Uttarakhand MCA 2010</b><BR><b>Test Date:</b>05.6.2010</a>'

tickercontents[1]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/icet_2010/icet_2010.htm"><b>Integrated Common Entrance Test - MCA 2010 <br>(Andhra Pradesh Combined)</b><BR><b>Test Date:</b>27 May, 2010</a>'
tickercontents[2]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/jee_orissa_2010/jee_orissa_2010.htm"><b>Joint Entrance Examination Orissa - MCA 2010</b><BR><b>Test Date:</b>April 18, 2010</a>'
tickercontents[3]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/ip_2010/ip_2010.htm"><b>Guru Govind Singh Indraprastha University - MCA 2010</b><BR><b>Test Date:</b>22 May, 2010 </a>'
tickercontents[4]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/banasthaliv_2010/banasthaliv_2010.htm"><b>Banasthali Vidyapith - MCA 2010</b><BR><b>Test Date:</b>May 30, 2010</a>'
tickercontents[5]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/amu_2010/amu_2010.htm"><b>Aligarh Muslim University - MCA 2010</b><BR><b>Test Date:</b>24.05.2010</a>'
tickercontents[6]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/bhu_2010/bhu_2010.htm"><b>Banaras Hindu University - MCA 2010</b><BR><b>Test Date:</b>21.05.2010</a>'
tickercontents[7]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/uptu_2010/uptu_2010.htm"><b>U.P. Technical University, Lucknow - SEE 2010</b><BR><b>Test Date:</b>17.04.2010</a>'
tickercontents[8]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/dte_2010/dte_2010.htm"><b>DTE, Maharashtra - MCA 2010</b><BR><b>Test Date:</b>7th March 2010 </a>'
tickercontents[9]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/jnu_2010/jnu_2010.htm"><b>Jawaharlal Nehru University - MCA 2010</b><BR><b>Test Date:</b>18th May, 2010</a>'
tickercontents[10]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/bvppune_2010/bvppune_2010.htm"><b>Bharati Vidyapeeth University, Pune - MCA 2010</b><BR><b>Test Date:</b>21 March, 2010 </a>'
tickercontents[11]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/mk_2010/mk_2010.htm"><b>Madurai Kamraj University - MCA 2010</b><BR><b>Test Date:</b>07.03.2010 </a>'
tickercontents[12]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/pune_2010/pune_2010.htm"><b>University of Pune MCA 2010</b><BR><b>Test Date:</b> 14<SUP>th</SUP> March 2010</a>'
tickercontents[13]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/cusat_2010/cusat_2010.htm"><b>Cochin University of Science & Tech. - MCA 2010</b><BR><b>Test Date:</b> 08-05-2010</a>'
tickercontents[14]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/kalinga_2010/kalinga_2010.htm"><b>KIIT University, Bhubaneshwar, Orissa <br>(KIIT Entrance Examination (KIITEE)-2010)</b><BR><b>Test Date:</b> 02-05-2010</a>'
tickercontents[15]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/iitr_2010/iitr_2010.htm"><b>Joint Admission Test <br>(JAM 2010), IIT Roorkee</b><BR><b>Test Date:</b> May 02, 2010</a>'
tickercontents[16]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/du_op_2010/du_op_2010.htm"><b>Institute of Informatics & Communication (IIC)</b><br><b>Test Date:</b> February 07, 2010</a>'
tickercontents[17]='<a class="my" target="_parent" href="http://www.sanmacs.com/mca_entrance_notification/notification_for_admission/ncst_2010/ncst_2010.htm"><b>Competence in Software Technology Exam <br>(Formerly NCST)-2010</b><BR><b>Test Date:</b> January 24, 2010</a>'





var tickerwidth="169px"
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
