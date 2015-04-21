class Tennis.Views.BusinessFormView extends Tennis.Views.FormView
  initialize: ->
    @model.on('change:position', @updateLocation, this)

  updateLocation: ->
    @$el.find('#business_latitude').val(@model.get('position').lat())
    @$el.find('#business_longitude').val(@model.get('position').lng())