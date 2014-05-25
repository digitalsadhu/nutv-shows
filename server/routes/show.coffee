youtube = require('youtube-get')(process.env.YOUTUBE_API_KEY)

transformChannelSectionData = (channelSection) ->
  channelSectionData =
    id: channelSection.id
    title: channelSection.snippet.title

module.exports = (req, res) ->

  apiParams =
    'part': 'id,snippet,contentDetails'
    'channelSectionId': req.params.id

  callback = (err, data) ->
    if err then res.send(err) else
    console.log data
    # res.send(transformChannelSectionData(data[0]))

  youtube 'channelSections', apiParams, callback
