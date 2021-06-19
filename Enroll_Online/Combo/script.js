function inputFocus(i){
    if(i.value==i.defaultValue){ i.value=""; i.style.color="#000"; }
}
function inputBlur(i){
    if(i.value==""){ i.value=i.defaultValue; i.style.color="#888"; }
}
 

function shw_Time(aval) {
if (aval == 1) {

document.getElementById("M3").style.display='none';
document.getElementById("M4").style.display='block';
document.getElementById("M2").style.display='block';
} 
else if(aval == 2 || aval == 3) 
{
document.getElementById("M4").style.display='none';
document.getElementById("M2").style.display='block';
document.getElementById("M3").style.display='block';
}
else 
{
document.getElementById("M4").style.display='none';
document.getElementById("M3").style.display='none';
document.getElementById("M2").style.display='none';
}

} 







	        
	        	 


function testForm() {

	if (FirstName()  && Mailadd() && Mobile() && Email() && colAndCourse() && Passing_Year() && Batch_Preferences() ){
	   alert("Form Ready to Submit!!!");
	   document.onlinefrm.submit();
	   }
}


function FirstName()

 {
	  var firstname=document.getElementById("firstname");
      
      
     
      if(firstname.value == "First Name")
    	  {
    	  alert("First Name should not be empty");
    	  firstname.focus();
    	  return false;
    	  }
      else
	  
	  return true;
	  
	  
 }
 
 
function LastName()
{
	var lastname=document.getElementById("lastname");
      if(lastname.value=="Last Name")
	  {
	  alert("Last Name should not be empty");
	  lastname.focus();
	  return false;
	  }
       else
	  
	  return true;  
}
         
         
 function Mailadd()
{
	var address=document.getElementById("address");
      if(address.value=="")
	  {
	  alert("Address should not be empty");
	  address.focus();
	  return false;
	  }
	 
       else
	  
	  return true;  
}
        
function Mobile()
{
	var mobile=document.getElementById("mobile");
	var numbers = /^[0-9]+$/;
    if(!numbers.test(mobile.value))
        	 {
        	 alert ("Give a mobile number and it must be numeric value");
			 mobile.focus();
        	 return false;
        	 }
             else
	  
	  return true;  
}


function Email()
{
	var email=document.getElementById("email");
	var con_email=document.getElementById("con_email");
var validRegExp =  /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
   if(email.value =="")
		 {
		 alert("Email should not be empty");
		 email.focus();
		 return false;
		 }
         
        else if(!validRegExp.test(email.value))
         {
         alert("This is not a valid email address");
		 email.focus();
         return false;
         }
		 else if(email.value != con_email.value)
         {
         alert("E-Mail address does not match");
		 con_email.focus();
         return false;
         }
		  else
	  
	  return true;  
}

function DOB()
{
	var dob_date=document.getElementById("dob_date");
	var dob_mm=document.getElementById("dob_mm");
	var dob_year=document.getElementById("dob_year");
	if(dob_date.value =="Date" )
		 {
		 alert("Date should not be empty and must less then 31");
		 dob_date.focus();
		 return false;
		 }
		 else if(dob_mm.value =="")
		 {
		 alert("Select a month");
		 
		 return false;
		 }
		  else if(dob_year.value =="Year")
		 {
		 alert("Year should not be empty");
		 dob_year.focus();
		 return false;
		 }
		  else
	  
	  return true;  
}

function colAndCourse()
{
	var graduation_college=document.getElementById("graduation_college");
	var graduation_course=document.getElementById("graduation_course");
	
    if(graduation_college.value =="")
        	 {
        	 alert ("Give your Graduation College name");
			 graduation_college.focus();
        	 return false;
        	 }
			 else if(graduation_course.value =="")
			 {
        	 alert ("Give your graduation course name");
			 graduation_course.focus();
        	 return false;
        	 }
             else
	  
	  return true;  
}

function Passing_Year()
{
	var year_pass=document.getElementById("year_pass");
	
    if(year_pass.value =="")
        	 {
        	 alert ("Select Year of Passing");
			 year_pass.focus();
        	 return false;
        	 }
             else
	  
	  return true;  
}

function Batch_Preferences()
{
	var preferred_Study_Centre=document.getElementById("preferred_Study_Centre");
    if(preferred_Study_Centre.value =="")
        	 {
        	 alert ("Select your preferred study centre");
			 preferred_Study_Centre.focus();
        	 return false;
        	 }
			 
             else
	  return true;  
}


