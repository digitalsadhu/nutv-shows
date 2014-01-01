'use strict';


module.exports = function($routeProvider) {
  $routeProvider.when('/', {
    templateUrl: 'views/index.html',
    controller: 'IndexController'
  });
  $routeProvider.when('/shows/:name', {
    templateUrl: 'views/shows.html',
    controller: 'ShowsController'
  });
  // $routeProvider.when('/shows/:name/episodes/:title', {
  //   templateUrl: 'views/episodes.html',
  //   controller: 'EpisodeController'
  // });
  // $routeProvider.when('/shows/:name/episodes/:title/clips/:id', {
  //   templateUrl: 'views/clips.html',
  //   controller: 'ClipsController'
  // });
};
