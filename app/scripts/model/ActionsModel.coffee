define (require, exports, module)->
  Backbone = require 'backbone'
  require 'epoxy'

  ActionsModel = Backbone.Epoxy.Model.extend

    defaults:
      id: 0
      title: ''
      rest_time: 0
      recovery_time: 0
      points: 0
      lock: false

    __restTime: 0

    __addLeadZero: (number)->
      leadZero = if  number < 10 then '0' else ''
      "#{leadZero}#{number}"

    computeds:
      timeStr:
        deps: ['rest_time']
        get: (rest_time) ->
          minutes = Math.floor rest_time/60
          seconds = rest_time%60
          "#{@__addLeadZero minutes}:#{@__addLeadZero seconds}"

    tick: ->
      timer = @get 'rest_time'
      timer -= 1
      @set 'rest_time' , timer

    startRest: ->
      @__restTime = @get 'rest_time'
      common.api.post_action(@get 'id')
      .done (data) =>
        if data.status is 'ok'
          @startTick()

    startTick: ->
      @set {lock: true}
      @timer = setTimeout =>
        @tick()
        if parseInt(@get('rest_time')) > 0
          @startTick()
        else @finishRest()
      , 1000

    finishRest: ->
      return unless @get 'lock'
      @set {
        lock: false
        rest_time: @__restTime
      }
      return unless @timer
      clearTimeout @timer
      @timer = null
      @__restTime = 0

    #parse:(r)->
    #  r
