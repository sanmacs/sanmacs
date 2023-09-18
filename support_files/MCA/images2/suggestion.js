	function curdate() {
	var ldate = new Date();
	var ddate = ldate.getDate();
	var mdate = ldate.getMonth()+1;
	var ydate = ldate.getYear();
	var hdate = ldate.getHours();
	var mindate = ldate.getMinutes();
	var sdate = ldate.getSeconds();
	var cur=ddate+"-"+mdate+"-"+ydate;
	var curh=hdate+":"+mindate+":"+sdate;
	f1.ht1.value=cur;
	f1.ht2.value=curh;
	}

	function identitycheck() {
	if (f1.r1[0].checked || f1.r1[1].checked || f1.r1[2].checked) {
	return true;
	}
	else {
	alert("Select Entry For Student, Visitor Or Alumni");
	return false;
	}
	}

function email(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=f1.t2.value;
	str1="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890@._";
	c1=val1.length;
	if (c1<1)
	{
    	alert("Enter your email address");
  	  	f1.t2.focus();
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
				err();
				return false;
			}
		}
		if (em.indexOf('@')<0)
		{
			err();
			return false;
		}
		if (em.charAt(0)=='@')
		{
			err();
			return false;
		}
		if (em.charAt(c1-1)=='.')
		{
			err();
			return false;
		}
		var dat,cnt,cnt1;
		cnt=0;
		cnt1=0;
		for (s=0; s<c1; s++)
		{
			dat=em.charAt(s);
			if (dat=='@')
				cnt=cnt+1;
			if (dat=='.')
				cnt1=cnt1+1;
		}
		if ((cnt >1) || (cnt1>3))
		{
			err();
			return false;
		}
	}
	return true;
}

function name(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=f1.t1.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
	c1=em.length;
	if (c1<1)
	{
    	alert("Please Enter The Correct Name!");
	f1.t1.focus();
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
				f1.t1.focus();
				f1.t1.select();
				return false;
			}
		}
	}
	return true;
}

function suggest(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=f1.t3.value;
	c1=em.length;
	if (c1<1)
	{
    	alert("Please Enter The Suggestions!");
	f1.t3.focus();
  	 return false;
  	}
		return true;
}

function err()
{
	alert ("Enter a valid email address.");
	f1.t2.focus();
	f1.t2.select();
}