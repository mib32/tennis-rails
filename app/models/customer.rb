class Customer < User
  def navs
    [
      {name: 'Расписание', link: 'dashboard_path'},
      {name: 'Кошелек', link: 'dashboard_deposit_requests_path'},
      {name: 'Настройки', link: 'edit_user_registration_path'}
    ]
  end

  def courts
    Court.find events.pluck('distinct court_id')
  end
end