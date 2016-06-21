define (require, exports, module)->
  Backbone = require 'backbone'
  ActionsModel = require 'model/ActionsModel'

  ActionsCollection = Backbone.Collection.extend
    model: ActionsModel

    refresh: ->
      common.api.get_actions()
      .done (data) =>
        @add data, {parse: true}
