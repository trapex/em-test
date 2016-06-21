define ['sp-utils-serverclient', 'utils/stub'], (ServerClient, stub)->
  class ServerAPI extends ServerClient
    initialize: ->

    _isServer: -> false #can using stubs

    get_actions: ->
      @get {
        url: 'api/actions'
        stub: (async) ->
          async.resolve stub.actions
      }

    # get_action: (id) ->
    #   @get {
    #     url: "/api/actions/#{id}"
    #     stub: (async)->
    #       async.resolve stub.actions[id-1]
    #   }

    post_action: (id) ->
      @get {
        url: "/api/actions/#{id}"
        data:
          id
        stub: (async)->
          async.resolve stub.action_by_id
      }
