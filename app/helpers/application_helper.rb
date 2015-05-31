module ApplicationHelper
  def number_to_integer_currency number
    number_to_currency number, precision: 0
  end
  def stadium_infowindow stadium
    if stadium.active?
      "#{stadium.name}<br>#{stadium.phone}<br>#{link_to 'Перейти на страницу', stadium}"
    elsif stadium.locked?
      "#{stadium.name}<br>#{stadium.phone}"
    end
  end
end
