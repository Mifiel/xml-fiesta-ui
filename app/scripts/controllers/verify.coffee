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

    $scope.$watch 'upload', (value) ->
      return unless value
      doc = XMLFiesta.fromXml(value.result.raw)
      currentBlob = new Blob([doc.pdfBuffer()], {type: 'application/pdf'})
      $scope.pdfUrl = URL.createObjectURL(currentBlob)

    return
