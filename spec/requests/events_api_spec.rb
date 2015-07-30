require 'rails_helper'

RSpec.describe "EventsApi", type: :request do
  before(:each) do
    full_setup
    login_via_post_as @user
  end
  describe 'grid at court show view' do 
    it 'Creates new event' do
      post stadium_court_events_path(@court.stadium, @court), {event: {"id"=>"", "start"=>"Mon Jul 20 2015 12:00:00 GMT+0300 (MSK)", "end"=>"Mon Jul 20 2015 12:30:00 GMT+0300 (MSK)", "description"=>"", "recurrence_id"=>"", "recurrence_rule"=>"", "recurrence_exception"=>"", "start_timezone"=>"", "end_timezone"=>"", "is_all_day"=>"false"}}

      expect(Event.count).to eq 2
      expect(Event.last.user.id).to be @user.id
    end


    it 'creates event with additional services' do 
      post stadium_court_events_path(@court.stadium, @court), {event: {"id"=>"", "start"=>"Mon Jul 20 2015 12:00:00 GMT+0300 (MSK)", "end"=>"Mon Jul 20 2015 12:30:00 GMT+0300 (MSK)", "description"=>"", "recurrence_id"=>"", "recurrence_rule"=>"", "recurrence_exception"=>"", "start_timezone"=>"", "end_timezone"=>"", "is_all_day"=>"false", "product_service_ids"=>[@service.id.to_s, @periodic_service.id.to_s]}}

      expect(Event.last.product_services.count).to eq 2
    end

    it 'can move unpaid event freely' do 
      put stadium_court_event_path(@court.stadium, @court, @event.id), {"event"=>{"id"=>@event.id, "start"=>"Mon Jul 20 2015 13:11:00 GMT+0300 (MSK)", "end"=>"Mon Jul 20 2015 12:22:00 GMT+0300 (MSK)", "visual_type"=>"owned", "user_name"=>"TestCustomer@tennis.ru", "description"=>"TestCustomer@tennis.ru", "recurrence_id"=>"", "recurrence_rule"=>"", "recurrence_exception"=>""}}

      @event.reload

      expect(@event.start.min).to eq 11
      expect(@event.end.min).to eq 22
    end

    it 'creates a event change when moves paid event' do 
      @event.order.paid!
      put stadium_court_event_path(@court.stadium, @court, @event.id), {"event"=>{"id"=>@event.id, "start"=>"Mon Jul 20 2015 13:11:00 GMT+0300 (MSK)", "end"=>"Mon Jul 20 2015 12:22:00 GMT+0300 (MSK)", "visual_type"=>"owned", "user_name"=>"TestCustomer@tennis.ru", "description"=>"TestCustomer@tennis.ru", "recurrence_id"=>"", "recurrence_rule"=>"", "recurrence_exception"=>""}}

      @user.reload
      @event.reload

      expect(@event.event_changes.unpaid.count).to eq 1
      expect(@user.event_changes.unpaid.count).to eq 1
      expect(@event.start.min).to eq 11
      expect(@event.end.min).to eq 22
      expect(@event.start_before_change.min).to eq 00
      expect(@event.end_before_change.min).to eq 30
    end
  end
end