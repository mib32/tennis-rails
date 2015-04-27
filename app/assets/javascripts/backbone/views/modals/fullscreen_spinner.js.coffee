class Tennis.Views.FullscreenSpinner extends Tennis.Views.ModalView
  variables: ->
    header: 'Подождите.'
    body: 'Идет загрузка...'

  renderWithDelay: (ms=700) ->
    @timeout = setTimeout( (=> @render()), ms)

  hide: ->
    clearTimeout(@timeout)
    super
