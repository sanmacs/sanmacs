function check()
{
	var a;
        a=name(nws.t2) && email(nws.t1); 
	if (a)
	{
	a=nws.t1.value;
	b=nws.t2.value;
	path="http://www.sanmacs.com:8080/SANMACS/sanmacs_mca_newsletter/newsletter.jsp?Name="+a+"&Email="+b;
	window.open(path,'profile3','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,width=250,height=150')
	nws.t1.value="";
	nws.t2.value="";
	}
	else
	{
		return false;
	}
}

function ftt() {
check();
}

function email(val1)
{
	var em,c1,d1,e1,g1,h,str1;
	em=nws.t2.value;
	str1="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890@._";
	c1=val1.length;
	if (c1<1)
	{
    	alert("Enter your email address");
  	  	nws.t2.focus();
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
	em=nws.t1.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
	c1=em.length;
	if (c1<1)
	{
    	alert("Please Enter The Correct Name!");
	nws.t1.focus();
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
				nws.t1.focus();
				nws.t1.select();
				return false;
			}
		}
	}
	return true;
}

function err()
{
	alert ("Enter a valid email address.");
	nws.t2.focus();
	nws.t2.select();
}

function openWin(theURL,winName,features) {
window.open(theURL,winName,features);
}

function checkt() {
if (fct.university.selectedIndex==0) {
alert("Select the name of the university!");
}
else {
fct.submit();
}
}