class Tennis.Views.MyScheduleView extends Tennis.Views.ScheduleView
  url: ->
    @mainUrl || window.location.pathname + '/my_events'
