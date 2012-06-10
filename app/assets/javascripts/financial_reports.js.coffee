# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class Item
  constructor: (@item) ->
    @name = @item.item_key
    @values = ko.observableArray @item.values
    @growth_name = @item.growth_key
    @growth_values = @item.growth_values
    

class Group
  constructor: (@group) ->
    @name = @group.group_key
    @items = ko.observableArray []
    @last_item = ko.observable()
    this.buildItems()
  
  buildItems: ->
    mappedItems = $.map @group.items, (item) ->
      new Item item
    @last_item = mappedItems.slice(-1)[0]
    mappedItems.pop()
    @items mappedItems

class window.FinancialReportTable
  constructor: (@data) ->
    @periods = ko.observableArray @data.statement.periods
    @groups = ko.observableArray []
    this.buildGroups()
  
  buildGroups: ->
    mappedGroups = $.map @data.statement.groups, (group) ->
      new Group group
    @groups mappedGroups
    
window.ToggleFinancialReportTableRows = 
  init: ->
    @buttons = $('#toggle_row_buttons button')
    @active_button = $('#toggle_row_buttons button.active')
    @all_rows = $('table.financial_statements tbody tr.toggle_row')
    this.toggleRows()
    
  toggleRows: ->
    that = this
    @buttons.on 'click', ->
      showClass = $(this).data 'row'
      if showClass == 'all'
        that.all_rows.show()
      else
        that.all_rows.hide().each ->
          $(this).show() if $(this).hasClass showClass
    @active_button.trigger 'click'