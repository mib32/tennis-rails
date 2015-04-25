class Tennis.Views.ScheduleModalView extends Tennis.Views.ModalView
  form: JST['backbone/templates/schedule_form']

  events: ->
    _.extend({
      'submit form': 'submit'
      }, super)

  initialize: (date) ->
    @date = date

  variables: ->
    _.extend({
      header: 'Бронирование'
      body: @form(date: @date.format('dddd, MMMM Do YYYY, h:mm'))
    }, super)

  submit: (e) =>
    e.preventDefault()
    start = moment(@$('[name=start]').val(), 'dddd, MMMM Do YYYY, h:mm')

    end = moment(start).add(@$('[name=duration]').val(), 'hours')

    window.grid.$el.fullCalendar('select', start, end)

    # window.grid.model.set
      # start: start
      # end: end

    @hide()