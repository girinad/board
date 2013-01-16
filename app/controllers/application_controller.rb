class ApplicationController < ActionController::Base
  
  before_filter :set_locale
  
  protect_from_forgery

  def set_locale
    if params[:ln].present?
      I18n.locale = session[:ln] = params[:ln]
    else
      I18n.locale = session[:ln]
    end
  end

end
