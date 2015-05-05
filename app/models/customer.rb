class Customer < User
  def navs
    [
      {name: 'Расписание', link: 'dashboard_path'},
      {name: 'Кошелек', link: '#'},
      {name: 'Настройки', link: '#'}
    ]
  end

  def courts
    Court.find events.pluck('distinct court_id')
  end
end