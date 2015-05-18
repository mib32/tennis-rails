class DepositRequest < ActiveRecord::Base
  belongs_to :wallet
  composed_of :data, class_name: 'DepositRequestData', mapping: [ %w(id order_id), %w(amount amount)]
end
