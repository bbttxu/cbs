# app.js.coffee
$ = jQuery

$ ->  
	$(document).foundationTopBar()
	$(document).foundationTabs();

$ ->  
	# $.getJSON "/volunteers.json", (data)->
	# 	# console.log data
	$('#volunteer_search').autocomplete	
		source: $('#volunteer_search').data('autocomplete-source')
		# source: data
		select: (event, ui) ->
			selectedObj = ui.item
			$('#volunteer_search').val(selectedObj.label)
			$('#session_volunteer_id').val(selectedObj.value)
			false
