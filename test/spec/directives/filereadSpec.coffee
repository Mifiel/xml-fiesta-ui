'use strict'

describe 'fileread', ->

  beforeEach module 'xmlFiestaUiApp'

  $scope = null
  $compile = null
  mockWindow = null
  mockFile =
    name: 'file.crt'
    size: 123
    type: 'crt'
  eventListener = null

  beforeEach inject ($rootScope, $injector) ->
    $scope = $rootScope.$new()
    $compile = $injector.get('$compile')
    mockWindow = $injector.get('$window')

  beforeEach ->
    eventListener = jasmine.createSpy()
    spyOn(mockWindow, 'FileReader').and.returnValue {
      addEventListener: eventListener
      readAsBinaryString: (file) ->
      readAsText: (file) ->
      readAsArrayBuffer: (file) ->
    }

  describe 'without an accept attribute', ->
    beforeEach ->
      elm = $compile('<div fileread="upload"></div>')($scope)
      div = elm[0]
      div.files = [mockFile]
      div.dispatchEvent(new CustomEvent('change'))

    it 'expect $scope.upload to have errors', ->
      expect($scope.upload.errors.length).toBe 1

  ['binary', 'text', null].forEach (type) ->

    describe 'with a valid accept attribute', ->
      describe "with #{type}", ->
        beforeEach ->
          elm = $compile("<div accept=\"crt\" fileread=\"upload\" #{type}=\"true\"></div>")($scope)
          # console.log elm
          div = elm[0]
          div.files = [mockFile]
          div.dispatchEvent(new CustomEvent('change'))
          call = eventListener.calls.first()
          onloadHandler = call.args[1]
          onloadHandler({
            target:
              result: 'content of file.crt'
          })

        it 'should have no errors', ->
          expect($scope.upload.errors).toBeUndefined()

        it 'should have attributes', ->
          expect($scope.upload.type).toBe 'crt'
          expect($scope.upload.name).toBe 'file.crt'



