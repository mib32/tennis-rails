class Tennis.Views.MapView extends Backbone.View
  initialize: ->
    @handler = Gmaps.build('Google', builders: { Marker: CustomMarkerBuilder })
    @geocoder = new google.maps.Geocoder()
    @listenTo(@collection, 'change', @renderMarkers) if @collection
    $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) =>
      google.maps.event.trigger(@handler.getMap(), 'resize')

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
      if @markers.length == 1 
        @handler.getMap().setZoom(14)
        @handler.getMap().setCenter(@collection.models[0].get('position'))
      @afterMap() if @afterMap

    this

  renderMarkers: (collection) ->
    console.log 'Re-rendering marker data'
    @handler.removeMarkers(@collection)
    @handler.addMarkers collection