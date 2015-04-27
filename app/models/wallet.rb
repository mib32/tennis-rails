class Wallet < ActiveRecord::Base
  belongs_to :user

  def deposit! amount
    update total: total + amount if amount >= 0
  end

  def withdraw! amount
    update total: total - amount if amount >= 0
  end
end
