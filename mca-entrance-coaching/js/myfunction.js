  $(document).ready(function() {
    $(".tabLink").each(function(){
      $(this).click(function(){
        m = $(this).attr('id');
        $(".tabLink").removeClass("activeLink");
        $(this).addClass("activeLink");
        $(".tabcontent").addClass("hide");
        $("#"+m+"-1").removeClass("hide")   
        return false;	  
      });
    });  
  });
  
  /************************bnr js ***************************/
  
  
  $(document).ready(function(){
		$('#demo-slideshow').slidey({
			'width' : 691,
			'height' : 357,
			'showMarkers' : true,
			'showControls' : true,
			'centerMarkers' : false,
			'centerControls' : false
		});
	});
	
	  /************************ text fed up  ***************************/
	  
	  $(document).ready(function(){
		$('#fade').list_ticker({
			speed:4000,
			effect:'fade'
		
		});		
	})
