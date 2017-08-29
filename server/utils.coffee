
Meteor = require('meteor/meteor').Meteor

_ = require('lodash')
async = require('async')
sentence = require('random-sentence')

ChatRooms = require('../collections/chat_rooms')
Messages = require('../collections/messages')
Users = Meteor.users

module.exports = Utils =

  createDemoDataIfRequired: (fn) ->
    chat_rooms = ChatRooms.find({})
    messages = Messages.find({})
    users = Users.find({})

    hasData = [chat_rooms, messages, users].every (collection) ->
      collection.count() isnt 0

    return fn() if hasData

    console.log 'CREATING DEMO DATA'

    # Just to make sure we have a clean install
    ChatRooms.remove({})
    Messages.remove({})
    Users.remove({})

    ROOMS = ['General', 'Work', 'News', 'Random']
    USER = ['John', 'Johnny']

    users = USER.map (username) ->
      Accounts.createUser({ username, password: 'asdfasdf' })

    rooms = ROOMS.map (name, i) ->
      ChatRooms.insert({ name, private: i % 2 isnt 0 })

    Array.from(Array(_.random(50, 100)).keys()).forEach ->
      Messages.insert({
        chat_room: _.sample(rooms)
        author: _.sample(USER)
        content: sentence({ min: 4, 15 })
      })

    fn()

