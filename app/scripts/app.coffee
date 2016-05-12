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
    'ngAnimate'
    'ngCookies'
    'ngResource'
    'ui.router'
    'ngSanitize'
    'ngTouch'
    'pdf'
    'LocalStorageModule'
  ]
  .config (localStorageServiceProvider) ->
    localStorageServiceProvider.setPrefix('XMLFiesta')

  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'

      .state 'verify',
        url: '/verify'
        templateUrl: 'views/verify.html'
        controller: 'VerifyCtrl'
        controllerAs: 'verify'

      .state 'contact',
        url: '/contact'
        templateUrl: 'views/contact.html'
        controller: 'ContactCtrl'
        controllerAs: 'contact'

      .state 'config',
        url: '/config'
        templateUrl: 'views/config.html'
        controller: 'ConfigCtrl'
        controllerAs: 'config'

    $urlRouterProvider.otherwise('/')
