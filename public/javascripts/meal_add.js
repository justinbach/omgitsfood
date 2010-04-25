$(document).ready(function() { 
  // only enable recipe-dropdown submit when a recipe's been selected
  $('#recipePickerForm select').bind('change',validateRecipeChoice);
  validateRecipeChoice();
  function validateRecipeChoice()
  {
    if($('#recipePickerForm select').val() == '')
      $('#recipePickerForm input[type=submit]').attr('disabled','disabled'); 
    else
      $('#recipePickerForm input[type=submit]').removeAttr('disabled');
  }
  
});