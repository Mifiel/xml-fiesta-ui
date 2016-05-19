angular.module 'xmlFiestaUiApp'
.directive 'fileread', [ ->
  'use strict'
  {
    scope: fileread: '='
    link: (scope, element, attributes) ->
      element.bind 'change', (changeEvent) ->
        reader = new FileReader
        file = changeEvent.target.files[0]
        acceptExtension = if attributes.accept then attributes.accept.replace('.', '').toLowerCase() else null
        exactMatch = undefined
        includeMatch = undefined
        extensionMatch = undefined
        if !file
          return
        exactMatch = attributes.accept == file.type
        includeMatch = file.type.match(acceptExtension) != null
        extensionMatch = file.name.substr(-3) == acceptExtension
        if !(exactMatch or includeMatch or extensionMatch)
          scope.$apply ->
            scope.fileread = errors: [ 'Este tipo de archivo no está soportado, por favor sube un ' + attributes.acceptName + '.' ]
            return
          return

        reader.addEventListener 'load', (loadEvent) ->
          scope.$apply ->
            result = loadEvent.target.result
            scope.fileread =
              type: file.type
              name: file.name
              file: file
              result:
                data: ''
                hash: ''
                raw: result
            return
          return

        if file and (!angular.isDefined(attributes.raw) or attributes.raw != 'false')
          if attributes.binary
            reader.readAsBinaryString file
          else if attributes.text
            reader.readAsText file
          else
            reader.readAsArrayBuffer file
        return
      return

  }
 ]
