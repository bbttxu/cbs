# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ = jQuery

throttle = (fn, delay = 10)->
  timer = null
  ()->
    context = this
    args = arguments
    clearTimeout(timer)
    timer = setTimeout ()->
      fn.apply(context, args)
    , delay

handle_listing_scroll = (event) ->
	# ideally anything below zero should work, but there's some wiggle room around zero
	upper_allowed_value = 10
	position = upper_allowed_value
	letter = 'a'
	$('#scrollbar1 ul li.divider').each (i, m)->

		$m = $(m)
		top = $m.position().top
		id = $m.attr 'id'

		if top <= upper_allowed_value
			if position is upper_allowed_value
				position = top 
				letter = id
			if position < top
				position = top 
				letter = id
	activate_index $('#index_' + letter )

click_index = (event)->
	activate_index $(this)

activate_index = (element) ->
	$parent = element.parent('dd')
	$parent.siblings('dd.active').removeClass "active"
	$parent.addClass "active"


$(document).ready ()->
	$('#scrollbar1').on 'scroll', throttle handle_listing_scroll
	$('#scrollbar2 a').on 'click', click_index