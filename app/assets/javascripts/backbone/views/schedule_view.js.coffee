class Tennis.Views.ScheduleView extends Backbone.View
  initialize: ->
    # @model = new Tennis.Models.Event()
    # @collection = new Tennis.Collections.Events()
    @bindExternalEvents()

  bindExternalEvents: ->
    $ =>
      $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) =>
        @scheduler().refresh()
      $('#court').on 'change', => 
        @scheduler().dataSource.read()

  render: ->
    @$el.kendoScheduler({
      culture: 'ru-RU'
      date: new Date()
      startTime: new Date("2013/6/13 07:00 AM")
      height: 700
      views: [
        "day",
        {type: "week", selected: true},
        "month",
        "agenda",
      ],

      edit: (e) =>
        # console.log e.event
        if !e.event.owned || @getCookie('signed_in') != '1'
          alert('Пожалуйста, сначала авторизуйтесь.')
          e.preventDefault()
      resize: (e) =>
        if @timeIsOccupied(e.start, e.end, e.event)
          @scheduler().wrapper.find('.k-marquee-color').addClass 'invalid-slot'
          e.preventDefault()
        return
      resizeEnd: (e) =>
        if @timeIsOccupied(e.start, e.end, e.event)
          alert('Это время занято')
          e.preventDefault()
        return
      move: (e) =>
        if @timeIsOccupied(e.start, e.end, e.event)
          @scheduler().wrapper.find('.k-event-drag-hint').addClass 'invalid-slot'
        return
      moveEnd: (e) =>
        if @timeIsOccupied(e.start, e.end, e.event)
          alert('Это время занято')
          e.preventDefault()
        return
      add: (e) =>
        if @timeIsOccupied(e.event.start, e.event.end, e.event)
          alert('Это время занято')
          e.preventDefault()
        return
      save: (e) =>
        if @timeIsOccupied(e.event.start, e.event.end, e.event)
          alert('Это время занято')
          e.preventDefault()
        else
          e.sender.dataSource.one 'requestEnd', -> $.get('/orders/total.js') 
        return

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
            url: (e, s)=>
             @url()
          },
          update: {
            url: (options) => "#{@url()}/#{options.id}",
            type: 'PUT'
          },
          create: {
            url: =>
             @url()
            type: 'POST'
          },
          destroy: {
            url: (options) => "#{@url()}/#{options.id}",
            method: 'DELETE'
        },
        parameterMap: (options, operation) =>
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
    title: { from: "description", type: 'string'}, 
    start: { type: "date", from: "start" },
    end: { type: "date", from: "end" },
    recurrenceId: { from: "recurrence_id" },
    recurrenceRule: { from: "recurrence_rule" },
    recurrenceException: { from: "recurrence_exception" },
    startTimezone: { from: "start_timezone" },
    endTimezone: { from: "end_timezone" },
    owned: { from: "owned", type: 'boolean', defaultValue: "true"},
    isAllDay: { type: "boolean", from: "is_all_day" }

  getCookie: (cname) ->
    name = cname + '='
    ca = document.cookie.split(';')
    i = 0
    while i < ca.length
      c = ca[i]
      while c.charAt(0) == ' '
        c = c.substring(1)
      if c.indexOf(name) == 0
        return c.substring(name.length, c.length)
      i++
    ''

  timeIsOccupied: (start, end, event) =>
    occurences = @scheduler().occurrencesInRange(start, end)
    idx = occurences.indexOf(event)
    if idx > -1
      occurences.splice(idx, 1)
    if occurences.length > 0 
      true
    else
      false

  url: ->
    window.location.pathname.replace('/events', '/courts/' + @court_id() + '/events')
