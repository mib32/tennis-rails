class Customer < User
  has_many :events
  has_many :orders, foreign_key: 'user_id'
end