class Tennis.Views.ScheduleView extends Backbone.View
  initialize: ->
    @model = new Backbone.Model();
    $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) =>
      @$el.fullCalendar('render')  
    $('#court').on 'change', @switchSource

  render: ->
    @$el.fullCalendar
      lang: 'ru'
      events: @$el.data('source')
      header:
        left: 'prev,next today'
        center: 'title'
        right: 'month, agendaWeek, agendaDay'
      defaultView: 'agendaWeek'
      selectable: true
      selectHelper: true
      selectOverlap: false
      select: ( start, end, jsEvent, view ) =>
        @model.set
          start: start
          end: end

  reRender: ->
    @$el.fullCalendar('render')

  switchSource: =>
    @$el.fullCalendar('removeEventSource', @$el.fullCalendar("eventSources"))
    @$el.fullCalendar('removeEvents')
    @$el.fullCalendar('addEventSource', $('#court').find(":selected").data('source'))

  # handleSelect: 