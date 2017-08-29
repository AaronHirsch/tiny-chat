ChatRooms = new Mongo.Collection 'ChatRooms'

ChatRooms.allow
  insert: -> false,
  update: -> false,
  remove: -> false

ChatRooms.deny
  insert: -> true,
  update: -> true,
  remove: -> true

ChatRooms.schema = new SimpleSchema

  _id:
    type: String
    regEx: SimpleSchema.RegEx.Id

  name:
    type: String

  private:
    type: Boolean

ChatRooms.attachSchema ChatRooms.schema

module.exports = ChatRooms
