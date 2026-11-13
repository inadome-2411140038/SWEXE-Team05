class ApplicationController < ActionController::Base
  before_action :set_locale

  def switch_locale
    locale = params[:locale].to_sym

    if I18n.available_locales.include?(locale)
      session[:locale] = locale
    end

    redirect_back_or_to root_path
  end

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end