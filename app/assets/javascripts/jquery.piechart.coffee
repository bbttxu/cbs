$ = jQuery
$.fn.piechart = (options) ->

  defaults =
    type: 'pie'
    sliceColors: ['#a9ceb0','yellow']

  options = $.extend(defaults, options)
  @each ->
    data = [options.volunteer, options.visitor]
    $(this).sparkline(data, options)
