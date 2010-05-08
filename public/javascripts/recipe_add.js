$(document).ready(function() { 
  
  setUpAutogrow();
  
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
    if($("#recipe_link").val() != recipeLink) {
      recipeLink = $("#recipe_link").val();
      doAjaxRecipeScraping();
    }
  }
  
  function doAjaxRecipeScraping() {
    $.ajax({
      url: '/recipe_by_link',
      data: ({link : $("#recipe_link").val()}),
      dataType: 'json',
      success: function(data) {
        $("#recipe_title").val(data.title);
        $("#recipe_directions").val(data.directions);
        $("#recipe_ingredients").val(data.ingredients);
        $("#recipe_yield").val(data.yield);
        setUpAutogrow();
      }
    });    
  }
});