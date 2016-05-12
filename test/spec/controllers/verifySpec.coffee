'use strict'

describe 'VerifyCtrl', ->

  beforeEach module 'xmlFiestaUiApp'

  controller = null
  $scope = null

  beforeEach inject ($controller, $rootScope) ->
    $scope = $rootScope.$new()
    controller = $controller 'VerifyCtrl', {
      $scope: $scope
    }

  it 'should exists', ->
    expect(controller).not.toBe null
