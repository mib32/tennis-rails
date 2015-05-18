Dropzone.autoDiscover = false;
$ -> 
  if $('.dropzone').length > 0
    myDropzone = new Dropzone '.dropzone',
      dictDefaultMessage: "Бросьте файлы прямо сюда, либо кликните."