class Tennis.Views.CheckoutView extends Backbone.View
  events:
    'click [data-book]': 'proceedToPayment'

  initialize: ->
    @listenTo(window.grid.collection, 'add', @render)
    @listenTo(window.grid.collection, 'change', @render)

  render: ->
    list = ""
    dur = 0
    # price = 0
    window.grid.collection.each (event) =>
      dur += Math.ceil(event.get('end').diff(event.get('start'), 'hours', true))
      list += "<li>#{event.get('start').format('YYYY/MM/dd H:mm')} - #{event.get('end').format('H:mm')}</li>"
    @$('[data-orders-list]').html(list)
    # @$('[data-time]').html(@getTime)
    price = dur * $('#court').find(":selected").data('price')
    @$('[data-total]').html(moment.duration(dur, "hours").humanize() + ' = ' + price + ' руб.')
    @$('#start').val(window.grid.model.get('start'))
    @$('#end').val(window.grid.model.get('end'))
    @$('[data-book]').removeAttr('disabled')

  # getTime: ->
  #   start = window.grid.model.get('start')
  #   end = window.grid.model.get('end')

  #   start.format('lll') + ' - ' + end.format('lll')

  getPrice: ->
    # window.grid.collection.each (event) =>
    start = window.grid.model.get('start')
    end = window.grid.model.get('end')
    dur = Math.ceil(end.diff(start, 'hours', true))
    time = moment.duration(dur, "hours").humanize()
    price = dur * $('#court').find(":selected").data('price')
    time + ' = ' + price + ' руб.'

  proceedToPayment: (e) ->
    e.preventDefault()
    court = $('#court').find(":selected").val()
    @order = new Tennis.Models.Order(events: window.grid.collection, court_id: court)
    @spinner = new Tennis.Views.FullscreenSpinner()
    @spinner.render()
    @request = Backbone.sync('create', @order, url: '/orders/')

    @request.done (data) =>
      document.location.href = '/orders'

    @request.fail (data) =>
      if data.responseJSON && data.responseJSON.error
        error = data.responseJSON.error
      else
        error = data.responseText
      alert(error)

    @request.always () =>
      @spinner.hide()

    # @modal = new Tennis.Views.CheckoutModal(collection: window.grid.collection)
    # @modal.render()