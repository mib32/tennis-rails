class User < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  include FriendlyId
  friendly_id :name, use: [:slugged]

  has_many :orders
  has_many :events, through: :orders
  has_many :event_changes, through: :events
  has_one :wallet, dependent: :destroy
  after_create :create_wallet

  after_initialize :set_customer, if: :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def set_customer
    self.type = 'Customer' unless self.type
  end

  def public_type= type
    if type == 'Admin'
      raise 'Нельзя стать админом просто так!'
    else
      self.becomes! type.constantize
    end
  end

  def total
    orders.unpaid.map(&:total).inject(:+)
  end

  def total_hours
    orders.unpaid.map(&:total_hours).inject(:+) || 0
  end

  def changes_total
    event_changes.unpaid.inject(0) {|sum, c| sum + c.event.court.change_price.to_i }
  end

  def navs
    []
  end

  def method_missing t
    if t.to_s.ends_with? '?'
      type == t.to_s.to(-2).camelcase
    end
  end

  def name_for_admin
    name.to_s + " (#{email})"
  end

  def admin?
    false
  end
end
