class PropertiesController < ApplicationController
  require 'open-uri'

  def index
    @max_sleeps ||= Property.where(enabled: true).order("sleeps DESC").first.sleeps
    if params[:search].present?
      @properties = available_properties + unavailable_properties
      store_search(params)
      respond_to do |format|
        format.html
        format.js
      end
    elsif params[:query].present?
      @properties = Property.filter(params[:query].slice(:wood_stove, :pet_friendly, :hot_tub, :sauna, :in_aviemore, :in_country, :sauna_or_hot_tub)).where(enabled: true).order(Arel.sql("random()")).with_attached_main_image.with_attached_photos
    else
      @properties = Property.where(enabled: true).order(Arel.sql("random()")).with_attached_main_image.with_attached_photos
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

  private

  def store_search(params)
    session[:search] = params[:search]
  end

  def available_properties
    if params[:search][:start_date].present? && params[:search][:nights].present?
      @available_properties = Property.where(enabled: true).where(location).where("sleeps >= ?", params[:search][:sleeps].to_i).order(Arel.sql("random()")).with_attached_main_image.with_attached_photos.search(params)
    else
      @available_properties = Property.where(enabled: true).where(location).where("sleeps >= ?", params[:search][:sleeps].to_i).order(Arel.sql("random()")).with_attached_main_image.with_attached_photos
    end
  end

  def unavailable_properties
    @unavailable_properties = Property.where.not(id: @available_properties).where(enabled: true).where("sleeps >= ?", params[:search][:sleeps].to_i).where(location).order(Arel.sql("random()")).with_attached_main_image.with_attached_photos
  end

  def location
    return { in_aviemore: true } if params[:search][:location] == 'Cairngorms'

    return { in_country: true } if params[:search][:location] == 'Perthshire'

    return ''
  end
end
