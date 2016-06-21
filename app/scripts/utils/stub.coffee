define (require, exports, module) ->
  _ = require 'underscore'
  stub = {}

  stub.actions = [
    {
      id: 1
      title: 'Test 1'
      rest_time: 428
      recovery_time: 600
      points: 10
    }
    {
      id: 2
      title: 'Test 2'
      rest_time: 200
      recovery_time: 660
      points: 20
    }
    {
      id: 3
      title: 'Test 3'
      rest_time: 10
      recovery_time: 480
      points: 30
    }
    {
      id: 4
      title: 'Test 4'
      rest_time: 20
      recovery_time: 500
      points: 40
    }
  ]

  stub.action_by_id = {
    status: 'ok'
  }

  stub
