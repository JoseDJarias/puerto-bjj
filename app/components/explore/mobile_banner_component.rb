module Explore
  class MobileBannerComponent < ViewComponent::Base
    def initialize(
      image_src: "home/logo.jpg",
      image_alt: "Puerto Jiu-Jitsu large logo banner",
      image_class: "explore-banner-image"
    )
      @image_src = image_src
      @image_alt = image_alt
      @image_class = image_class
    end

    private

    def banner_id
      @banner_id ||= "mobile_banner_#{SecureRandom.hex(4)}"
    end
  end
end
