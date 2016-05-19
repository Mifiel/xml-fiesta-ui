'use strict'

###*
 # @ngdoc function
 # @name xmlFiestaUiApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the xmlFiestaUiApp
###
angular.module 'xmlFiestaUiApp'
  .controller 'ConfigCtrl', ($scope, localStorageService) ->

    fetchRootCerts = ->
      $scope.certs = []
      certs = localStorageService.get('rootCerts')
      return unless certs
      angular.forEach certs, (el) ->
        $scope.certs.push el

    fetchRootCerts()

    $scope.clear = ->
      localStorageService.clearAll()
      fetchRootCerts()

    $scope.setRootCerts = (event) ->
      certs = localStorageService.get('rootCerts') || {}
      angular.forEach event.target.files, (file) ->
        reader = new FileReader
        reader.addEventListener 'load', (loadEvent) ->
          certs[file.name] =
            name: file.name
            content: loadEvent.target.result

          localStorageService.set('rootCerts', certs)
          angular.element('.cert-uploader').val('')

        reader.addEventListener 'loadend', ->
          fetchRootCerts()
          $scope.$apply()
        reader.readAsText(file)

    return

  .directive 'customOnChange', ->
    restrict: 'A',
    link: (scope, element, attrs) ->
      onChangeHandler = scope.$eval(attrs.customOnChange)
      element.bind('change', onChangeHandler)
