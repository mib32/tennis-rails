class Coach < User
  include Gravtastic
  is_gravtastic

  mount_uploader :avatar, PictureUploader
  
  has_many :coaches_courts
  has_many :courts, through: :coaches_courts
  after_initialize :make_profile, unless: "coach_profile.present?"
  has_one :coach_profile, foreign_key: "user_id", dependent: :destroy
  has_one :additional_order_item, as: :related
  accepts_nested_attributes_for :coach_profile

  delegate :description, to: :coach_profile
  # validate :has_at_least_one_court

  def make_profile
    self.create_coach_profile
  end

  def navs
    [
      {name: 'Расписание', link: 'dashboard_path'},
      {name: 'Стадионы', link: 'dashboard_courts_path'},
      {name: 'Клиенты', link: 'dashboard_customers_path'},
      {name: 'Кошелек', link: 'dashboard_deposit_requests_path'},
      {name: 'Настройки', link: 'edit_dashboard_coach_path'}
    ]
  end

  def has_at_least_one_court
    if courts.size < 1
      errors.add :courts, 'Выберите хотя бы один корт.'
    end
  end

  def name
    attributes["name"] || "Тренер ##{id}"
  end

  def events
    Event.joins(:additional_event_items).where('additional_event_items.related_type = ? and additional_event_items.related_id = ?', 'User', self.id)
  end

  def customers
    User.find(events.joins(:order).pluck("orders.user_id").uniq)
  end

end