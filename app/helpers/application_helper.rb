module ApplicationHelper
  def number_to_integer_currency number
    number_to_currency number, precision: 0
  end
end
