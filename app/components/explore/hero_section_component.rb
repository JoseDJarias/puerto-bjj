module Explore
  class HeroSectionComponent < ViewComponent::Base
    def initialize(
      title: "Academia Puerto Jiu-Jitsu",
      subtitle: "Jiu-Jitsu, Boxeo, MMA y más en Puntarenas",
      description: "Desde el 2020 llevando el deporte al otro nivel",
      location: "El Roble, Puntarenas, Costa Rica",
      cta_text: "¡Conócenos mejor!",
      cta_href: nil
    )
      @title = title
      @subtitle = subtitle
      @description = description
      @location = location
      @cta_text = cta_text
      @cta_href = cta_href
    end

    private

    def location_links
      [
        {
          name: "Google Maps",
          href: "https://maps.google.com/?q=9.973693,-84.737694",
          icon: "map-pin",
          aria_label: "Ver ubicación en Google Maps"
        }
      ]
    end
  end
end
