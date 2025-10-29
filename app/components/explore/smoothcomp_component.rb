module Explore
  class SmoothcompComponent < ViewComponent::Base
    def initialize(
      title: "Nuestro Perfil Competitivo",
      subtitle: "Resultados y estadísticas de nuestro equipo en torneos oficiales.",
      stats: default_stats,
      cta_text: "Ver Perfil Completo en Smoothcomp",
      cta_href: "https://smoothcomp.com/es/club/25466?embedView=1"
    )
      @title = title
      @subtitle = subtitle
      @stats = stats
      @cta_text = cta_text
      @cta_href = cta_href
    end

    private

    def default_stats
      [
        {
          type: :gold,
          count: 14,
          label: "Oro",
          icon: "award",
          color_class: "gold"
        },
        {
          type: :silver,
          count: 14,
          label: "Plata",
          icon: "award",
          color_class: "silver"
        },
        {
          type: :bronze,
          count: 10,
          label: "Bronce",
          icon: "award",
          color_class: "bronze"
        }
      ]
    end

    def smoothcomp_id
      @smoothcomp_id ||= "smoothcomp_#{SecureRandom.hex(4)}"
    end

    def stats_id
      "#{smoothcomp_id}_stats"
    end
  end
end
