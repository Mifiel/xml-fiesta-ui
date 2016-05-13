'use strict'

describe 'VerifyCtrl', ->

  beforeEach module 'xmlFiestaUiApp'

  controller = null
  $scope = null
  localStorageService = null
  initController = null

  mockCert =
    name: 'blah'
    content: 'blah'

  beforeEach inject ($controller, $rootScope, _localStorageService_) ->
    $scope = $rootScope.$new()
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

    describe 'when user uploads a XML', ->
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
          pdfBuffer: -> 'as'

      beforeEach ->
        spyOn(XMLFiesta.Document, 'fromXml').and.returnValue mockXMLDocument
        $scope.upload =
          result: raw: 'blah'
        $scope.$apply()

      it 'should assign signatures', ->
        expect($scope.signatures.length).toBe 2

      it 'should assign a pdfUrl', ->
        expect($scope.pdfUrl).not.toBe null

