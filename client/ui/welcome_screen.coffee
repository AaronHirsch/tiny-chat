
{ Meteor } = require 'meteor/meteor'
{ Template } = require 'meteor/templating'

ChatRooms = require '../../collections/chat_rooms'

require('./welcome_screen.jade')


Template.welcome_screen.onCreated ->
  Meteor.subscribe 'users'
  Meteor.subscribe 'chat_rooms'


Template.welcome_screen.helpers
  rooms: ->
    query = unless Meteor.user()? then { private: false } else {}
    ChatRooms.find(query, { sort: { private: 1 } })

