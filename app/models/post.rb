# post = Post.new
# Globalize.with_locale(:en){ post.title = 'Hoge' }
# Globalize.with_locale(:ja){ post.title = 'ほげ' }
#
# I18n.locale = 'en'
# post.title #=> "Hoge"
# I18n.locale = 'ja'
# post.title #=> "ほげ"
class Post < ActiveRecord::Base
  # title および text で翻訳データを扱う、空の場合は他の言語で縮退運転
  translates :title, :text, fallbacks_for_empty_translations: true
  validates :title, presence: true

  # 作成の際に別の言語バージョンを翻訳して保存しておく
  # 翻訳は超遅いので、実際にはActiveJobを使うなどして非同期で入るようにする
  before_create :translate_attributes

  private
  def translate_attributes
    translate_from = I18n.locale
    (I18n.available_locales - [I18n.locale]).each do |translate_to|
      translated_attributes.each do |attr_name, value|
        next unless value.present?
        translated = microsoft_translator.translate(value, translate_from,
                                                    translate_to, 'text/plain')
        self.attributes = { attr_name => translated, locale: translate_to }
      end
    end
    true
  end

  def microsoft_translator
    @translator ||= MicrosoftTranslator::Client.new(ENV['MICROSOFT_CLIENT_ID'],
                                                    ENV['MICROSOFT_CLIENT_SECRET'])
  end
end
