class Tennis.Views.MapView extends Backbone.View
  initialize: ->
    @handler = Gmaps.build('Google', builders: { Marker: CustomMarkerBuilder })
    @geocoder = new google.maps.Geocoder()
    @collection.on('change', @renderMarkers, this) if @collection


  moscowCoords: ->
    lat: 55.75
    lng: 37.61

  coords: -> @moscowCoords()

  render: ->
    @handler.buildMap { provider: {scrollwheel: false}, internal: {id: 'map'}}, =>
      if @collection
        @markers = @handler.addMarkers(@collection.models) 
        @handler.bounds.extendWith(@markers)
        @handler.fitMapToBounds()
      else
        @handler.getMap().setCenter(@coords())

      @handler.getMap().setZoom(14);
      @afterMap() if @afterMap

    this

  renderMarkers: (collection) ->
    console.log 'Re-rendering marker data'
    @handler.removeMarkers(@collection)
    @handler.addMarkers collection