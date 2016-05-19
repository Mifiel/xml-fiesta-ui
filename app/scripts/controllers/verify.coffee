'use strict'

###*
 # @ngdoc function
 # @name xmlFiestaUiApp.controller:VerifyCtrl
 # @description
 # # VerifyCtrl
 # Controller of the xmlFiestaUiApp
###
angular.module 'xmlFiestaUiApp'
  .controller 'VerifyCtrl', ($scope, $timeout, localStorageService) ->
    PDFJS.workerSrc = 'scripts/pdf.worker.js'

    fetchRootCerts = ->
      $scope.certs = []
      certs = localStorageService.get('rootCerts')
      return unless certs
      angular.forEach certs, (el) ->
        $scope.certs.push el

    fetchRootCerts()

    $scope.ready = $scope.certs.length > 0
    $scope.upload = null
    $scope.doc = null
    $scope.pdfUrl = null
    $scope.loading = false

    $scope.clear = ->
      $scope.ready = $scope.certs.length > 0
      $scope.upload = null
      $scope.doc = null
      $scope.pdfUrl = null
      $scope.loading = false
      angular.element('.file-upload-input').val('')
      return

    $scope.parseXML = (xml) ->
      parsed = XMLFiesta.Document.fromXml(xml)
      doc = parsed.document
      $scope.doc = doc
      $scope.oHashValid = parsed.xmlOriginalHash == doc.originalHash
      $scope.signatures = doc.signatures()
      $scope.signatures.forEach (signature) ->
        signature.valid = signature.valid(doc.originalHash)
        signature.certificate.valid = false
        angular.forEach $scope.certs, (el) ->
          # dont keep verifying if its already verifi
          if !signature.certificate.valid
            signature.certificate.valid = signature.certificate.isCa(el.content)
            return

      currentBlob = new Blob([doc.pdfBuffer()], {type: 'application/pdf'})
      $scope.pdfUrl = URL.createObjectURL(currentBlob)
      $scope.loading = false
      return

    $scope.$watch 'upload', (value) ->
      return unless value
      $scope.loading = true
      $timeout ->
        $scope.parseXML(value.result.raw)
        return
      , 50
      return

    return
