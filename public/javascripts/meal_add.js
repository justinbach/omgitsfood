$(document).ready(function() { 
  // only enable recipe-dropdown submit when a recipe's been selected
  $('#recipePickerForm select').bind('change',validateRecipeChoice);
  validateRecipeChoice();
  setUpAutogrow();
  function validateRecipeChoice()
  {
    if($('#recipePickerForm select').val() == '')
      $('#recipePickerForm input[type=submit]').attr('disabled','disabled'); 
    else
      $('#recipePickerForm input[type=submit]').removeAttr('disabled');
  }
  
  // autogrow text areas
  function setUpAutogrow() {
    $('textarea').autogrow({
      minHeight: '100px',
      maxHeight: '500px'
    });
  }
  
  // ajax for scraping magic
  recipeLink = '';
  setInterval(checkForRecipeChange, 100);
  
  function checkForRecipeChange()
  {
    if($("#meal_recipe_attributes_link").val() != recipeLink) {
      recipeLink = $("#meal_recipe_attributes_link").val();
      doAjaxRecipeScraping();
    }
  }
  
  function doAjaxRecipeScraping() {
    $.ajax({
      url: '/recipe_by_link',
      data: ({link : $("#meal_recipe_attributes_link").val()}),
      dataType: 'json',
      success: function(data) {
        $("#meal_recipe_attributes_title").val(data.title);
        $("#meal_recipe_attributes_directions").val(data.directions);
        $("#meal_recipe_attributes_ingredients").val(data.ingredients);
        $("#meal_recipe_attributes_yield").val(data.yield);
        setUpAutogrow();
      }
    });    
  }
});