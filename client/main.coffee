
{ Account } = require 'meteor/accounts-base'

Accounts.ui.config({
  passwordSignupFields: 'USERNAME_ONLY',
})

require('./routes')

