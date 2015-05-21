class Coach < User
  include Gravtastic
  is_gravtastic
  
  has_and_belongs_to_many :courts, join_table: 'coaches_courts'
  has_one :additional_order_item, as: :related

  validate :has_at_least_one_court

  def navs
    [
      {name: 'Расписание', link: 'dashboard_path'},
      {name: 'Кошелек', link: 'dashboard_deposit_requests_path'},
      {name: 'Настройки', link: 'edit_user_registration_path'}
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

end