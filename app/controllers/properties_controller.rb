class PropertiesController < ApplicationController
  require 'open-uri'

  def index
    @availability_search = AvailabilitySearch.new
    @properties = Property.where(nil)
    if params[:search].present?
      @available_properties = Property.where(enabled: true).order("random()").search(params)

      # @properties = Property.where(enabled: true).order("random()")
      # start_date = params[:search][:start_date]
      # nights = params[:search][:nights]
      # @days = get_nights(start_date)
      # @available_properties = get_availability(start_date, nights)
      # @days = nights
    elsif params[:query].present?
      @properties = Property.filter(params[:query].slice(:wood_stove, :pet_friendly, :hot_tub, :sauna, :in_aviemore, :in_country, :sauna_or_hot_tub)).where(enabled: true).order("random()")
    else
      @properties = Property.where(enabled: true).order("random()")
    end
  end

  def show
    if params[:book_link].present?
      @property = Property.where(enabled: true).find(params[:id])
      @price = params[:price]
      @book_link = params[:book_link]
      @start_date = Date.parse params[:start_date]
      @end_date = @start_date + params[:nights].to_i
      @days = params[:nights]
    else
      @property = Property.where(enabled: true).find(params[:id])
    end
  end

  def search
    raise
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
