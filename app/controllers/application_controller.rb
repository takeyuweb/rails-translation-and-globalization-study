class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  private
  def set_locale
    I18n.locale = get_locale
  end

  # 1.パス /:locale/
  # 2.Accept-Languagesヘッダの中で一番最初の対応言語
  # 3.デフォルト
  # の順で使用する言語を判定
  def get_locale
    path_locale = params[:locale]
    browser_locale = http_accept_language.compatible_language_from(I18n.available_locales)

    path_locale.presence ||
        browser_locale.presence ||
        I18n.default_locale
  end

  def path_locale
    params[:locale].presence
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end
end
