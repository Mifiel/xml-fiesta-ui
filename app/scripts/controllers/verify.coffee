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

    $scope.upload = null

    $scope.$watch 'upload', (value) ->
      return unless value
      doc = XMLFiesta.fromXml(value.result.raw)
      # pdfb64 = doc.pdf('base64')
      currentBlob = new Blob([doc.pdfBuffer()], {type: 'application/pdf'})
      $scope.pdfUrl = URL.createObjectURL(currentBlob)
      console.log($scope.pdfUrl)

    return
