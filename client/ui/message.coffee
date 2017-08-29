
{ Template } = require 'meteor/templating'

moment = require 'moment'

Template.message.onRendered ->
  elem = document.querySelector('.chat_room__messages')
  elem.scrollTop = elem.scrollHeight

Template.message.helpers
  formatDate: (date) ->
    moment(date).fromNow()

