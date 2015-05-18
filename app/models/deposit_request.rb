class DepositRequest < ActiveRecord::Base
  belongs_to :wallet
  composed_of :data, class_name: 'DepositRequestData', mapping: [ %w(id order_id), %w(amount amount)]
  has_many :deposit_responses

  def status
    case
    when deposit_responses.none?
      'В обработке'
    when deposit_responses.any? && deposit_response.last.success?
      'Успешно'
    else
      'Ошибка'
    end
  end
end
