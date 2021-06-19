var browser = navigator.appName;
							if (browser == "Netscape")				
							{								
								marqueecontents="<font style='font-size:xx-small;' face='MS Sans Serif,tahoma,verdana,arial' color='white'><b>Our Results: &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp; 1998 - 22/30 in DUMCA, 44/50 in MP 16/19 in Poona, 8-JNU, 6-VJTI 9-Thapar &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp; 1999 - 27/31 in DUMCA 85/105 in MP, 33/40 in Poona, 6/10 in VJTI 8-REC TRICHI, 17/30 In JNU &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp; 2000: 24/30 in DUMCA, 36 in Poona, 22 in JNU &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp; 2001: 24/30 in DUMCA, 25 in Poona, 20 in JNU, 18 in REC(T), 43 in Jamia Hamdard, 7 in Goa, 17 in Hyderabad, 15 in Chandigarh, 18 in Banasthali &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp; 2002: 26/31 in DUMCA, 28 in Poona, 22 in JNU, 16 in REC(T), 41 students out of 48 scoring 99 percentile in NCST, 258 students in top 300 ranks in IP, 14 in SNDT, 6 in Goa, 47/66 in Jamia Hamdard, 19 in Hyderabad, 13 in Chandigarh, 19 in Banasthali...   &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp;<font color=yellow> 2003: 23/30 in DUMCA, 26 in Poona, 22 in JNU, 17 in REC(T), 45 in Jamia Hamdard,22 (including top ranks) in IIT-Roorkie, 6 in Goa, 18 in Hyderabad, 14 in Chandigarh, 20 in Banasthali, 15 in SNDT, 255 in Top 300 ranks in I.P. University(Delhi), 52 students scoring 99 percentile in NCST, 8 in Gurukul Kangri, 72 in top 100 ranks in Haryana combined... ";
								var marqueewidth=640;
								var marqueeheight=20;
								var speed=6;
								if (document.all)
								document.write('<marquee scrollAmount='+speed+' style="width:'+marqueewidth+'">'+marqueecontents+'</marquee>')

								function regenerate(){
								window.location.reload()
								}
								function regenerate2(){
								if (document.layers){
								setTimeout("window.onresize=regenerate",450)
								intializemarquee()
								}
								}

								function intializemarquee(){
								document.cmarquee01.document.cmarquee02.document.write('<nobr>'+marqueecontents+'</nobr>')
								document.cmarquee01.document.cmarquee02.document.close()
								thelength=document.cmarquee01.document.cmarquee02.document.width
								scrollit()
								}

								function scrollit(){
								if (document.cmarquee01.document.cmarquee02.left>=thelength*(-1)){
								document.cmarquee01.document.cmarquee02.left-=speed
								setTimeout("scrollit()",100)
								}
								else{
								document.cmarquee01.document.cmarquee02.left=marqueewidth
								scrollit()
								}
								}

								window.onload=regenerate2;
							}
						else
						{								
							document.write("<marquee id=marquee onMouseover='marquee.stop();' onMouseout='marquee.start();' truespeed=1 scrolldelay='25' scrollamount=1>");
							document.write("<font style='font-size:8pt;' face='MS Sans Serif,tahoma,verdana,arial' color='#1106F9'><b>Our Results: &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp;<font color=Yellow>1996: 16/30 in DU-MCA, 23 in Pune, 18 in Thapar, 21 in JNU, 8 in Rohtak, 100 out of first 120 from SANMACS in U.P. Combined... &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp;<font color=Turquise>1997: 25/30 in DU-MCA, 20 in Poona, 13 in BHU, 10 in JNU, 18 in Banasthali, 9 in Thapar, 18 in Rohtak, 11 in P.U.Chandigarh... &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp;<font color=#F1EBEB> 1998 - 22/30 in DUMCA, 44/50 in MP, 16/19 in Poona, 8 in JNU, 13 in Jamia Hamdard, 22 in Rohtak, 6 in Goa,  13 in Banasthali, 6 in VJTI, 9 in Thapar, 6 in Hyderabad... &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp;<font color=GREEN> 1999 - 27/31 in DUMCA, 85/105 in MP, 33/40 in Poona, 6/10 in VJTI, 8/10 in REC TRICHI, 17/30 in JNU, 6/8 in Hyderabad, 6/10 in Bombay, 8/10 in JMI(Delhi)... &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp;<font color=#1106F9> 2000: 24/30 in DUMCA, 36 in Poona, 22 in JNU, 14 in Banasthali, 16 in Thapar, 6 in Goa, 18 in Jamia Hamdard, 20 in Rohtak, 16 in Hyderabad, 7 in VJTI, 14 in BHU, 15 in Chandigarh...  &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp;<font color=yellow> 2001: 24/30 in DUMCA, 25 in Poona, 20 in JNU, 18 in REC(T), 43 in Jamia Hamdard, 7 in Goa, 17 in Hyderabad, 15 in Chandigarh, 18 in Banasthali, 13 in VJTI, 243 in Top 300 ranks in I.P. University(Delhi), 51 students out of 67 scoring 99 percentile in NCST... &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp;<font color=blue> 2002: 26/31 in DUMCA, 28 in Poona, 22 in JNU, 16 in REC(T), 20 in IIT Roorkee, 41 students out of 48 scoring 99 percentile in NCST, 258 students in top 300 ranks in IP, 14 in SNDT, 6 in Goa, 47/66 in Jamia Hamdard, 19 in Hyderabad, 13 in Chandigarh, 19 in Banasthali...   &nbsp;&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp;<font color=yellow> 2003: 23/30 in DUMCA, 26 in Poona, 22 in JNU, 17 in REC(T), 45 in Jamia Hamdard,22 (including top ranks) in IIT-Roorkee, 6 in Goa, 18 in Hyderabad, 14 in Chandigarh, 20 in Banasthali, 15 in SNDT, 255 in Top 300 ranks in I.P. University(Delhi), 52 students scoring 99 percentile in NCST, 8 in Gurukul Kangri, 72 in top 100 ranks in Haryana combined...&nbsp;&nbsp;<image src='http://www.sanmacs.com/iMAGES/blue-ball.gif'>&nbsp;<font color=blue> 2004: 25/30 in DUMCA, 410 in top 500 ranks in AIMCET,I.P. University: 260 in top 300 ranks, Major selections in all other MCA's viz Poona, REC-Rourkela, REC-Suratkal, Hyderabad, Goa, VJTI, Coachin, Banasthali, Chandigarh, Kurukshetra, JNU, Jamia Hamdard, IIT-Roorkee....   ");
							document.write("</b></font></marquee>");
						}						



