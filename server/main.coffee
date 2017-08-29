
Meteor = require('meteor/meteor').Meteor

Utils = require './utils'

ChatRooms = require('../collections/chat_rooms')
Messages = require('../collections/messages')
Users = Meteor.users

Meteor.startup ->

  Utils.createDemoDataIfRequired ->
    Meteor.publish 'chat_rooms', ->
      return ChatRooms.find({ private: false }) unless @userId
      ChatRooms.find({}, { sort: { private: 1 } })

    Meteor.publish 'chat_room_with_content', (_id) ->
      return [
        ChatRooms.find({ _id })
        Messages.find({ chat_room: _id })
      ]

    Meteor.publish 'users', ->
      Users.find {}, { fields: { name: 1, username: 1 } }

