<html>
<head>
<style>
input {font-family:'Arial, Helvetica, sans-serif'; font-size:11px}
</style>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.1.css>
<link rel=stylesheet type=text/css href=http://www.sanmacs.com/images2/sanmacs2.2.css>

<script>
function check()
{
	var a=true;
        a=name(document.Compose.heading,"Enter a valid Heading!"); 
	if (a)
	{
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

<Div style="position:absolute;top:3px; left:115px">
<p id="ftp" align="justify" style="margin-left:17px"><input type=text name="heading" size=30></p>
</Div>

<Div style="position:absolute;top:33px; left:115px">
<p id="ftp" align="justify" style="margin-left:17px"><textarea cols=75 rows=13 name=PlainMsg></textarea></p>
</Div>

<Div style="position:absolute; top:250px; left:250px">
<input type="button" name="sendtop" id="sendtop" value="Add Comments" title="Add Comments" onClick="check();">
</Div>

</form>

</body>
</html>
