define (require, exports, module)->
  _List = require '../_List'
  
  ActionsItem = _List.extend
    template: '#ActionsItem'
    
    className: 'b-actions-item'

    ui:
      image: '[data-js-image]'
      rest_time: '[data-js-rest-time]'

    bindings:
      ':el': 'classes:{lock:lock}'
      '@ui.image': 'id_class: id'
      '@ui.rest_time': 'text: timeStr'

    bindingHandlers:
      id_class: ($el, val) ->
        $el.addClass "b-actions-item--image__#{val}"

    events:
      'click @ui.image': 'onItemClick'

    onItemClick: (e) ->
      return if $(e.target).hasClass 'lock'
      @model.startRest()

