'use strict'

###*
 # @ngdoc overview
 # @name xmlFiestaUiApp
 # @description
 # # xmlFiestaUiApp
 #
 # Main module of the application.
###
angular
  .module 'xmlFiestaUiApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'pdf'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .when '/verify',
        templateUrl: 'views/verify.html'
        controller: 'VerifyCtrl'
        controllerAs: 'verify'
      .otherwise
        redirectTo: '/'

