class Customer < User
  def navs
    [
      {name: 'Расписание', link: 'dashboard_path'},
      {name: 'Кошелек', link: 'dashboard_deposit_requests_path'},
      {name: 'Настройки', link: 'edit_user_registration_path'},
      {name: 'Заказы', link: 'dashboard_orders_path'}
    ]
  end

  def courts
    Court.find events.pluck('distinct court_id')
  end

  # def model_name
    # User.model_name
  # end
end