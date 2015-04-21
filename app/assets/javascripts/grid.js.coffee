# $ ->
#   $grid = $('[data-grid]')
#   $court = $('#court')

#   $grid.fullCalendar
#     lang: 'ru'
#     events: $grid.data('source')
#     header:
#       left: 'prev,next today'
#       center: 'title'
#       right: 'month, agendaWeek, agendaDay'
#     defaultView: 'agendaWeek'
#     selectable: true
#     selectHelper: true
#     selectOverlap: false
#   # // put your options and callbacks here

#   $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) =>
#     $grid.fullCalendar('render')  
#   $court.on 'change', (e) =>
#     $grid.fullCalendar('removeEventSource', $grid.fullCalendar("eventSources"))
#     $grid.fullCalendar('removeEvents')
#     $grid.fullCalendar('addEventSource', $court.find(":selected").data('source'))

