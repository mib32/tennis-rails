class Tennis.Views.CheckoutView extends Backbone.View
  initialize: ->
    @listenTo(window.grid.model, 'change', @render)

  render: ->
    $('[data-time]').html(@getTime)
    $('[data-total]').html(@getPrice)
    $('#start').val(window.grid.model.get('start'))
    $('#end').val(window.grid.model.get('end'))
    $('[data-book]').removeAttr('disabled')

  getTime: ->
    start = window.grid.model.get('start')
    end = window.grid.model.get('end')

    start.format('lll') + ' - ' + end.format('lll')

  getPrice: ->
    start = window.grid.model.get('start')
    end = window.grid.model.get('end')

    dur = Math.ceil(end.diff(start, 'hours', true))
    time = moment.duration(dur, "hours").humanize()

    price = dur * $('#court').find(":selected").data('price')

    time + ' = ' + price + ' руб.'