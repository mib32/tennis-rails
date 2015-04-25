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
      eventOverlap: false
      eventResize: ( event, delta, revertFunc, jsEvent, ui, view ) =>
        revertFunc()
      eventDrop: ( event, delta, revertFunc, jsEvent, ui, view ) =>
        if change = window.changes.findWhere(event: event)
          delta.add(change.get('delta'))
          change.set('delta', delta)
          window.changes.trigger('change')
        else
          window.changes.add(new Tennis.Models.Change(event: event, delta: delta))
      header:
        left: 'prev,next today'
        center: 'title'
        right: 'month, agendaWeek, agendaDay'
      dayClick: (date, ev, view) =>
        modal = new Tennis.Views.ScheduleModalView(date)
        modal.render()
      defaultView: 'agendaWeek'
      selectable: true
      timezone: false
      selectHelper: true
      selectOverlap: false
      select: ( start, end, jsEvent, view ) =>
        @model.set
          start: start.utcOffset(0)
          end: end.utcOffset(0)

  reRender: ->
    @$el.fullCalendar('render')

  switchSource: =>
    @$el.fullCalendar('removeEventSource', @$el.fullCalendar("eventSources"))
    @$el.fullCalendar('removeEvents')
    @$el.fullCalendar('addEventSource', $('#court').find(":selected").data('source'))

  # handleSelect: 