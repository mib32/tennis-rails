class AdminWallet
  def self.find
    Wallet.where(user: Admin.first).last
  end
end