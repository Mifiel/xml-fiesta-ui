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
    # PDFJS.workerSrc = 'scripts/pdf.worker.js'

    $scope.upload = null
    $scope.doc = null
    $scope.pdfUrl = null

    $scope.$watch 'upload', (value) ->
      return unless value
      doc = XMLFiesta.fromXml(value.result.raw)
      $scope.doc = doc
      $scope.signatures = doc.signatures()
      currentBlob = new Blob([doc.pdfBuffer()], {type: 'application/pdf'})
      $scope.pdfUrl = URL.createObjectURL(currentBlob)

    return
