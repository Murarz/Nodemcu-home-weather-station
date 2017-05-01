$(document).ready(function() {
    
    $(".topnav").hide();
    $(".topnav").show(1000);
    
    
    $('.topnav a').hover(
    function() {
     $(this).stop().fadeTo('fast', 1);
    },
    function() {
     $(this).stop().fadeTo('fast', .8); 
    });

    



});
