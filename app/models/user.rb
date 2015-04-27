class User < ActiveRecord::Base
  has_one :wallet
  after_create :create_wallet

  after_create :set_customer

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def set_customer
    self.type = 'Customer' unless self.type
  end
end
