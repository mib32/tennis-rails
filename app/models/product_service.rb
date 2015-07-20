class ProductService < ActiveRecord::Base
  belongs_to :product
  belongs_to :service
  has_and_belongs_to_many :events

  def service_name_and_price
    "#{service.name} (#{price} руб.)"
  end
end
