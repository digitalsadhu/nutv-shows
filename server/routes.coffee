channels  = require './routes/channels'
shows     = require './routes/shows'
show      = require './routes/show'
episodes  = require './routes/episodes'
episode   = require './routes/episode'

module.exports = (app) ->
  app.get '/channels', channels
  app.get '/channels/:id/shows', shows
  app.get '/shows/:id', show
  app.get '/shows/:id/episodes', episodes
  app.get '/shows/:showId/episodes/:id', episode
