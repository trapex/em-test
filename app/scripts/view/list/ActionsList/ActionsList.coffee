define (require, exports, module)->
  _List = require '../_List'
  ActionsItem = require '../ActionsItem/ActionsItem'
  ActionsCollection = require 'collection/ActionsCollection'

  ActionsList = _List.extend
    template: '#ActionsList'
    className: 'actions_list'
    itemView: ActionsItem

    bindings:
      ':el': 'collection: $collection'

    initialize: ->
      @collection ?= new ActionsCollection
      #@collection.view = @itemView #if use backbone.epoxy < 1.2
      @collection.refresh()