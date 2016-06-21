define (require, exports, module)->
  _Page = require '../_Page'
  ActionsList = require 'view/list/ActionsList/ActionsList'
  UserModel = require 'model/UserModel'

  IndexPage = _Page.extend
    template: '#IndexPage'
    className: 'index_page'

    ui:
      score: '[data-js-count]'

    bindings:
      '@ui.score': 'text: current_points'

    regions:
      actions:
        el: '[data-js-actions]'
        view: ActionsList

    initialize: ->
      @model = new UserModel
      @listenTo @r.actions.collection, 'change:lock', @onChangeScore

    onChangeScore: (item) ->
      return unless item.get 'lock'
      current_points = @model.get('current_points') + item.get('points')
      @model.set {current_points}
      #отправка на сервер изменения колиечства баллов у текущего пользователя
