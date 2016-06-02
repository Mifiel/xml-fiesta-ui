'use strict'

###*
 # @ngdoc function
 # @name xmlFiestaUiApp.controller:VerifyCtrl
 # @description
 # # VerifyCtrl
 # Controller of the xmlFiestaUiApp
###
angular.module 'xmlFiestaUiApp'
  .controller 'VerifyCtrl', ($scope, $q, $timeout, $filter, localStorageService) ->
    # PDFJS.workerSrc = 'scripts/pdf.worker.js'

    fetchRootCerts = ->
      $scope.certs = []
      $scope.nom151Ca = []
      certs = localStorageService.get('rootCerts')
      nom151Ca = localStorageService.get('nom151Ca')
      if nom151Ca
        angular.forEach nom151Ca, (el) ->
          $scope.nom151Ca.push el

      if certs
        angular.forEach certs, (el) ->
          $scope.certs.push el
      return

    fetchRootCerts()

    $scope.clear = ->
      $scope.ready = $scope.certs.length > 0
      $scope.upload = null
      $scope.doc = null
      $scope.pdfUrl = null
      $scope.loading = false
      angular.element('.file-upload-input').val('')
      return

    $scope.clear()

    setRecordValues = ->
      if $scope.doc.recordPresent && $scope.record instanceof XMLFiesta.ConservancyRecord
        $scope.record.valid = $scope.record.valid()
        $scope.record.validTS = $scope.record.equalTimestamps()
        $scope.record.validCA = false
        angular.forEach $scope.nom151Ca, (el) ->
          # dont keep verifying if its already verified
          if !$scope.record.validCA
            $scope.record.validCA = $scope.record.isCa(el.content)
            return

        $scope.record.tsTranslation =
          recordTS: $filter('date')($scope.record.recordTimestamp(), 'medium', 'UTC')
          xmlTS: $filter('date')(Date.parse($scope.record.timestamp), 'medium', 'UTC')
      else if $scope.doc.recordPresent && $scope.doc.errors.recordInvalid
        $scope.record =
          valid: false

    setSigners = ->
      $scope.signatures.forEach (signature) ->
        signature.valid = signature.valid($scope.doc.originalHash)
        signature.certificate.valid = false
        angular.forEach $scope.certs, (el) ->
          # dont keep verifying if its already verified
          if !signature.certificate.valid
            signature.certificate.valid = signature.certificate.isCa(el.content)
            return

    $scope.parseXML = (xml) ->
      parsed = XMLFiesta.Document.fromXml(xml)

      parsed.then (result) ->
        doc = result.document
        $scope.doc = doc
        $scope.oHashValid = result.xmlOriginalHash == doc.originalHash
        $scope.signatures = doc.signatures()
        $scope.record = doc.conservancyRecord || null
        setRecordValues()
        setSigners()

        currentBlob = new Blob([doc.pdfBuffer()], {type: 'application/pdf'})
        $scope.pdfUrl = URL.createObjectURL(currentBlob)
        $scope.loading = false
        $scope.$apply()
        return
      .catch (err) ->
        msg = "XML Format is invalid: #{err.message}"
        $scope.error = msg
        console.error($scope.error)
        $scope.$apply()
        $scope.loading = false
        return
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
