class Tennis.Views.ScheduleListView extends Backbone.View
  initialize: ->
    console.log('ok')

  render: ->
    $('.schedule.court').each (el) ->
      $(this).kendoScheduler({
        culture: 'ru-RU'
        date: new Date()
        startTime: new Date("2013/6/13 07:00 AM")
        height: 700
        views: [
          "day",
          {type: "week", selected: true},
          "month"
        ],

        timezone: "Etc/UTC",
        resources:[
          field: 'owned'
          dataSource:[
            { text: 'Своё', value: true, color: 'cadetblue', editable: false },
            { text: 'Чужое', value: false, color: 'rgba(255,136,0,0.5)' }
          ]
        ],
        dataSource: {
          batch: false,
          transport: {
            read: {
              url: '/dashboard/courts/' + $(this).data('grid') + '/events/'
            },
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
            fields: {
              title: { from: "description", defaultValue: "No title", validation: { required: true } },
              start: { type: "date", from: "start" },
              end: { type: "date", from: "end" }
            }
          },
        }
      })
      $(this).data('kendoScheduler').dataSource.read()
