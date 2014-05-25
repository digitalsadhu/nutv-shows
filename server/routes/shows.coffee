youtube = require('youtube-get')(process.env.YOUTUBE_API_KEY)

removeNonShowChannelSections = (channelSection) ->
  type = channelSection.snippet.type
  if type is 'singlePlaylist' or type is 'multiplePlaylists' then true else false

transformChannelSectionData = (channelSection) ->
  channelSectionData =
    id: channelSection.id
    title: channelSection.snippet.title

module.exports = (req, res) ->

  apiParams =
    'forUsername': process.env.YOUTUBE_USER
    'part': 'id,snippet,contentDetails'
    'channelId': req.params.id

  callback = (err, data) ->
    if err then res.send(err) else
    res.send(data.items.filter(removeNonShowChannelSections).map(transformChannelSectionData))

  youtube 'channelSections', apiParams, callback
