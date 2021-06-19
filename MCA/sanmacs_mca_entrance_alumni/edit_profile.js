function name(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val1.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	c1=em.length;
	if (c1<1)
	{
    	alert("This field cannot be empty");
  	  	val1.focus();
     	return false;
  	}
	else
	{
    	d1=str1.length;
	 	for (k=0; k<c1; k++)
		{
			e1=em.charAt(k);
			g1=str1.indexOf(e1);
			if (g1 < 0)
			{
				alert ("Enter a valid name.");
				val1.focus();
				val1.select();
				return false;
			}
		}
	}
	return true;
}

function isDate()
{
	var yy,mm,dd;
	var im,id,iy;
	var present_date = new Date();
	yy = 1900 + present_date.getYear();
	if (yy > 3000)
	{
		yy = yy - 1900;
	}
	mm = present_date.getMonth();
	dd = present_date.getDate();
	im = document.forms[0].birth_month.selectedIndex;
	id = document.forms[0].birth_day.selectedIndex;
	iy = document.forms[0].birth_year.selectedIndex;
	var entered_month = document.forms[0].birth_month.options[im].value;
	var invalid_month = document.forms[0].birth_month.options[im].value - 1; 
	var entered_day = document.forms[0].birth_day.options[id].value; 
	var entered_year = document.forms[0].birth_year.options[iy].value; 
	if ( (entered_day == 0) || (entered_month == 0) || (entered_year == 0) )
	{
		alert("Please enter your birthday");
		return false;
	}
	if ( is_greater_date(entered_year,entered_month,entered_day,yy,mm,dd) && is_valid_day(invalid_month,entered_day,entered_year) )
	{
		return true; 
	}
	return false;
}

//Greater day function
function is_greater_date(entered_year,entered_month,entered_day,yy,mm,dd)
{
	if (parseInt(entered_year) > yy)
	{
		alert("The birthday field is entered incorrectly. The year entered exceeds the current year.");
		return false;
	}
	if (parseInt(entered_year) == yy)
	{
		if (parseInt(entered_month) > mm)
		{
			alert("The birthday field is entered incorrectly.");
			return false;
		}
		if (parseInt(entered_month) == mm)
		{
			if (parseInt(entered_day) > dd)
			{
				alert("The birthday field is entered incorrectly.");
				return false;
			}
		}
	}
	return true;
}

// Valid day function
function is_valid_day(entered_month,entered_day,entered_year)
{
	if ((parseInt(entered_year) % 4) == 0) 
	{ 
		var days_in_month = "312931303130313130313031";
 	}
 	else 
	{ 
		var days_in_month = "312831303130313130313031";
 	} 
	var months = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
	if (parseInt(entered_month) != -1)
	{
	var dxt=days_in_month.substring(2*parseInt(entered_month),2*parseInt(entered_month)+2);

		if (parseInt(entered_day) > parseInt(dxt)) {
		alert ("The birthday field is entered wrongly (the day field value exceeds the number of days for the month entered).");
		return false;
		}
	}
	return true;
}

function selectme() {
var len=f.selections.options.length;
var finsel=" ";
var other="";
var cntx=0;

if(f.selections.selectedIndex>=0) {
for(i=0;i<len;i++) {
if (f.selections.options[i].selected) {
finsel+=f.selections.options[i].value+";";
cntx++;
}
}

if (f.otherinstitute.value != "") {
other=f.otherinstitute.value+";";
cntx++;
}
f.hsel.value=finsel+other;
f.hcount.value=cntx;
}
}