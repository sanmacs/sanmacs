$(document).ready(
    function ()
    {   
        $(".siteNavLi").find("div > ul a:last").addClass("viewAll");
        
        $(".siteNavLi").hover(
            function() {
                this.canShow=true;   
                var show=showFunctionBuilder($(this),this);
                setTimeout(show,250);
                clearTimeout(this.closeTimer); 
            },
            function(){
                this.canShow=false; 
                var close=closeFunctionBuilder(this);
                if(navigator.userAgent.indexOf("Safari")>0)  this.closeTimer = setTimeout(close,200);// only for safari
                else this.closeTimer = setTimeout(close,50);
            }	    
       );

    }
); 

//adjust the width of menu tabs
function adjustTabWidth(){
    var menuWidth = 0;
    var minWidth = 945;//the min width of top navigation
    var maxWidth = 945;// the max width of top navigation
    $(".siteNavLi").each(function(i){
       menuWidth += $(this).width();//get the real width of top menu
    }); 

    var avgPaddingGap = Math.floor((minWidth - menuWidth) / $(".siteNavLi").length);//get the avg space
    var newMenuPaddingLeft = Math.floor(avgPaddingGap/2) + parseInt($(".siteNavLi").find(".menuTitle").parent().css("padding-left").replace("px",""));//get new left padding
    var newMenuPaddingRight = Math.ceil(avgPaddingGap/2) + parseInt($(".siteNavLi").find(".menuTitle").parent().css("padding-right").replace("px",""));//get new right padding
    
    if (newMenuPaddingLeft>=0 && newMenuPaddingRight>=0){
        //if the free space is enough to be assign to each menu
        $(".siteNavLi").find(".menuTitle").parent().css({"padding-left":newMenuPaddingLeft + "px", "padding-right":newMenuPaddingRight + "px"});//reset the padding of each menu to fix the width of top navigation
        restGap = Math.floor(minWidth - $(".siteNavRightBg").width());//assign the rest of space into the last menu
        $(".siteNavLi:last").find(".menuTitle").parent().css({"padding-left":newMenuPaddingLeft + Math.floor(restGap/2) + "px", "padding-right":newMenuPaddingRight + Math.ceil(restGap/2) + "px"});
        $("#siteNav").css("width",minWidth + "px");
    }
    else{
        //increase the width of top navigation to max 1500px
        $("#siteNav").css("width",menuWidth<945?menuWidth + "px":maxWidth + "px");
    }
    initBlueArrow();
}

//show the children menu
function showChildren(obj,objSelected)
{
   if(objSelected.canShow)
   { 
        var secNavHeight=obj.find(".secNavContent > ul").height() > obj.find(".secNavContent > dl").height() ? obj.find(".secNavContent > ul").height():(obj.find(".secNavContent > dl").height());
        obj.find(".siteSecondNav").height(secNavHeight+40);
        obj.find(".siteSecondNav1").height(secNavHeight+40);
        obj.find(".siteNavIframe").height(secNavHeight);

        obj.find(".siteSecondNav").css("visibility","visible");
        obj.find(".siteSecondNav1").css("visibility","visible");		
        obj.find(".siteNavIframe").css("visibility","visible");
        obj.find(".secNavContent").css("visibility","visible");
        obj.find(".siteNavLink").addClass("selected");
        showBlueArrow(obj);
    } 
}    

function closeChildren(objSelected)
{
    $(objSelected).find(".siteSecondNav").css("visibility","hidden");    
    $(objSelected).find(".siteSecondNav1").css("visibility","hidden");  	
    $(objSelected).find(".siteNavIframe").css("visibility","hidden");  
    $(objSelected).find(".secNavContent").css("visibility","hidden");
    $(objSelected).find(".siteNavLink").removeClass("selected");
    hideBlueArrow($(objSelected));
}

function showFunctionBuilder(obj, objSelected)
{
    return function(){
       showChildren(obj,objSelected);
   } 
} 

function closeFunctionBuilder(objSelected)
{
    return function(){
       closeChildren(objSelected);
   } 
} 


function initBlueArrow(){
    $(".siteNavLinkArrow").each(function(i){
       $(this).css("width",$(this).parent().width() + "px");
    });
}
function showBlueArrow(obj){
    $(".siteNavLinkArrow").css("visibility","hidden");
    obj.find(".siteNavLinkArrow").css("visibility","visible");
}
function hideBlueArrow(obj){
    obj.find(".siteNavLinkArrow").css("visibility","hidden");
    $(".siteNavLinkSelected").find(".siteNavLinkArrow").css("visibility","visible");
}

