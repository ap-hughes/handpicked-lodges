class PropertiesController < ApplicationController
  require 'open-uri'

  def index
    if params[:search].present?
      available_properties = Property.where(enabled: true).order("random()").search(params)
      unavailable_properties = Property.where.not(id: available_properties).where(enabled: true).order("random()")
      @properties = available_properties + unavailable_properties
      store_search(params)
      respond_to do |format|
        format.html
        format.js
      end
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

  private

  def store_search(params)
    session[:search] = params[:search]
  end
end
