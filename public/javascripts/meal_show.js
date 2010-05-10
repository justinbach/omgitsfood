$(document).ready(function() { 
  // datepicker for meal reassignment
  $("#meal_day").datepicker();
  $("#rescheduleLink").click(function() {
    $("#meal_day").focus();
  });
  $("#meal_day").bind("change", function() { $('form.edit_meal').submit(); });
  
  // autogrow review form
  setUpAutogrow();
  
  // autogrow text areas
  function setUpAutogrow() {
    $('textarea').autogrow({
      minHeight: '100px',
      maxHeight: '500px'
    });
  }
  
  // logic for hiding/showing review form
  $("#editReviewLink").click(function() {
    $(".review").fadeOut('300', function() {
      $('#editReview').css('display','block');
      $('#editReview').fadeIn('300');
    })
    return false;
  });
  
});