youtube = require('youtube-get')(process.env.YOUTUBE_API_KEY)

transformChannelData = (channel) ->
  channelData =
    id: channel.id
    title: channel.snippet.title
    description: channel.snippet.description
    publishedAt: channel.snippet.publishedAt
    thumbnails: channel.snippet.thumbnails
    statistics: channel.statistics

module.exports = (req, res) ->

  apiParams =
    'forUsername': process.env.YOUTUBE_USER,
    'part': 'id,snippet,contentDetails,status,topicDetails,statistics'

  callback = (err, data) ->
    if err then res.send(err) else
    res.send(data.items.map(transformChannelData))

  youtube 'channels', apiParams, callback
