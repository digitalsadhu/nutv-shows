'use strict';

module.exports = function ShowsController($scope, Show, $routeParams, SHOW_NAMES){

  //handle incorrect url show name parameter
  if (typeof SHOW_NAMES[$routeParams.name] === 'undefined') {
    console.error('invalid show title');
    return;
  }

  //lookup show id
  var showId = SHOW_NAMES[$routeParams.name];

  //fetch show data
  $scope.show = Show.get({showId:showId});

};
