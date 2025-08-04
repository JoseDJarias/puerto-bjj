module Explore
  class SocialLinksComponent < ViewComponent::Base
    def initialize(
      title: "Nuestra comunidad es la mejor parte de Puerto Jiu-Jitsu",
      subtitle: "Síguenos en redes sociales",
      description: "Mantente al día con nuestras últimas noticias, eventos y actualizaciones",
      social_links: default_social_links
    )
      @title = title
      @subtitle = subtitle
      @description = description
      @social_links = social_links
    end

    private

    def default_social_links
      [
        {
          name: "Facebook",
          href: "https://www.facebook.com/puertojiujitsu/",
          icon: "facebook",
          target: "_blank",
          rel: "noopener noreferrer"
        },
        {
          name: "Instagram",
          href: "https://www.instagram.com/puertojiujitsu/",
          icon: "instagram",
          target: "_blank",
          rel: "noopener noreferrer"
        },
        {
          name: "WhatsApp",
          href: "https://wa.me/50672026863?text=Hola,%20me%20gustaría%20obtener%20información%20sobre%20las%20clases%20de%20Jiu-Jitsu",
          icon: "message-circle",
          target: "_blank",
          rel: "noopener noreferrer"
        }
      ]
    end
  end
end
