module Explore
  class HeroSectionComponent < ViewComponent::Base
    def initialize(
      title: "Puerto Jiu-Jitsu",
      subtitle: "Academia de Artes Marciales",
      description: "Jiu-Jitsu, Boxeo, MMA en Puntarenas",
      location: "El Roble, Puntarenas, Costa Rica",
      cta_text: "¡Conócenos mejor!",
      cta_href: nil,
      taglines: [
        "¡Tu batalla diaria, para forjar un gran destino!",
        "Disciplina, carácter y confianza en un ambiente de respeto."
      ]
    )
      @title = title
      @subtitle = subtitle
      @description = description
      @location = location
      @cta_text = cta_text
      @cta_href = cta_href
      @taglines = taglines
    end

    private

    def location_links
      [
        {
          name: "Google Maps",
          href: "https://www.google.com/maps/place/Gimnasio+In+Line/@9.9831961,-84.7348988,17z/data=!3m1!4b1!4m6!3m5!1s0x8fa031a7c3d77b43:0x934fb6fd5800c8dc!8m2!3d9.9831908!4d-84.7323239!16s%2Fg%2F11g6nbwflh?entry=ttu",
          icon: "map-pin",
          aria_label: "Ver ubicación en Google Maps"
        },
        {
          name: "Waze",
          href: "https://ul.waze.com/ul?venue_id=180420708.1804010470.13727243&overview=yes&utm_campaign=default&utm_source=waze_website&utm_medium=lm_share_location",
          icon: "navigation",
          aria_label: "Ver ubicación en Waze"
        }
      ]
    end

    def structured_data
      {
        "@context": "https://schema.org",
        "@type": "SportsActivityLocation",
        "name": @title,
        "description": @description,
        "address": {
          "@type": "PostalAddress",
          "addressLocality": "El Roble",
          "addressRegion": "Puntarenas",
          "addressCountry": "CR"
        },
        "geo": {
          "@type": "GeoCoordinates",
          "latitude": 9.9831908,
          "longitude": -84.7323239
        },
        "url": "https://puertojiujitsu.com",
        "sameAs": [
          "https://www.facebook.com/puertojiujitsu/",
          "https://www.instagram.com/puertojiujitsu/"
        ]
      }
    end
  end
end
