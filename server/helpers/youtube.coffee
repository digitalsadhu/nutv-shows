request     = require 'superagent'
queryString = require 'querystring'

constructYoutubeApiUrl = (endpoint, params) ->
  baseUrl = ['https://www.googleapis.com/youtube/v3', endpoint]
  params.key = process.env.YOUTUBE_API_KEY
  [baseUrl.join('/'), queryString.stringify(params)].join('?')

module.exports = (endpoint, params, cb) ->
  request
    .get(constructYoutubeApiUrl(endpoint, params))
    .type 'application/json'
    .accept 'application/json'
    .end (err, res) ->
      cb(err, res.body)
