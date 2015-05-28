class StadiumUser < User
  has_one :stadium, foreign_key: "user_id"

  delegate :events, :courts, to: :stadium

  enum status: [:pending, :active]
  after_initialize :set_status, if: :new_record?
  after_initialize :make_stadium, unless: :stadium?

  def set_status
      self.status = "pending" unless self.status
  end

  def make_stadium
    self.create_stadium 
  end

  def name
    attributes["name"] || "Стадион ##{id}"
  end

  def model_name
    User.model_name
  end

  def navs
    [
      {name: 'Корты', link: 'dashboard_path'},
      {name: 'Тренеры', link: 'dashboard_stadium_coaches_path'},
      {name: 'Заказы', link: 'dashboard_orders_path'},
      {name: 'Настройки', items: 
        [
          {name: 'Стадион', link: 'edit_dashboard_stadium_path', active: /stadium/},
          {name: 'Прием платежей', link: '#'}
        ]
      }
    ]
  end
end