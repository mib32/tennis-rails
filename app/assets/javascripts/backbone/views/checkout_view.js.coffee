class Tennis.Views.CheckoutView extends Backbone.View
  events: {}

  initialize: ->
    $ =>
      $('#court').on 'change', => 
        $.get("/courts/#{$('#court').find(":selected").val()}.json")
          .done (data, e) =>
            @$('[data-court-price]').html("Стоимость часа: #{data.price.to_i} руб.")
  #     window.grid.scheduler().bind('save', @render, this)

  # render: ->
  #   $.get('/orders/total.js')
  #   