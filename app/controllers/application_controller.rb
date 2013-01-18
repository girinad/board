class ApplicationController < ActionController::Base
  
  before_filter :set_locale
  
  protect_from_forgery

  def set_locale
    if (params[:locale])
      I18n.locale = params[:locale]
    else
      locale = request.preferred_language_from(I18n.available_locales)
      unless locale
        locale = I18n.default_locale
      end
      redirect_to url_for locale: locale
    end
  end
  
  
  def default_url_options(options={})
    { :locale => I18n.locale }
  end
  
end
