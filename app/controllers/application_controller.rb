class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # layout :set_layout
  helper_method :mobile_device?

  private

  def set_layout
    devise_controller? ? 'admin' : false
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS|Android/
    end
  end
end
