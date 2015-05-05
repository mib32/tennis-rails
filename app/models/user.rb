class User < ActiveRecord::Base
  has_many :orders
  has_many :events, through: :orders
  has_many :event_changes, through: :events
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

  def total
    orders.unpaid.map(&:total).inject(:+)
  end

  def total_hours
    orders.unpaid.map(&:total_hours).inject(:+)
  end

  def changes_total
    event_changes.unpaid.inject(0) {|sum, c| sum + c.event.court.change_price.to_i }
  end

  def navs
    []
  end
end
