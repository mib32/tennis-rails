class EventMailer < ApplicationMailer

  def date_change_mail(event)
    @event = event
    @event.changes_applied
    mail(to: event.order.associated_emails, subject: '⚽️ Bookingsports: Занятие перенесено')
  end
end
