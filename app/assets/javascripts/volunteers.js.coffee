# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ = jQuery



activate_index = (event) ->
	# $('#scrollbar2').scrollTop(300)
	$('#scrollbar2 dd.active').removeClass "active"
	$(this).parent('dd').toggleClass "active"
	# console.log event

$(document).ready ()->
	$('#scrollbar2 a').click activate_index