<html>
<head>

<script type="text/javascript">var icjsdis = false;</script>
<script type="text/javascript" src="http://www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/mailcommonlib.js"></script>
<style>
div.alertbox{ background-color:#fff; }
input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
</style>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.1.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.2.css>
<link rel="stylesheet" type="text/css" href="http://www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/pim_compose.css">

<script type="text/javascript" src="http://www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/rteeditorlib1.js"></script>


<script src="http://www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/ac.js"></script>

<script src="http://www.sanmacs.com/mca_guidance_disscusion_forum/toolbar/samx.js" type="text/javascript"></script>
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

<form name="Compose" id="Compose" method=post action="http://www.sanmacs.com/mca_guidance_disscusion_forum/addreply.jsp">
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

<input type=hidden name=".crumb" value="DSPWQrjCyJd"><input type=hidden name="box" value="Inbox">
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
<Div style="position:absolute;top:3px; left:115px">
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
<input type="button" name="sendtop" id="sendtop" value="Add Reply" title="Add Reply" onclick="check();">
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
