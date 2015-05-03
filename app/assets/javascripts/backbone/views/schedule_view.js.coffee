class Tennis.Views.ScheduleView extends Backbone.View
  initialize: ->
    @model = new Tennis.Models.Event()
    @collection = new Tennis.Collections.Events()
    @bindExternalEvents()

  bindExternalEvents: ->
    $('#court').on 'change', => 
      @scheduler().dataSource.read()

  render: ->
    @$el.kendoScheduler({
      culture: 'ru-RU'
      date: new Date()
      startTime: new Date("2013/6/13 07:00 AM")
      height: 600
      views: [
        "day",
        {type: "week", selected: true},
        "month",
        "agenda",
      ],
      edit: (e) ->
        # console.log e.event
        e.preventDefault() unless e.event.owned
      timezone: "Etc/UTC",
      resources:[
        field: 'owned'
        dataSource:[
          { text: 'Своё', value: true, color: 'cadetblue', editable: false },
          { text: 'Чужое', value: false, color: 'rgba(255,136,0,0.5)' }
        ]
      ]
      dataSource: {
        batch: false,
        transport: {
          read: {
            url: "/events"
          },
          update: {
            url: (options) -> "/events/#{options.id}",
            type: 'PUT'
          },
          create: {
            url: "/events",
            type: 'POST'
          },
          destroy: {
            url: (options) -> "/events/#{options.id}",
            method: 'DELETE'
        },
        parameterMap: (options, operation) =>
          options.court_id = @court_id
          if operation == "read"
            return options
          if operation != "read" && options
            return {event: options};
      },
      schema: {
        model: {
          id: "id",
          fields: @fields
        },
        }
      }
    })

  scheduler: ->
    @$el.data('kendoScheduler')

  court_id: ->
    $('#court').find(":selected").val()

  fields:
    title: { from: "description", defaultValue: "Введите название", type: 'string'}, 
    start: { type: "date", from: "start" },
    end: { type: "date", from: "end" },
    recurrenceId: { from: "recurrence_id" },
    recurrenceRule: { from: "recurrence_rule" },
    recurrenceException: { from: "recurrence_exception" },
    startTimezone: { from: "start_timezone" },
    endTimezone: { from: "end_timezone" },
    owned: { from: "owned", type: 'boolean', defaultValue: "true" },
    isAllDay: { type: "boolean", from: "is_all_day" }

  # initialize: ->
    # @model = new Tennis.Models.Event();
    # @collection = new Tennis.Collections.Events();
#     $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) =>
#       @$el.fullCalendar('render')  
#     @court = $('#court').find(":selected").val()
#     $('#court').on 'change', @switchSource

#   render: ->
#     @$el.fullCalendar
#       lang: 'ru'
#       events: @$el.data('source')
#       eventOverlap: false
#       eventResize: ( event, delta, revertFunc, jsEvent, ui, view ) =>
#         if obj = _.findWhere(@collection.models, {cid: event.cid})
#           obj.set(start: event.start, end: event.end)
#       eventDrop: ( event, delta, revertFunc, jsEvent, ui, view ) =>
#         # if event is fresh just change it
#         if obj = _.findWhere(@collection.models, {cid: event.cid})
#           obj.set(start: event.start, end: event.end)
#         else
#           if change = window.changes.findWhere(event: event)
#             delta.add(change.get('delta'))
#             change.set('delta', delta)
#             window.changes.trigger('change')
#           else
#             window.changes.add(new Tennis.Models.Change(event: event, delta: delta))
#       header:
#         left: 'prev,next today'
#         center: 'title'
#         right: 'month, agendaWeek, agendaDay'
#       # dayClick: (date, ev, view) =>
#         # modal = new Tennis.Views.ScheduleModalView(date, date.add(1, 'hour'))
#         # modal.render()
#       defaultView: 'agendaWeek'
#       selectable: true
#       timezone: false
#       selectHelper: true
#       selectOverlap: false
#       unselectAuto: false
#       select: ( start, end, jsEvent, view ) =>
#         if jsEvent
#           @modal = new Tennis.Views.ScheduleModalView(start, end)
#           @modal.render()
#         # @model.set
#           # start: start.utcOffset(0)
#           # end: end.utcOffset(0)

#   reRender: ->
#     @$el.fullCalendar('render')

#   switchSource: =>
#     @court = $('#court').find(":selected").val()
#     @$el.fullCalendar('removeEventSource', @$el.fullCalendar("eventSources"))
#     @$el.fullCalendar('removeEvents')
#     @$el.fullCalendar('addEventSource', $('#court').find(":selected").data('source'))

#   # handleSelect: 