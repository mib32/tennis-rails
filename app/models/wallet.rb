class Wallet < ActiveRecord::Base
  belongs_to :user

  def deposit! amount
    update total: total + amount
  end

  def withdraw! amount
    update total: total - amount
  end
end
