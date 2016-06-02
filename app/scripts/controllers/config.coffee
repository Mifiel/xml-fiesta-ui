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
      $scope.nom151Ca = []
      certs = localStorageService.get('rootCerts')
      nom151Ca = localStorageService.get('nom151Ca')
      if nom151Ca
        angular.forEach nom151Ca, (el) ->
          $scope.nom151Ca.push el

      if certs
        angular.forEach certs, (el) ->
          $scope.certs.push el
      return

    fetchRootCerts()

    $scope.removeNom151Ca = ->
      localStorageService.remove('nom151Ca')
      fetchRootCerts()

    $scope.removeCerts = ->
      localStorageService.remove('rootCerts')
      fetchRootCerts()

    $scope.clear = ->
      localStorageService.clearAll()
      fetchRootCerts()

    setCerts = (event, storageName) ->
      certs = localStorageService.get(storageName) || {}
      angular.forEach event.target.files, (file) ->
        reader = new FileReader
        reader.addEventListener 'load', (loadEvent) ->
          certs[file.name] =
            name: file.name
            content: loadEvent.target.result

          localStorageService.set(storageName, certs)
          angular.element('.cert-uploader').val('')

        reader.addEventListener 'loadend', ->
          fetchRootCerts()
          $scope.$apply()
        reader.readAsText(file)

    $scope.setRootCerts = (event) ->
      setCerts(event, 'rootCerts')

    $scope.setNom151Ca = (event) ->
      setCerts(event, 'nom151Ca')

    return

  .directive 'customOnChange', ->
    restrict: 'A',
    link: (scope, element, attrs) ->
      onChangeHandler = scope.$eval(attrs.customOnChange)
      element.bind('change', onChangeHandler)
