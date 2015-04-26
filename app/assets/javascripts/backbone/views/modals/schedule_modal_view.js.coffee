class Tennis.Views.ScheduleModalView extends Tennis.Views.ModalView
  form: JST['backbone/templates/schedule_form']

  events: ->
    _.extend({
      'submit form': 'submit',
      'change input': 'bindModel'
      'change select': 'bindModel'
      }, super)

  bindModel: (evt) ->
    changed = evt.currentTarget;
    value = $(evt.currentTarget).val();
    obj = {};
    obj[changed.name] = value;
    if changed.name == 'start' || changed.name == 'end'
      obj[changed.name] = moment.utc(value)
    this.model.set(obj);

  initialize: (start, end) ->
    @model = new Tennis.Models.Event(start: start, end: end)
    @listenTo(@model, 'change', @calculatePrice)

  variables: ->
    # _.extend({
    header: 'Бронирование'
    body: @form(start: @start().format('YYYY/MM/DD H:mm'), end: @end().format('YYYY/MM/DD H:mm'))
    # }, super)

  start: ->
    @model.get('start')

  end: ->
    @model.get('end')

  submit: (e) =>
    e.preventDefault()
    # if @model.isOverlapping()
    window.grid.$el.fullCalendar('renderEvent', @model.eventObject(), true)
    window.grid.$el.fullCalendar('unselect')

    @hide()

  afterRender: ->
    $('[data-datetimepicker]').datetimepicker
      lang: 'ru'
      step: 30
    @calculatePrice()

  calculatePrice: ->
    $.get "/courts/#{window.grid.court}", (data) =>
      dur = Math.ceil(@model.get('end').diff(@model.get('start'), 'hours', true))
      total = data.price * dur
      time = moment.duration(dur, "hours").humanize()
      @$('[data-total]').html(time + ' = ' + total + ' руб.')