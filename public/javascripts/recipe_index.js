$(document).ready(function() {
  
  // state tracking
  showingYourRecipes = true;
  
  $("#yourRecipesLink").click(function() {
    checkFlash();
    if(showingYourRecipes) return;
    $("#otherRecipesLink").removeClass('active');
    $("#yourRecipesLink").addClass('active');
    fadeOutFadeIn('#otherRecipes','#yourRecipes');
    showingYourRecipes = true;
    return false;
  });
  $("#otherRecipesLink").click(function() {
    checkFlash();
    if(!showingYourRecipes) return;
    $("#yourRecipesLink").removeClass('active');
    $("#otherRecipesLink").addClass('active');
    fadeOutFadeIn('#yourRecipes','#otherRecipes');
    showingYourRecipes = false;
    return false;
  });
  
  function checkFlash() {
    $("#flash").css("display","none");
  }
  
  function fadeOutFadeIn(toFadeOut,toFadeIn) {
    fadeSpeed = 200;
    $(toFadeOut).fadeOut(fadeSpeed, function() {

      $(toFadeIn).fadeIn(fadeSpeed);
    });
  }
})