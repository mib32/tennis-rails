class Order < ActiveRecord::Base
  belongs_to :user 
  belongs_to :stadium
  has_many :events, dependent: :destroy
  has_many :event_changes, dependent: :destroy
  accepts_nested_attributes_for :events
  enum status: [:unpaid, :paid, :change, :rain, :other]

  def total
    events.map(&:total).inject(:+).to_i + event_changes.map(&:total).inject(:+).to_i
  end

  def total_hours
    events.map(&:duration_in_hours).inject(:+)
  end

  def guid
    "#%06d" % id
  end

  def human_status
    if status?
      I18n.translate status, scope: 'simple_form.options.order.status'
    else
      ''
    end
  end
end
