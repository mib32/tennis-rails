require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:all) { full_setup }
  before(:each) do 
    @event = Event.create start: Time.parse('12:00:00'), end: Time.parse('14:30:00'), user: @user
  end
  describe '#occurrences' do 
    it 'shows 1 if it is no repeats' do 
      expect(@event.occurrences).to eq 1
    end
    it 'shows number of repeats' do 
      @event.recurrence_rule = 'FREQ=DAILY;COUNT=10'

      @event.save!

      expect(@event.occurrences).to eq 10
    end
  end
  describe '#duration_in_hours' do
    it 'shows duration in hours' do 
      expect(@event.duration_in_hours).to eq 3
    end
  end

  describe '#hours' do 
    it 'returns array of hours on which event is going' do 
      expect(@event.hours).to eq [12,13,14]
    end
  end

  it 'has price of a courts hour' do 
    @event.products = [@court]

    @event.save!

    expect(@event.total).to eq 100 * 3
  end
  it 'has price of a  courts hour regarding special price' do 
    special_price = SpecialPrice.create start: 2.days.ago, stop: 2.days.from_now
    price_rules = [DailyPriceRule.create(start: '11:00', stop: '13:00', price: 200, working_days: [DateTime.now.wday]), DailyPriceRule.create(start: '13:00', stop: '14:00', price: 50, working_days: [DateTime.now.wday])]
    special_price.daily_price_rules = price_rules
    special_price.save!
    @stadium.special_prices = [special_price]
    @stadium.save!
    @court.reload
    @event.products = [@court]

    @event.save!

    expect(@event.total).to eq 200 * 1 + 50 * 1 + 100 * 1
  end
  it 'has right total for periodic service' do
    @periodic_service = ProductService.create service: Service.new(name: 'Синема'), price: 10, product: @court, periodic: "1"
    
    @event.product_services << @periodic_service

    expect(@event.total).to eq 10 * 3
  end

  it 'has right total for non-periodic service' do
    @non_periodic_service = ProductService.create service: Service.new(name: 'Синема'), price: 77, product: @court
    
    @event.product_services << @non_periodic_service    
    
    expect(@event.total).to eq 77
  end
end
