$ = jQuery
$.fn.piechart = (options) ->

  defaults =
    type: 'pie'
    sliceColors: ['#a9ceb0','#FFF6D1']

  options = $.extend(defaults, options)
  @each ->
    data = [options.volunteer, options.visitor]
    $(this).sparkline(data, options)
