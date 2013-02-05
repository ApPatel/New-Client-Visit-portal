
$(function(){
    if($("#devise_notice").text() != ""){
        createDialog("<h3 class='heading3 alert-message'>"+ $("#devise_notice").text() +"</h3>");
        $("#devise_notice").remove();
    }
    if($("#devise_alert").text() != ""){
        createDialog("<h3 class='heading3 alert-message'>"+ $("#devise_alert").text() +"</h3>");
        $("#devise_alert").remove();
    }
    function createDialog( message) {
        $.colorbox({
            html : message,
            transition: 'fade',
            width: 600,
            height: 130,
            scrolling: false
        });
        setTimeout(function() {
            $.colorbox.close();
        }, 2000);
    }

});




$(function() {

    $( "#visit_Date, #Agenda_Date" ).datepicker({
        showOn: "button",
        buttonImage: "/assets/calendar_icon.jpg",
        buttonImageOnly: true,
        changeMonth: true,
        changeYear: true,
        numberOfMonths: 1,
        showAnim: 'fold',
        dateFormat: $.datepicker.ISO_8601
        
    });

});




$(function() {
  $("#visits thead, #visits .pagination").on("click", "a", function() {
    $.getScript(this.href);
    return false;
  });
  $("#visits_search input").keyup(function() {
    $.get($("#visits_search").attr("action"), $("#visits_search").serialize(), null, "script");
    return false;
  });
});
