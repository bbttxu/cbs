# app.js.coffee
$ = jQuery

$ ->  
	$(document).foundationTopBar()
	# $(document).foundationTabs();

$ ->  
	# $.getJSON "/volunteers.json", (data)->
	# 	# console.log data
	$('form.new_session input.search-query').each (i,m) ->


		$(m).autocomplete	
			source: $(m).data('autocomplete-source')
			# source: data
			select: (event, ui) ->
				selectedObj = ui.item
				$('#volunteer_search').val(selectedObj.label)
				$('#session_volunteer_id').val(selectedObj.value)
				false
