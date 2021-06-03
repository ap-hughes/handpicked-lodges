module ApplicationHelper
  def location(property)
    return 'Cairngorms' if property.in_aviemore?

    return 'Perthshire' if property.in_country?

    return ''
  end
end
