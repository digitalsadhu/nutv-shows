youtube = require('youtube-get')(process.env.YOUTUBE_API_KEY)

fetchChannelSection = (id, cb) ->
  apiParams =
    'part': 'id,snippet,contentDetails'
    'id': id
  youtube 'channelSections', apiParams, (err, data) -> cb(data.items[0])

fetchPlaylists = (playlistIds, cb) ->
  apiParams =
    'id': playlistIds.join(',')
    'part': 'id,snippet,status,contentDetails'
  youtube 'playlists', apiParams, (err, data) -> cb(data.items)

fetchPlaylistItems = (playlistId, cb) ->
  apiParams =
    'playlistId': playlistId
    'part': 'id,snippet,status,contentDetails'
  youtube 'playlistItems', apiParams, (err, data) -> cb(data)

createEpisodeFromPlaylist = (playlist) ->
  episode =
    'id': playlist.id
    'publishedAt': playlist.snippet.publishedAt
    'title': playlist.snippet.title ? ''
    'description': playlist.snippet.description ? ''
    'thumbnails': playlist.snippet.thumbnails ? {}
    'resourceType': 'playlist'

createEpisodeFromPlaylistItem = (playListItem) ->
  episode =
    'id': playListItem.id
    'publishedAt': playListItem.snippet.publishedAt
    'title': playListItem.snippet.title
    'description': playListItem.snippet.description
    'thumbnails': playListItem.snippet.thumbnails
    'resourceType': 'playlistItem'

createEpisodesFromData = (playlists, cb) ->

  episodes = []

  # If there is a single playlist then episodes are playlistitems
  if playlists.length is 1
    await fetchPlaylistItems(playlists[0].id, defer(playlistItemData))
    for playlistItem in playlistItemData.items
      episodes.push(createEpisodeFromPlaylistItem(playlistItem))

  # Otherwise we have multiple playlists in the channel section and
  # episodes are playlists
  else
    for playlist in playlists
      episodes.push(createEpisodeFromPlaylist(playlist))

  cb(episodes)

module.exports = (req, res) ->

  # Fetch data
  await fetchChannelSection(req.params.id, defer(channelSectionData))
  playlistIds = channelSectionData.contentDetails.playlists
  await fetchPlaylists(playlistIds, defer(playlistData))

  # Format data
  await createEpisodesFromData(playlistData, defer(episodes))

  # Return data
  res.send(episodes)



