module Academy
  LATITUDE = 9.9738892
  LONGITUDE = -84.7375237
  WHATSAPP_NUMBER = "50672026863".freeze
  EMAIL = "infopuertobjj@gmail.com".freeze
  INSTAGRAM_URL = "https://www.instagram.com/puertojiujitsu/".freeze
  FACEBOOK_URL = "https://www.facebook.com/puertojiujitsu/".freeze

  module_function

  def whatsapp_url(message = I18n.t("academy.whatsapp_message"))
    "https://wa.me/#{WHATSAPP_NUMBER}?text=#{ERB::Util.url_encode(message)}"
  end

  def maps_embed_url
    "https://www.google.com/maps?q=#{LATITUDE},#{LONGITUDE}&hl=es&z=17&output=embed"
  end

  def maps_url
    "https://www.google.com/maps/search/?api=1&query=#{LATITUDE},#{LONGITUDE}"
  end
end
