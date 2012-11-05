# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->  
  $("#new_card").submit ->
    btn = $("#new_card_submit")
    btn.prop "disabled", true
    btn.addClass "disabled"

  $("#cardModal").on "hidden", ->
    $("#new_card").find('textarea, #card_code, #card_points').val ""
    btn = $("#new_card_submit")
    btn.prop "disabled", false
    btn.removeClass "disabled"
    $(".error_card").remove()

  $("#project_collaborator_ids").select2
    width: "220px"