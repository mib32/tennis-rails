class SpecialPrice < ActiveRecord::Base
  belongs_to :court

  scope :current, -> do
    where('LOCALTIMESTAMP BETWEEN "start" AND "end"').last || new
  end
end
