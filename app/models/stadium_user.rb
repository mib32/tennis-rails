class StadiumUser < User
  has_one :stadium, foreign_key: "user_id"

  delegate :events, :courts, to: :stadium

  def name
    attributes["name"] || "Стадион ##{id}"
  end

  def navs
    [
      {name: 'Корты', link: 'dashboard_path'},
      {name: 'Тренеры', link: '#'},
      {name: 'Заказы', link: 'dashboard_orders_path'},
      {name: 'Настройки', items: 
        [
          {name: 'Стадион', link: 'edit_dashboard_stadium_path', active: /stadium/},
          {name: 'Прием платежей', link: 'dashboard_payment_settings_path'}
        ]
      }
    ]
  end
end