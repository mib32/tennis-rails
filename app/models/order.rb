class Order < ActiveRecord::Base
  belongs_to :user 
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events
  enum status: [:unpaid, :paid]

  # after_initialize :create_order_items, if: :new_record?
  # attr_accessor :order_items

  # def create_order_items
  #   @order_items = []
  # end

  def total
    events.map(&:total).inject(:+)
  end

  def total_hours
    events.map(&:duration_in_hours).inject(:+)
  end

  def guid
    "#%06d" % id
  end
end
