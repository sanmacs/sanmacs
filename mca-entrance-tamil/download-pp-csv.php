<?php
   $filepath = "sanmacs.csv";
   header("Pragma: public");
   header("Expires: 0");
   header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
   //setting content type of page
   header("Content-Type: application/csv");
   header("Content-Disposition: attachment; filename=".basename($filepath ));
   header("Content-Description: File Transfer");
   @readfile($filepath);
?>