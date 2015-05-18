class DepositResponse < ActiveRecord::Base
  belongs_to :deposit_request
  composed_of :data, class_name: 'DepositResponseData'

end
