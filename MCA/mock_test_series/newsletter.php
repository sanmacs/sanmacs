<?php
error_reporting(E_ALL^ E_NOTICE);  
@extract($_POST);
if($_POST){
	 if($_GET["tag"]=='news'){
		$list = "\n" . "N/A," . $name . "," . $email . "," . $contact. "," . $city . "\t";
		$message = "Name: " . $name . "<br><br>Email-ID: " . $email . "<br><br>Address:" . $contact . "<br><br>Contact No:" . $query;
	
	} else{
		$list = "\n" . $name . "," . $email . "," . $contact . "," . $city . "\t";
		$message = "Name: " . $name . "<br><br>Email-ID: " . $email . "<br><br>Contact:" . $contact. "<br><br>City:" . $city;
	}  }
	//Mail
	$to1 = "nikunj@spademark.com,mailnikunjamlani@gmail.com,sumit@spademark.com,sumit.dhand@gmail.com";
	$email1="leads@spademark.com";
	$subject ="Online lead generated for Sanmacs India";
	$headers  = 'MIME-Version: 1.0' . "\r\n";
	$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
	$headers .= 'From: <'.$email1.'>' . "\r\n";
	$headers .= "Bcc: $to1\r\n";	
	$to = "sanmacsindia@gmail.com";
	@mail($to,$subject, $message, $headers);
	
	$to2 = "nikunj@spademark.com,mailnikunjamlani@gmail.com,sumit@spademark.com,sumit.dhand@gmail.com,sanmacs@gmail.com";
	$headers2  = 'MIME-Version: 1.0' . "\r\n";
	$headers2 .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
	$headers2 .="From: sanmacsindia@gmail.com \r\n";
	$headers2 .= "Bcc: $to2\r\n";	
	$subject2 ="Thank you for showing interest in Sanmacs India to be your MCA guru!";
	$message2 ="<html>
  <head>
    <title>
      Greeting From Sanmacs India
    </title>
  </head>
  <body>
    <p>
      Dear Student,
      <br /><br><br>
      Thank you for showing interest in Sanmacs India to be your MCA guru! You are  now just a call away from enrolling at the best MCA coaching institute in the  country. 
      <br />
      Our counseling team will soon review your information and  will promptly revert to guide you through the enrollment process. Below are the  details that you had submitted: 
    </p>
    Name: $name 
    <br />
    Email-ID: $email
    <br />
    Contact: $contact
    <br />
    City: $city
    <br />
    <p>
      If the above information is incorrect, then kindly fill up the form again from here:
      <a href='http://goo.gl/2dLMI'>
        click here
      </a>
      <br />
      <br />
      Meanwhile, if you want to get in touch with us then call upon at +91  9266673166.
      <p>
        We are extremely proud of our ex-students who have  performed brilliantly and have got admissions to the top MCA colleges of the  country. To know more:<a href='http://goo.gl/Vgw6M'>click here</a>
    </p>
    <p>
      Thank you!
      <br />
      Team Sanmacs
      <br />
      <a href='http://www.sanmacs.com'>
        www.sanmacs.com
      </a>
      <br />
      <a href='http://www.facebook.com/sanmacs94'>www.facebook.com/sanmacs94
    
      </a>
    </p>
  </body>
</html>";
//@mail($to , $subject2, $message2, $headers2);
@mail($email , $subject2, $message2, $headers2);

//Mail
 echo "<script language='javascript' type='text/javascript'>
location.replace('http://sanmacs.com/mca-entrance-preparation-in-delhi/thanks.html');
</script>";
?>