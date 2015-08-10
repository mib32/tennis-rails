class EventMailer < ApplicationMailer

  def date_change_mail(to, event_change)
    @event_change = event_change
    @event = event_change.event
    # @event.changes_applied

    mail(to: to, subject: '⚽️ Bookingsports: Занятие перенесено')
  end
end
