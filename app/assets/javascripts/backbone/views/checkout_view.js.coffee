class Tennis.Views.CheckoutView extends Backbone.View
  initialize: ->
    window.grid.model.on('change', @render, this)

  render: ->
    $('[data-total]').html(@getPrice)
    $('[data-book]').removeClass('hidden')

  getPrice: ->
    start = window.grid.model.get('start')
    end = window.grid.model.get('end')

    dur = Math.ceil(end.diff(start, 'hours', true))
    time = moment.duration(dur, "hours").humanize()

    price = dur * $('#court').find(":selected").data('price')

    time + ' = ' + price + ' руб.'