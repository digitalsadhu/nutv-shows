'use strict';

var request  = require('superagent')
  , queryString = require('querystring')

var constructYoutubeApiUrl = function (endpoint, params) {
  var baseUrl = ['https://www.googleapis.com/youtube/v3', endpoint]
  params.key = process.env.YOUTUBE_API_KEY
  return [baseUrl.join('/'), queryString.stringify(params)].join('?')
}

module.exports = function (endpoint, params, cb) {
  request
    .get(constructYoutubeApiUrl(endpoint, params))
    .type('application/json')
    .accept('application/json')
    .end(function (err, res) {
      cb(err, res.body)
    })
}
