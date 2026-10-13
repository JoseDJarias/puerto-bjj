module PagesHelper
  SLIDE_IMAGES = %w[home/jiujitsugi-hero.jpeg home/jiujitsugiclass-hero.jpeg home/kids-hero.jpeg home/mma-hero.jpeg home/nogi-hero.jpeg].freeze

  def carousel_slides
    SLIDE_IMAGES.zip(t("home.slides")).map { |image, copy| copy.merge(image: image) }
  end

  def program_back_path
    if params[:from] == "home" || request.referer&.match?(%r{/(#.*)?\z})
      root_path(anchor: "disciplinas")
    else
      programs_path
    end
  end

  def program_back_label
    if params[:from] == "home" || request.referer&.match?(%r{/(#.*)?\z})
      t("programs_page.back_home")
    else
      t("programs_page.back")
    end
  end

 HERO_TITLES = [
    { white: "EL TATAMI TE",    red: "ESPERA" },
    { white: "APRENDE A",       red: "LUCHAR" },
    { white: "SUPERA TUS",      red: "LÍMITES" },
    { white: "DA EL PRIMER",    red: "PASO" },
    { white: "DOMINA LA",       red: "TÉCNICA" },
    { white: "ENTRA AL",        red: "TATAMI" },
    { white: "APRENDE A",       red: "DEFENDERTE" },
    { white: "PONTE A",         red: "PRUEBA" },
    { white: "NUNCA DEJES DE",  red: "APRENDER" },
    { white: "CAMBIA TU",       red: "ENFOQUE" }
  ].freeze

  def weekly_phrase
    return nil if HERO_TITLES.empty?

    current_week = Date.current.cweek
    index = current_week % HERO_TITLES.size
    HERO_TITLES[index]
  end
end
