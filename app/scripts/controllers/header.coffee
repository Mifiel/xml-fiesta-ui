'use strict'

###*
 # @ngdoc function
 # @name xmlFiestaUiApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the xmlFiestaUiApp
###
angular.module 'xmlFiestaUiApp'
  .controller 'HeaderCtrl', ($scope, HeaderContext) ->
    $scope.headContext = HeaderContext.context
    return
