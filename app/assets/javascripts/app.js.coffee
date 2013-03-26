# app.js.coffee
$ = jQuery

$ ->
	$(document).foundationTopBar()
	# $(document).foundationTabs();

$ ->
	# $.getJSON "/volunteers.json", (data)->
	# 	# console.log data
	$('form.new_session').each (i,m) ->
		$m = $(m)
		$m.find('input.search-query').each (j,n)->


			$(n).autocomplete
				source: $(n).data('autocomplete-source')
				# source: data
				select: (event, ui) ->
					selectedObj = ui.item
					$('input.search-query', m).val(selectedObj.label)
					$('input.volunteer-id', m).val(selectedObj.value)
					false
