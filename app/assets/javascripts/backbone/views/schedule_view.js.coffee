class Tennis.Views.ScheduleView extends Backbone.View
  initialize: ->
    @model = new Tennis.Models.Event();
    @collection = new Tennis.Collections.Events();
    $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) =>
      @$el.fullCalendar('render')  
    @court = $('#court').find(":selected").val()
    $('#court').on 'change', @switchSource

  render: ->
    @$el.fullCalendar
      lang: 'ru'
      events: @$el.data('source')
      eventOverlap: false
      eventResize: ( event, delta, revertFunc, jsEvent, ui, view ) =>
        if obj = _.findWhere(@collection.models, {cid: event.cid})
          obj.set(start: event.start, end: event.end)
      eventDrop: ( event, delta, revertFunc, jsEvent, ui, view ) =>
        # if event is fresh just change it
        if obj = _.findWhere(@collection.models, {cid: event.cid})
          obj.set(start: event.start, end: event.end)
        else
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
      # dayClick: (date, ev, view) =>
        # modal = new Tennis.Views.ScheduleModalView(date, date.add(1, 'hour'))
        # modal.render()
      defaultView: 'agendaWeek'
      selectable: true
      timezone: false
      selectHelper: true
      selectOverlap: false
      unselectAuto: false
      select: ( start, end, jsEvent, view ) =>
        if jsEvent
          @modal = new Tennis.Views.ScheduleModalView(start, end)
          @modal.render()
        # @model.set
          # start: start.utcOffset(0)
          # end: end.utcOffset(0)

  reRender: ->
    @$el.fullCalendar('render')

  switchSource: =>
    @court = $('#court').find(":selected").val()
    @$el.fullCalendar('removeEventSource', @$el.fullCalendar("eventSources"))
    @$el.fullCalendar('removeEvents')
    @$el.fullCalendar('addEventSource', $('#court').find(":selected").data('source'))

  # handleSelect: 