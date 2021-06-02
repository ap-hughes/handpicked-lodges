module ApplicationHelper
  def location(property)
    return 'Cairngorms' if property.in_aviemore?

    'Perthshire'
  end
end
