class AdditionalEventItem < ActiveRecord::Base
  belongs_to :event
  belongs_to :related, polymorphic: true

  scope :coach, -> { where('related_type = ?', 'User')}
  scope :not_coach, -> { where('related_type <> ?', 'User')}
end
