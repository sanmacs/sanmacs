//validation for first and last name

function reg(val,stx)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ. ";
	c1=em.length;
	if (c1<1)
	{
    	alert(""+stx+" !");
	val.focus();
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
				alert (""+stx+" !");
				val.focus();
				val.select();
				return false;
			}
		}
	}
	return true;
}

//validation for address

function addr(val,stx)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val.value;
	str1="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890,.-/ ";
	c1=em.length;
	if (c1<1)
	{
    	alert(""+stx+" !");
	val.focus();
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
				alert (""+stx+" !");
				val.focus();
				val.select();
				return false;
			}
		}
	}
	return true;
}

//validation for phone number

function phn(val,stx)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val.value;
	str1="1234567890-";
	c1=em.length;
	if (c1<1)
	{
    	alert(""+stx+" !");
	val.focus();
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
				alert (""+stx+" !");
				val.focus();
				val.select();
				return false;
			}
		}
	}
	return true;
}

//validation for emailid

function email(val)
{
	var em,c1,d1,e1,g1,h,str1;
	em=val.value;
	str1="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890@._";
	c1=val.length;
	if (c1<1)
	{
    	alert("Enter your email address");
  	  	val.focus();
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

function err()
{
	alert ("Enter a valid email address.");
	f.email.focus();
	f.email.select();
}

//validation for graduation degree owned by the student

function coursecheck() {
if(!f.grad[0].checked && !f.grad[1].checked && !f.grad[2].checked && !f.grad[3].checked && !f.grad[4].checked && !f.grad[5].checked) {
alert("Specify Your Graduation Degree!");
f.grad[0].focus();
f.grad[0].select();
return false;
}
else if(f.grad[5].checked && f.grad_specify.value=="") {
alert("Specify Your Graduation Degree!");
f.grad_specify.focus();
f.grad_specify.select();
return false;
}
else {
return true;
}
}

//validation for the course for which student is applying

function courseapply() {
if (document.f.course.selectedIndex==0) {
alert("Select The Course Applying For!");
return false;
}
else {
return true;
}
}

//validation for graduation year details

function graddetail(val,stx) {
if (val.selectedIndex==0) {
alert("Select The "+stx+" Year of Graduation!");
return false;
}
else {
return true;
}
}

//validation for calculation of grade for varying percentage

function calgrad() {
if (f.first_per.value>=60) {
f.first_grad.selectedIndex=1;
}
else if(f.first_per.value>=50 && f.first_per.value<=60) {
f.first_grad.selectedIndex=2;
}
else if(f.first_per.value<=50) {
f.first_grad.selectedIndex=3;
}

if (f.second_per.value>=60) {
f.second_grad.selectedIndex=1;
}
else if(f.second_per.value>=50 && f.second_per.value<=60) {
f.second_grad.selectedIndex=2;
}
else if(f.second_per.value<=50) {
f.second_grad.selectedIndex=3;
}

if (f.third_per.value>=60) {
f.third_grad.selectedIndex=1;
}
else if(f.third_per.value>=50 && f.third_per.value<=60) {
f.third_grad.selectedIndex=2;
}
else if(f.third_per.value<=50) {
f.third_grad.selectedIndex=3;
}
}

