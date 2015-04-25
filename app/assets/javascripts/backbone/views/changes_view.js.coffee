class Tennis.Views.ChangesView extends Backbone.View
  events:
    'click [data-move]': 'submit'

  initialize: ->
    @listenTo(@collection, 'add change reset', @render)

  render: ->
    list = ""
    @collection.each (change) =>
      start = change.attributes.event.start.format()
      # diff = moment.duration(change.get('delta').hours(), "hours").humanize()
      diff = change.get('delta').humanize()
      list += "<li>#{start} - #{diff}</li>"
    @$('[data-changes-list]').html(list)
    @$('[data-total]').html($('#court').find(":selected").data('changePrice') * @collection.models.length + " руб.")
    if @collection.models.length == 0
      @$('[data-total]').html('')
    @$('[data-move]').removeClass('hidden')

  submit: (e) ->
    e.preventDefault()
    if confirm('Внимание! Эта операция платная, вы уверены?')
      Backbone.sync 'create', @collection, 
        noCSRF: false
        success: =>
          @collection.reset()
          @$('[data-move-class]').addClass('hidden')