class Wallet < ActiveRecord::Base
  belongs_to :user
  has_many :deposits
  has_many :deposit_requests
  has_many :withdrawals
  has_many :withdrawal_requests

  def deposit! amount
    deposits.create! amount: amount - tax_for(amount)
  end

  def withdraw! amount
    if can_spend? amount
      withdrawals.create! amount: amount 
    else
      errors.add :base, "Недостаточно средств"
      false
    end
  end

  def total
    deposits.sum(:amount) - withdrawals.sum(:amount) + deposit_requests.success.sum(:amount)
  end

  def can_spend? amount
    total - amount > 0
  end

  def tax_for(amount)
    amount.to_f * Option.current.tax / 100
  end
end
