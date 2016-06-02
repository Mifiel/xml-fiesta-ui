'use strict'

describe 'ConfigCtrl', ->

  beforeEach module 'xmlFiestaUiApp'

  controller = null
  $scope = null
  $compile = null
  mockWindow = null
  localStorageService = null
  initController = null

  mockCert =
    name: 'blah'
    content: 'blah'

  beforeEach inject ($controller, $rootScope, $injector) ->
    $scope = $rootScope.$new()
    $compile = $injector.get('$compile')
    localStorageService = $injector.get('localStorageService')
    mockWindow = $injector.get('$window')
    initController = ->
      controller = $controller 'ConfigCtrl', {
        $scope: $scope
      }

  beforeEach ->
    localStorageService.clearAll()

  it 'should exists', ->
    initController()
    expect(controller).not.toBe null

  describe 'without certs', ->
    beforeEach ->
      spyOn(localStorageService, 'get').and.returnValue null
      initController()

    it 'should fetch loaded rootCerts', ->
      expect(localStorageService.get).toHaveBeenCalledWith('rootCerts')
      expect($scope.certs.length).toBe 0

  describe 'with certs', ->
    beforeEach ->
      spyOn(localStorageService, 'get').and.returnValue [mockCert, mockCert]
      initController()

    it 'should fetch loaded rootCerts', ->
      expect(localStorageService.get).toHaveBeenCalledWith('rootCerts')
      expect($scope.certs.length).toBe 2

    describe '.clear', ->
      beforeEach -> initController()

      it 'should clear certs from local storage', ->
        spyOn(localStorageService, 'clearAll')
        $scope.clear()
        expect(localStorageService.clearAll).toHaveBeenCalled()

  describe '.setRootCerts', ->
    eventListener = jasmine.createSpy()
    beforeEach ->
      initController()
      spyOn(mockWindow, 'FileReader').and.returnValue {
        addEventListener: eventListener
        readAsText: (file) ->
      }
      spyOn(localStorageService, 'set').and.returnValue null
      spyOn(localStorageService, 'get').and.returnValue null
      elm = $compile('<div custom-on-change="setRootCerts"></div>')($scope)
      div = elm[0]
      div.files = [{name: 'file.crt', size: 123}]
      div.dispatchEvent(new CustomEvent('change'))

    it 'should load the certificates onload', ->
      call = eventListener.calls.first()
      expect(call.args[0]).toBe 'load'
      onloadHandler = call.args[1]
      onloadHandler({
        target:
          result: 'content of file.crt'
      })
      resultCerts =
        'file.crt':
          name: 'file.crt'
          content: 'content of file.crt'
      expect(localStorageService.get).toHaveBeenCalledWith('rootCerts')
      expect(localStorageService.set)
        .toHaveBeenCalledWith 'rootCerts', resultCerts

    it 'should render again onloadend', ->
      call = eventListener.calls.mostRecent()
      expect(call.args[0]).toBe 'loadend'
      onloadendHandler = call.args[1]
      onloadendHandler()
      expect(localStorageService.get).toHaveBeenCalledWith('rootCerts')

  describe '.setNom151Ca', ->
    eventListener = jasmine.createSpy()
    beforeEach ->
      initController()
      spyOn(mockWindow, 'FileReader').and.returnValue {
        addEventListener: eventListener
        readAsText: (file) ->
      }
      spyOn(localStorageService, 'set').and.returnValue null
      spyOn(localStorageService, 'get').and.returnValue null
      elm = $compile('<div custom-on-change="setNom151Ca"></div>')($scope)
      div = elm[0]
      div.files = [{name: 'file.crt', size: 123}]
      div.dispatchEvent(new CustomEvent('change'))

    it 'should load the certificates onload', ->
      call = eventListener.calls.first()
      expect(call.args[0]).toBe 'load'
      onloadHandler = call.args[1]
      onloadHandler({
        target:
          result: 'content of file.crt'
      })
      resultCerts =
        'file.crt':
          name: 'file.crt'
          content: 'content of file.crt'
      expect(localStorageService.get).toHaveBeenCalledWith('nom151Ca')
      expect(localStorageService.set)
        .toHaveBeenCalledWith 'nom151Ca', resultCerts

    it 'should render again onloadend', ->
      call = eventListener.calls.mostRecent()
      expect(call.args[0]).toBe 'loadend'
      onloadendHandler = call.args[1]
      onloadendHandler()
      expect(localStorageService.get).toHaveBeenCalledWith('nom151Ca')

  describe '.removeNom151Ca', ->
    it 'should remove Nom151Ca', ->
      initController()
      spyOn(localStorageService, 'remove').and.returnValue null

      $scope.removeNom151Ca()
      expect(localStorageService.remove).toHaveBeenCalledWith('nom151Ca')

  describe '.removeCerts', ->
    it 'should remove Certs', ->
      initController()
      spyOn(localStorageService, 'remove').and.returnValue null
      $scope.removeCerts()
      expect(localStorageService.remove).toHaveBeenCalledWith('rootCerts')

