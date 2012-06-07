# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class window.Chartify
  constructor: (@path, @period_type, @methods, @div) ->
    @params =
      period_type: @period_type
      methods: @methods
    this.drawChart()
    
  drawChart: ->
    $.getJSON @path, @params, (data) ->
      theData = google.visualization.arrayToDataTable data
      chart = new google.visualization.SteppedAreaChart @div
      chart.draw theData, {}