<?php
error_reporting(E_ALL^ E_NOTICE);  
@extract($_POST);
if($_POST){
	 if($_GET["tag"]=='news'){
		$list = "\n" . "N/A," . $name . "," . $email . "," . $contact . "," . $city . "," . $course . "\t";
		$message = "Name: " . $name . "<br><br>Email-ID: " . $email . "<br><br>Address:" . $contact . "<br><br>Contact No:" . $query;
	
	} else{
		$list = "\n" . $name . "," . $email . "," . $contact . "," . $city . "," . $course . "\t";
		$message = "Name: " . $name . "<br><br>Email-ID: " . $email . "<br><br>Contact:" . $contact. "<br><br>City:" . $city. "<br><br>Course:" . $course;
	} 
	$message.="<br><br>Please download CSV by this link <a href=\"http://sanmacs.com/mca-entrance-tamil/download-pp-csv.php\">Click here</a>";
	$file = "sanmacs.csv";
	$FileHandle = fopen($file, 'a+') or die("can't open file");
	fwrite($FileHandle, $list);
	fclose($FileHandle);	}
	//Mail
	$to1 = "nikunj@spademark.com,mailnikunjamlani@gmail.com,sumit@spademark.com,sumit.dhand@gmail.com,rachit@spademark.com";
	$email1="leads@spademark.com";
	$subject ="Online lead generated for Sanmacs Virtual Classes";
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
      Thank you for showing interest in Sanmacs India as your MCA entrance guru. Our exclusive MCA entrance e-learning program is initiated by our time honored, meritorious institute to benefit all the MCA aspirants who are willing to learn from the comfort zone of their home, eschewing the tedious task of travelling and reaping the boundless academic dissemination. Our online coaching features interactive classes in which trainers and students can interact with each other. 
      <br />
      Sanmacs India has created its immaculate forte as the nation’s premier MCA Entrance Coaching institute. Over the years, we have consistently delivered excellent results in MCA Entrance Coaching. We are extremely proud of our ex-students who have got admission at the top MCA colleges of the country. To know more about the outstanding performances of our students,
	  <a href='http://www.sanmacs.com/MCA/mca_entrance_voyage_of_success/sanmacs_results_in_mca_entrances/data_representation_of_result/sanmacs_voyage_of_success_in_year_2013.htm'>click here</a>. 
	  <br/></br>
	  As a part of the registration process, our counseling team will soon review your information and will promptly revert to guide you through the enrollment process. Below are the details that you had submitted:
    </p>
    Name: $name 
    <br />
    Email-ID: $email
    <br />
    Contact: $contact
    <br />
    City: $city
    <br />
	Course: $course
    <br />
    <p>
    If the above information is incorrect, then kindly fill up the form again: 
      <a href='http://sanmacs.com/mca-entrance-tamil/'>
        click here
      </a>
      <br />
      <br />
      We thank you again for showing your interest in Sanmacs India. If you want to get in touch with us, please call at +91 9266673166.
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
location.replace('http://sanmacs.com/mca-entrance-tamil/thanks.html');
</script>";
?>