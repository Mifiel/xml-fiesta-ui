'use strict'

describe 'dropzone', ->

  beforeEach module 'xmlFiestaUiApp'

  $scope = null
  $compile = null
  eventListener = null

  beforeEach inject ($rootScope, $injector) ->
    $scope = $rootScope.$new()
    $compile = $injector.get('$compile')

  ['dragover', 'dragleave', 'drop'].forEach (type) ->
    describe "when #{type} on dropzone element", ->
      beforeEach ->
        elm = $compile('<div dropzone="upload"></div>')($scope)
        div = elm[0]
        div.dispatchEvent(new CustomEvent(type))

      it 'just a smoke test', ->
        expect(1).toBe 1

