'use strict'

describe 'MainCtrl', ->

  beforeEach module 'xmlFiestaUiApp'

  controller = null
  $scope = null

  beforeEach inject ($controller, $rootScope) ->
    $scope = $rootScope.$new()
    controller = $controller 'MainCtrl', {
      $scope: $scope
    }

  it 'should exists', ->
    expect(controller).not.toBe null
