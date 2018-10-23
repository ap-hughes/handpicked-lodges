module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present? && value == "true"
      end
      results
    end

    def search(search_params)
      start_date = search_params[:search][:start_date]
      nights = search_params[:search][:nights]
      availability = get_availability(start_date, nights)
      properties = self.where(code: availability.keys)
      availability.each do |key, value|
        properties.each do |property|
          if property.code == key
            property.price = value[:price]
            property.book_link = value[:book_link]
            if property.book_link.empty?
              property.price_message = "This lodge is available on #{Date.parse(start_date).strftime('%d %b %Y')} but check-in / check-out are on different dates"
            end
            property.start_date = start_date
            property.nights = nights
          end
        end
      end
      properties
      # raise
      # @properties.each do |prop|
      #   prop.price = 100
      #   prop.book_link = value[:book_link]
      #   prop.price_message = value[:price_message]
      # end
      # availability.each do |key, value|
      #   self.where(code: key).each do |prop|
      #     prop.price = value[:price]
      #     prop.book_link = value[:book_link]
      #     prop.price_message = value[:price_message]
      #   end
      # end
      # raise
    end

    private

    def property_params
      params.require(:property).permit(:price, :book_link, :price_message)
    end

    def get_availability(start_date, nights)
      super_control = ENV["SUPER_CONTROL"]
      url = "http://api.supercontrol.co.uk/xml/filter3.asp?siteID=#{super_control}&startdate=#{start_date}&numbernights=#{nights}&basic_details=1"
      propertycode = []
      available_properties = {}
      document = Nokogiri::XML(open(url))
      document.root.xpath('property').each do |property|
        propertycode << property.xpath('propertycode').text.to_i
        propertycode.each do |code|
          if code == property.xpath('propertycode').text.to_i
            available_properties[code] = {
              price: property.xpath('.//rate').text.to_i,
              book_link: property.xpath('.//booklink').text,
              price_message: property.xpath('.//pricemessage').text
            }
          end
        end
      end
      available_properties
    end
  end
end
