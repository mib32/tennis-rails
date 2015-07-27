Dropzone.autoDiscover = false;
$ -> 
  if $('.dropzone').length > 0
    myDropzone = new Dropzone '.dropzone',
      dictDefaultMessage: "Бросьте файлы прямо сюда, либо кликните."
      success: (resp) ->
        if resp.xhr.responseURL.match('.js')
          eval(resp.xhr.response)

  $('[data-blur-remote]').on 'blur', (e) ->
    $(this).parents('form').submit()