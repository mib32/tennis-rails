require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:all) { full_setup }
  before(:each) do 
    @event = Event.create start: Time.parse('12:00:00'), end: Time.parse('14:30:00'), user: @user
  end
  it 'has right total for periodic service' do
    @periodic_service = ProductService.create service: Service.new(name: 'Синема'), price: 10, product: @court, periodic: "1"
    
    @event.product_services << @periodic_service

    puts @event.occurrences.inspect
    puts @event.recurring?.inspect
    puts @event.schedule.inspect
    puts @event.schedule.occurrences(Time.current + 1.month)
    puts @event.schedule.all_occurrences
    puts @event.schedule.terminating?

    expect(@event.total).to eq 10 * 3
  end

  it 'has right total for non-periodic service' do
    @non_periodic_service = ProductService.create service: Service.new(name: 'Синема'), price: 77, product: @court
    
    @event.product_services << @non_periodic_service    
    
    expect(@event.total).to eq 77
  end
end
