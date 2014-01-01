'use strict';


var angular = require('angular/index-browserify.js');
module.exports = function($resource, GOOGLE_API_KEY){

  var urlTemplate =
    "https://www.googleapis.com/youtube/v3/channels?" +
    "part=id,snippet,contentDetails,brandingSettings,statistics,status&" +
    "id=:showId&" +
    "key=:apiKey";

  var Show = $resource(urlTemplate, {apiKey: GOOGLE_API_KEY});
  angular.extend(Show.prototype, {

    getId: function () {
      if (typeof this.items === 'undefined') { return ''; }
      return this.items[0].id;
    },

    getTitle: function () {
      if (typeof this.items === 'undefined') { return ''; }
      return this.items[0].snippet.title;
    },

    getDescription: function () {
      if (typeof this.items === 'undefined') { return ''; }
      return this.items[0].snippet.description;
    },

    getThumbnailUrl: function (key) {
      if (typeof this.items === 'undefined') { return ''; }
      return this.items[0].snippet.thumbnails[key].url;
    },

    getBannerImageUrl: function () {
      if (typeof this.items === 'undefined') { return ''; }
      return this.items[0].brandingSettings.image.bannerImageUrl;
    },

    getViewCount: function () {
      if (typeof this.items === 'undefined') { return ''; }
      return this.items[0].statistics.viewCount;
    },

    getCommentCount: function () {
      if (typeof this.items === 'undefined') { return ''; }
      return this.items[0].statistics.commentCount;
    },

    getSubscriberCount: function () {
      if (typeof this.items === 'undefined') { return ''; }
      return this.items[0].statistics.subscriberCount;
    },

    getVideoCount: function () {
      if (typeof this.items === 'undefined') { return ''; }
      return this.items[0].statistics.videoCount;
    }

  });
  return Show;
};
