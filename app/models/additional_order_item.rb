class AdditionalOrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :related, polymorphic: true
end
