require 'digest/md5'
class DepositRequestData
  QUERY_STRING = "MerchantId={merchant_id}&OrderId={order_id}&Amount={amount,m}&Currency={currency}&SecurityKey={security_key}&OrderDescription={order_description}"
  MD5_STRING = "MerchantId={merchant_id}&OrderId={order_id}&Amount={amount,m}&Currency={currency}&OrderDescription={order_description}&PrivateSecurityKey={private_security_key}"

  attr_accessor :order_id, :merchant_id, :amount, :currency, :order_description, :private_security_key

  def initialize order_id, amount
    @order_id = order_id
    @merchant_id = Rails.application.secrets.merchant_id
    @amount = amount
    @currency = 'RUB'
    @order_description = "Пополнение кошелька в системе BookingSports"
    @private_security_key = Rails.application.secrets.merchant_key
  end

  def query_string
    interpolate QUERY_STRING
  end

  def payment_url
    URI::encode "https://secure.payonlinesystem.com/ru/payment/select?#{query_string}"
  end

  def security_key
    md5_string = interpolate MD5_STRING
    Digest::MD5.hexdigest(md5_string).downcase
  end

private

  def interpolate string
    string.gsub /\{([a-zA-Z_,]*)\}/ do |match|
      real_match = $1.split(',')
      case real_match.last
      when 'm'
        ActionController::Base.helpers.number_with_precision send(real_match.first), precision: 2, separator: '.'
      else
        send(real_match.first)
      end
    end
  end
end