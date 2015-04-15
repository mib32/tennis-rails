require 'rails_helper'

RSpec.describe Wallet, type: :model do
  before(:each) { @user = User.create(email: 'user@example.com', password: 'blankertag') }

  subject { @user.wallet }

  describe '#deposit!' do
    it 'enlarges the money amount' do 
      @user.wallet.deposit! 500
      expect(@user.wallet.total).to eq 500
    end
  end
end
