class Tennis.Views.CheckoutView extends Backbone.View
  events: {}

  initialize: ->
    $ =>
      @refreshPrice()
      $('#court').on 'change', => 
        @refreshPrice()
        

  refreshPrice: ->
    $.get("/courts/#{$('#court').find(":selected").val()}.json")
      .done (data, e) =>
        @$('[data-court-price]').html("#{data.price} руб.")
  #     window.grid.scheduler().bind('save', @render, this)

  # render: ->
  #   $.get('/orders/total.js')
  #   