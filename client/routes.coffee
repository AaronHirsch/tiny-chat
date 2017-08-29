
{ FlowRouter } = require 'meteor/kadira:flow-router'
{ BlazeLayout } = require 'meteor/kadira:blaze-layout'

require './ui/welcome_screen'
require './ui/chat_room'

BlazeLayout.setRoot('.content')

FlowRouter.route '/welcome',
  name: 'Welcome',
  action: ->
    BlazeLayout.render('welcome_screen')

FlowRouter.route '/room/:_id',
  name: 'ChatRoom',
  action: (params) ->
    BlazeLayout.render('chat_room', params)

FlowRouter.notFound =
  action: (params) ->
    FlowRouter.go('Welcome', params)

