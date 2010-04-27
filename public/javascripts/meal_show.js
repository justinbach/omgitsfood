$(document).ready(function() { 
  // datepicker for meal reassignment
  $("#meal_day").datepicker();
  $("#rescheduleLink").click(function() {
    $("#meal_day").focus();
  });
  $("#meal_day").bind("change", function() { $('form.edit_meal').submit(); });
});