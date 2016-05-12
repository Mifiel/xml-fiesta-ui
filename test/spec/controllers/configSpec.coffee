'use strict'

describe 'ConfigCtrl', ->

  beforeEach module 'xmlFiestaUiApp'

  controller = null
  $scope = null

  beforeEach inject ($controller, $rootScope) ->
    $scope = $rootScope.$new()
    controller = $controller 'ConfigCtrl', {
      $scope: $scope
    }

  it 'should exists', ->
    expect(controller).not.toBe null
