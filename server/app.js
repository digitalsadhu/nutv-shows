'use strict';

require('iced-coffee-script/register')

var env = require('envoodoo')
env(__dirname + '/../.env')

var app     = require('express')()
  , routes  = require('./routes.coffee')

routes(app)

console.info('server listening on port ' + process.env.PORT)
app.listen(process.env.PORT)
