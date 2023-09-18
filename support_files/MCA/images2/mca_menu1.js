function hideall() {
document.all.iden.style.visibility='hidden';
document.all.stud.style.visibility='hidden';
document.all.ent.style.visibility='hidden';
document.all.train.style.visibility='hidden';
document.all.privilege.style.visibility='hidden';
document.all.intell.style.visibility='hidden';
document.all.general.style.visibility='hidden';
}


document.write("<DIV style='position:absolute; top:111px; left:0px; z-index:200;'>");
document.write("<TABLE WIDTH=778 BORDER=0 CELLPADDING=0 CELLSPACING=0>");
document.write("<TR>");
document.write("<TD><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/megaleap.gif' WIDTH=67 HEIGHT=35 ALT='MEGALEAP'></TD>");
document.write("<TD><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/about_us.gif' WIDTH=64 HEIGHT=35 onMouseover=document.all.iden.style.visibility='visible' ALT='ABOUT US'></TD>");
document.write("<TD><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/student_central.gif' WIDTH=97 HEIGHT=35 onMouseover=document.all.stud.style.visibility='visible' ALT='STUDENT CENTRAL'></TD>");
document.write("<TD><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/notification.gif' WIDTH=75 HEIGHT=35 onMouseover=document.all.ent.style.visibility='visible' ALT='NOTIFICATION'></TD>");
document.write("<TD><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/mca_training.gif' WIDTH=87 HEIGHT=35 onMouseover=document.all.train.style.visibility='visible' ALT='MCA TRAINING'></TD>");
document.write("<TD><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/sanmacs_privilege.gif' WIDTH=116 HEIGHT=35 onMouseover=document.all.privilege.style.visibility='visible' ALT='SANMACS PREVILEGE'></TD>");
document.write("<TD><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/alumni.gif' WIDTH=50 HEIGHT=35 ALT='ALUMNI'></TD>");
document.write("<TD><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/franchisee_program.gif' WIDTH=126 HEIGHT=35 ALT='FRANCHISEE PROGRAM'></TD>");
document.write("<TD><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/join_us.gif' WIDTH=53 HEIGHT=35 ALT='JOIN US'></TD>");
document.write("<TD><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/faqs.gif' WIDTH=43 HEIGHT=35 ALT='FAQs'></TD>");
document.write("</TR>");
document.write("</TABLE>");
document.write("</DIV>");

document.write("<DIV style='position:absolute; top:146px; left:67px; z-index:201;'>");
document.write("<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 id='iden' style='visibility:hidden' onMouseover=document.all.iden.style.visibility='visible'>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/identity.gif' ALT='IDENTITY'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/mission.gif' ALT='MISSION'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/philosophy.gif' ALT='PHILOSOPHY'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/strength.gif' onMouseover=document.all.intell.style.visibility='visible' ALT='STRENGTH'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/chariman_desk.gif' ALT='CHAIRMAN'S DESK'></td></tr>");
document.write("</TABLE>");
document.write("</DIV>");

document.write("<DIV style='position:absolute; top:236px; left:177px; z-index:202;'>");
document.write("<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 id='intell' style='visibility:hidden' onMouseover=document.all.intell.style.visibility='visible';document.all.iden.style.visibility='visible'>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/intellectual.gif' ALT='INTELLECTUAL'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/technological.gif' ALT='TECHNOLOGICAL'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/infrastructural.gif' ALT='INFRASTRUCTURAL'></td></tr>");
document.write("</TABLE>");
document.write("</DIV>");

document.write("<DIV style='position:absolute; top:146px; left:130px; z-index:203;'>");
document.write("<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 id='stud' style='visibility:hidden' onMouseover=document.all.stud.style.visibility='visible'>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/online_test.gif' ALT='ONLINE TEST'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/student_speaks.gif' ALT='STUDENT SPEAKS'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/student_forum.gif' ALT='STUDENT FORUM'></td></tr>");
document.write("</TABLE>");
document.write("</DIV>");

document.write("<DIV style='position:absolute; top:146px; left:228px; z-index:204;'>");
document.write("<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 id='ent' style='visibility:hidden' onMouseover=document.all.ent.style.visibility='visible'>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/entrance_test.gif' ALT='ENTRANCE TEST'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/results.gif' ALT='RESULTS'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/scope_of_it.gif' ALT='SCOPE OF IT'></td></tr>");
document.write("</TABLE>");
document.write("</DIV>");

document.write("<DIV style='position:absolute; top:146px; left:302px; z-index:205;'>");
document.write("<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 id='train' style='visibility:hidden' onMouseover=document.all.train.style.visibility='visible'>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/gateway.gif' ALT='GATEWAY TO GLOBAL IT'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/institutes.gif' ALT='INSTITUTES'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/exam_pattern.gif' ALT='ENTRANCE EXAM PATTERN'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/syllabus.gif' onMouseover=document.all.general.style.visibility='visible' ALT='SYLLABUS'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/test_techniques.gif' ALT='TEST TAKING TECHNIQUES'></td></tr>");
document.write("</TABLE>");
document.write("</DIV>");

document.write("<DIV style='position:absolute; top:236px; left:444px; z-index:206;'>");
document.write("<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 id='general' style='visibility:hidden' onMouseover=document.all.general.style.visibility='visible';document.all.train.style.visibility='visible'>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/general_mca_syllabus.gif' ALT='GENERAL MCA SYLLABUS'></td></tr>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/university_syllabus.gif' ALT='SYLLABUS OF UNIVERSITIES'></td></tr>");
document.write("</TABLE>");
document.write("</DIV>");

document.write("<DIV style='position:absolute; top:146px; left:390px; z-index:207;'>");
document.write("<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 id='privilege' style='visibility:hidden' onMouseover=document.all.privilege.style.visibility='visible'>");
document.write("<tr><td><IMG BORDER=0 SRC='http://www.sanmacs.com/images2/mca_menu/sanmacsians.gif' ALT='SANMACS PRIVILEGE'></td></tr>");
document.write("</TABLE>");
document.write("</DIV>");