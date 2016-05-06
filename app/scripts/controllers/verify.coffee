'use strict'

###*
 # @ngdoc function
 # @name xmlFiestaUiApp.controller:VerifyCtrl
 # @description
 # # VerifyCtrl
 # Controller of the xmlFiestaUiApp
###
angular.module 'xmlFiestaUiApp'
  .controller 'VerifyCtrl', ($scope) ->
    PDFJS.workerSrc = 'scripts/pdf.worker.js'

    $scope.upload = null
    $scope.doc = null
    $scope.pdfUrl = null

    $scope.$watch 'upload', (value) ->
      return unless value
      parsed = XMLFiesta.Document.fromXml(value.result.raw)
      doc = parsed.document
      $scope.doc = doc
      $scope.oHashValid = parsed.xmlOriginalHash == doc.originalHash
      $scope.signatures = doc.signatures()
      $scope.signatures.forEach (signature) ->
        signature.valid = signature.valid(doc.originalHash)

      currentBlob = new Blob([doc.pdfBuffer()], {type: 'application/pdf'})
      $scope.pdfUrl = URL.createObjectURL(currentBlob)

    return
