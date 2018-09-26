class PropertiesController < ApplicationController
  require 'open-uri'

  def index
    @properties = Property.where(nil)
    if params[:search].present?
      start_date = params[:search][:start_date]
      end_date = params[:search][:end_date]
      @available_properties = get_availability(start_date, end_date)
      @properties = Property.where(enabled: true).order(:name)
      start_date = Date.parse params[:search][:start_date]
      end_date = Date.parse params[:search][:end_date]
      @days = (end_date - start_date).to_i
      # super_control = ENV['SUPER_CONTROL']
      # url = "http://api.supercontrol.co.uk/xml/filter3.asp?siteID=#{super_control}&startdate=#{start_date}&numbernights=#{@days}&basic_details=1"
      # document = Nokogiri::XML(open(url))
      # hash = {}
      # @propertycode.each { |code| hash[code] = "something" }
      # hash
      # raise
      # document.root.xpath('property').each do |property|
      #   hash.merge!(property_code: property.xpath('propertycode').text.to_i)
      #   hash.merge!(price: property.xpath('.//rate').text.to_i)
      #   hash.merge!(book_link: property.xpath('.//booklink').text)
      # end
      # hash
      # raise
    elsif params[:query].present?
      filtering_params(params[:query]).each do |key, value|
        @properties = @properties.public_send(key, value).where(enabled: true).order(:name) if value.present? && value == "true"
      end
      # @properties = @properties.wood_stove(params[:query][:wood_stove]).order(:name) if params[:query][:wood_stove].present?
      # @properties = @properties.hot_tub(params[:query][:hot_tub]).order(:name) if params[:query][:hot_tub].present?
      # @properties = @properties.pet_friendly(params[:query][:pet_friendly]).order(:name) if params[:query][:pet_friendly].present?
      # @properties = @properties.sauna(params[:query][:sauna]).order(:name) if params[:query][:sauna].present?
      # @wood_stove = params[:query]["wood_stove"].present? ? params[:query]["wood_stove"] : nil
      # @hot_tub = params[:query]["hot_tub"].present? ? params[:query]["hot_tub"] : nil
      # @pet_friendly = params[:query]["pet_friendly"].present? ? params[:query]["pet_friendly"] : nil
      # @sauna = params[:query]["sauna"].present? ? params[:query]["sauna"] : nil
      # sql_query = " \
      #   properties.wood_stove ILIKE :query \
      #   OR properties.hot_tub ILIKE :query \
      #   OR properties.pet_friendly ILIKE :query \
      #   OR properties.sauna ILIKE :query \
      # "
      # # @properties = Property.where(hot_tub: true).order(:name)
      # @properties = Property.where(sql_query, query: "%#{params[:query]}%").order(:name)
    else
      @properties = Property.where(enabled: true).order(:name)
    end
  end

  def show
    if params[:book_link].present?
      @property = Property.where(enabled: true).find(params[:id])
      @price = params[:price]
      @book_link = params[:book_link]
      @start_date = Date.parse params[:start_date]
      @end_date = Date.parse params[:end_date]
      @days = (@end_date - @start_date).to_i
    # reactivate below if supercontrol works again, put line below back in index link
    # link_to property_path(property, :startdate => @startdate, :enddate => @enddate) do
    # if params[:startdate].present?
    #   super_control = ENV["SUPER_CONTROL"]
    #   start_date = Date.parse params[:startdate]
    #   end_date = Date.parse params[:enddate]
    #   days = (end_date - start_date).to_i
    #   @property = Property.find(params[:id])
    #   url = "http://api.supercontrol.co.uk/xml/get_price.asp?id=#{@property.code}&startdate=#{start_date}&numbernights=#{days}"
    #   document = Nokogiri::XML(open(url))
    #   @price = document.root.xpath('price').text
    #   @book_link = document.root.xpath('booklink').text
    #   @message = document.root.xpath('message').text
    else
      @property = Property.where(enabled: true).find(params[:id])
    end
  end

  private

  def filtering_params(params)
    params.slice(:wood_stove, :pet_friendly, :hot_tub, :sauna, :in_aviemore, :in_country)
  end

  def get_availability(start_date, end_date)
    super_control = ENV["SUPER_CONTROL"]
    url = "http://api.supercontrol.co.uk/xml/filter3.asp?siteID=#{super_control}&startdate=#{start_date}&enddate=#{end_date}&basic_details=1"
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
