class AdditionalEventItem < ActiveRecord::Base
  belongs_to :event
  belongs_to :related, polymorphic: true
end
