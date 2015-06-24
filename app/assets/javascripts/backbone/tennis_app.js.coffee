#= require_self
#= require handlebars.runtime
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

class window.CustomMarkerBuilder extends Gmaps.Google.Builders.Marker
  create_marker: ->
    @args.infowindow = @args.attributes.infowindow
    options = _.extend @marker_options(@args.attributes), @custom_options()
    @serviceObject = new(@primitives().marker)(options)

  custom_options: ->
    {
      icon: @args.attributes.icon
      draggable: @args.attributes.draggable
      position: @args.attributes.position
    }

window.Tennis =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

$ ->
  # do notin