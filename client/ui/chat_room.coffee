
{ Template } = require 'meteor/templating'
{ FlowRouter } = require 'meteor/kadira:flow-router'
{ Meteor } = require('meteor/meteor')
{ Tracker } = require('meteor/tracker')

ChatRooms = require('../../collections/chat_rooms')
Messages = require('../../collections/messages')
Users = Meteor.users

require('./chat_room.jade')
require('./message.jade')


Template.chat_room.onCreated ->
  _id = @data._id()
  Meteor.subscribe 'chat_room_with_content', _id, ->
    Tracker.autorun ->
      room = ChatRooms.findOne({ _id })
      isLoggedIn = Meteor.user()?
      FlowRouter.go('Welcome') if not isLoggedIn and room.private


Template.chat_room.helpers
  messages: ->
    Messages.find({ chat_room: @_id() })

  chat_room: ->
    ChatRooms.findOne({ _id: @_id() })


Template.chat_room.events
  'submit form': (event) ->
    event.preventDefault()
    target = event.target
    content = target.content.value
    author = target.author.value
    chat_room = target.chat_room.value
    Messages.insert({ content, author, chat_room })
    target.content.value = ''

