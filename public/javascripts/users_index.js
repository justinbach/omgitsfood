$(document).ready(function() {
  
  // state tracking
  showingFollowedUsers = true;
  
  $("#followedUsersLink").click(function() {
    checkFlash();
    if(showingFollowedUsers) return;
    $("#otherUsersLink").removeClass('active');
    $("#followedUsersLink").addClass('active');
    fadeOutFadeIn('#otherUsers','#followedUsers');
    showingFollowedUsers = true;
    return false;
  });
  $("#otherUsersLink").click(function() {
    checkFlash();
    if(!showingFollowedUsers) return;
    $("#followedUsersLink").removeClass('active');
    $("#otherUsersLink").addClass('active');
    fadeOutFadeIn('#followedUsers','#otherUsers');
    showingFollowedUsers = false;
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