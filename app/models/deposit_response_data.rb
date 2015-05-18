class DepositResponseData
  include Payments::Utility
  MD5_STRING = "DateTime={datetime}&TransactionID={transaction_id}&OrderId={order_id}&Amount={amount}&Currency={currency}&PrivateSecurityKey={private_security_key}"

  attr_reader :raw_data, :datetime, :transaction_id, :order_id, :amount, :currency

  def initialize(params)
    @raw_data = params
    Rails.logger.debug params
    @datetime = params["DateTime"]
    @transaction_id = params["TransactionID"]
    @order_id = params["OrderId"]
    @amount = params["Amount"]
    @currency = params["Currency"]
    @private_security_key = Rails.application.secrets.merchant_key
  end

end