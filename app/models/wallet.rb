class Wallet < ActiveRecord::Base
  belongs_to :user
  has_many :deposits
  has_many :withdrawals

  def deposit! amount
    deposits.create! amount: amount
  end

  def withdraw! amount
    withdrawals.create! amount: amount
  end

  def total
    deposits.sum(:amount) - withdrawals.sum(:amount)
  end
end
