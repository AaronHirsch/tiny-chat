Meteor = require('meteor/meteor').Meteor

Users = Meteor.users

Messages = new Mongo.Collection 'messages'

Messages.allow
  insert: -> true,
  update: -> false,
  remove: -> false

Messages.deny
  insert: -> false,
  update: -> true,
  remove: -> true

Messages.schema = new SimpleSchema
  _id:
    type: String
    regEx: SimpleSchema.RegEx.Id

  chat_room:
    type: String,
    regEx: SimpleSchema.RegEx.Id

  author:
    type: String

  createdAt:
    type: Date
    optional: true

  content:
    type: String

Messages.before.insert (_id, doc) ->
  doc.createdAt = Date.now()

Messages.attachSchema Messages.schema

module.exports = Messages
