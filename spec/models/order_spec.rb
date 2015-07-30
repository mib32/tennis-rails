require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:each) do
    full_setup
  end

  describe '#total' do
    it 'returns correct value' do 
      puts @order.total.to_s + ' = ' + @event.total.to_s
      expect(@order.total).to eq @event.total
    end
  end
  describe '#pay!' do
    it 'gives money to whom it belongs' do 
      @order.pay!

      expect(@coach.owner.wallet.total).to eq 285
      expect(@court.owner.wallet.total).to eq 323.0
      expect(AdminWallet.find.total).to eq 640 - (285 + 323.0)
      expect(@user.wallet.total).to eq 360
    end

    it 'fails when insufficient funds' do
      @user.wallet.withdraw! 1000

      expect { @order.pay! }.to raise_error

    end
  end
end
