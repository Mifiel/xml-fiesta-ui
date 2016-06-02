'use strict'

class FakeResolvedPromise
  constructor: (@resolvedObject) ->
  then: (callback)->
    callback(@resolvedObject)
    this
  catch: ->
    this

class FakeRejectPromise
  constructor: (errorMsg) ->
    @error =
      message: errorMsg
  then: ->
    this
  catch: (callback) ->
    callback(@error)
    this

describe 'VerifyCtrl', ->

  beforeEach module 'xmlFiestaUiApp'

  controller = null
  $scope = null
  $q = null
  localStorageService = null
  initController = null

  mockCert =
    name: 'blah'
    content: 'blah'

  beforeEach inject ($controller, _$q_, $rootScope, _localStorageService_) ->
    $scope = $rootScope.$new()
    $q = _$q_
    localStorageService = _localStorageService_
    initController = ->
      controller = $controller 'VerifyCtrl', {
        $scope: $scope
      }

  beforeEach ->
    localStorageService.clearAll()

  it 'should exists', ->
    initController()
    expect(controller).not.toBe null

  describe 'clear', ->
    it 'should clear all variables', ->
      initController()
      $scope.pdfUrl = 'blah'
      $scope.clear()
      expect($scope.pdfUrl).toBe null

  describe 'without certs', ->
    beforeEach ->
      spyOn(localStorageService, 'get').and.returnValue null
      initController()

    it 'should fetch loaded rootCerts', ->
      expect(localStorageService.get).toHaveBeenCalledWith('rootCerts')
      expect($scope.certs.length).toBe 0

    it 'should not be ready', ->
      expect($scope.ready).toBe false

  describe 'with certs', ->
    beforeEach ->
      spyOn(localStorageService, 'get').and.returnValue [mockCert, mockCert]
      initController()

    it 'should fetch loaded rootCerts', ->
      expect(localStorageService.get).toHaveBeenCalledWith('rootCerts')
      expect($scope.certs.length).toBe 2

    it 'should be ready', ->
      expect($scope.ready).toBe true

    describe 'when start digest', ->
      it 'should watch the upload and do nothing', ->
        $scope.$apply()
        expect($scope.doc).toBe null
        expect($scope.signatures).toBeUndefined()

    describe 'parseXML', ->
      mockXMLDocument =
        document:
          signatures: ->
            [
              {
                valid: -> false
                certificate: isCa: -> true
              },
              {
                valid: -> true
                certificate: isCa: -> false
              }
            ]
          recordPresent: true
          errors: {}
          pdfBuffer: -> 'as'

      describe 'when resolved', ->
        beforeEach ->
          spyOn(XMLFiesta.Document, 'fromXml').and.returnValue(
            new FakeResolvedPromise(mockXMLDocument)
          )
          $scope.parseXML('blah')

        it 'should assign signatures', ->
          expect(typeof $scope.signatures).toBe('object')
          expect($scope.signatures.length).toBe 2

        it 'should assign a pdfUrl', ->
          expect($scope.pdfUrl).not.toBe null

        it 'should not be loading', ->
          expect($scope.loading).toBe false

        it 'should not set the record', ->
          expect($scope.record).toBe null

      xdescribe 'when resolve with recordPresent', ->
        beforeEach ->
          spyOn(XMLFiesta.Document, 'fromXml').and.returnValue(
            mockXMLDocument.record = new XMLFiesta.ConservancyRecord('')
            new FakeResolvedPromise(mockXMLDocument)
          )
          $scope.parseXML('blah')

        it 'should set the record', ->
          expect($scope.record).not.toBe null

      describe 'when rejected', ->
        beforeEach ->
          spyOn(XMLFiesta.Document, 'fromXml').and.returnValue(
            new FakeRejectPromise('Error message')
          )

          $scope.parseXML('blah')

        it 'should set an error', ->
          expect($scope.error.indexOf('Error message') > 0).toBe true

        it 'should not be loading', ->
          expect($scope.loading).toBe false


    describe '$watch upload', ->
      it 'smoke test', ->
        $scope.upload =
          result: raw: 'blah'
        $scope.$apply()

