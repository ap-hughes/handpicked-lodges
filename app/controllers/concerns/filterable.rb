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
      @available_properties = get_availability(start_date, nights)
      # @days = nights
      # results = self.where(enabled: true).order("random()")
    end

    private

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

    def get_nights(start_date)
      day = Date.parse(start_date).cwday
      if day == 1
        nights = [4, 7, 11, 14, 18, 21]
      elsif day == 5
        nights = [3, 7, 10, 14, 17, 21]
      else
        nights = "unknown value"
      end
      nights
    end
  end
end
