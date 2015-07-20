class Customer < User
  def navs
    [
      {name: 'Расписание', link: 'grid_dashboard_events_path'},
      {name: 'Кошелек', link: 'dashboard_deposit_requests_path'},
      {name: 'Настройки', link: 'edit_user_registration_path'},
      {name: 'Заказы', link: 'private_events_path'}
    ]
  end

  def products
    Product.where id: events.map(&:product_ids).flatten
  end

  # def model_name
    # User.model_name
  # end
end