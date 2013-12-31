'use strict';
// This file is the glue for the project. It is where the application is defined.
// All the external angular modules are included here.

var angular = require('angular/index-browserify.js');

// Angular dependencies
require('angular-route/angular-route.min.js');
require('angular-resource/angular-resource.js');

// The jQuery dependency for this is included in the index.html page.
// This is for cdn and simplicity purposes
require('angular-sortable/src/sortable.js');

// Create the angular app with all the dependencies
var app = angular.module(
  'nutvShowsApp',
  [
    'ngRoute',
    'ngResource'
  ]
);

// Load and register any angular modules
// All modules should export an object that can be registered
// without needing to be wrapped in a function etc.

// Configuration

app.config(require('./config/routes.js'));
app.value('GOOGLE_API_KEY', 'AIzaSyC9siTsdops0d7xyxc4CJwYmknOT7HFGKA');
app.value('FULL_FRONTAL_CHANNEL_ID', 'UCCNbWH0nOCuJQuYW1QViDqA');

// Controllers

app.controller(
  'IndexController',
  require('./controllers/indexController.js')
);

// Directives

// app.directive(
//   'fwSpinner',
//   require('./directives/fwSpinner/fwSpinner.js')
// );

// Factories

// app.factory(
//   'Project',
//   require('./factories/project.js')
// );

// Services

// app.service(
//   'GeocodeService',
//   require('./services/geocodeService.js')
// );
