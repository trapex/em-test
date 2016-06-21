define (require, exports, module)->
  Backbone = require 'backbone'
  require 'epoxy'

  UserModel = Backbone.Epoxy.Model.extend

    defaults:
      current_points: 98

    #parse:(r)->
    #  r
