angular.module 'xmlFiestaUiApp'
.directive 'dropzone', [ ->
  {
    link: (scope, element) ->
      element
      .bind 'dragover', (e) ->
        e.stopPropagation()
        $(this).addClass 'image-dropping'
        return
      .bind 'dragleave', (e) ->
        e.stopPropagation()
        $(this).removeClass 'image-dropping'
        return
      .bind 'drop', (e) ->
        e.stopPropagation()
        $(this).removeClass 'image-dropping'
        return

      $('body').bind 'dragover', (e) ->
        e.stopPropagation()
        element.addClass 'image-dragging'
        return
      .bind 'dragleave', (e) ->
        e.stopPropagation()
        element.removeClass 'image-dragging'
        return
      return
  }
]
