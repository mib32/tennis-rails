class Order < ActiveRecord::Base
  belongs_to :user 
  has_many :events
  accepts_nested_attributes_for :events

  # after_initialize :create_order_items, if: :new_record?
  # attr_accessor :order_items

  # def create_order_items
  #   @order_items = []
  # end

  def total
    events.inject(&:total)
  end
end
