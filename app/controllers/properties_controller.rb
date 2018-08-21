class PropertiesController < ApplicationController
  require 'open-uri'
  before_action :find_property, except: [:new, :create, :index]

  def new
    @property = Property.new
    @property.photos.build
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:notice] = "Successfully created property!"
      redirect_to properties_path
    else
      render :new
    end
  end

  def index
    if params[:search].present?
      start_date = params[:search][:start_date]
      end_date = params[:search][:end_date]
      @available_properties = get_availability(start_date, end_date)
      @properties = Property.order(:name)
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
      @sleeps = params[:query]["sleeps"].present? ? params[:query]["sleeps"] : nil
      @properties = Property.where(sleeps: @sleeps.to_i).order(:name)
    else
      @properties = Property.order(:name)
    end
  end

  def show
    if params[:book_link].present?
      @property = Property.find(params[:id])
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
      @property = Property.find(params[:id])
    end
  end

  def edit
    @property.photos.build
  end

  def update
    if @property.update(property_params)
      redirect_to property_path(@property)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def find_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:code, :enabled, :name, :sleeps, :headline, :description, :min_daily_price, :bedrooms, :bathrooms,
      :wood_stove, :hot_tub, :pet_friendly, :sauna, :features, :latitude, :longitude, :hero_image, photos_attributes: [:id, :image])
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
