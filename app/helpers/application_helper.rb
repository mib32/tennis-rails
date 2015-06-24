module ApplicationHelper
  def number_to_integer_currency number
    number_to_currency number, precision: 0
  end

  def stadium_infowindow(stadium)
    result = "#{stadium.name}<br>#{stadium.phone}"
    if stadium.active?
      result += " #{link_to 'Перейти на страницу', stadium}"
    end
    return result
  end

  def stadium_get_category_icon(stadium)
    if stadium.active?
      stadium.category.slug.to_s + '-icon.png'
    elsif stadium.locked?
      'gray-icon.png'
    end
  end
end
