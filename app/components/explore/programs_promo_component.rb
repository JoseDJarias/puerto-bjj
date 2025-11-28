module Explore
  class ProgramsPromoComponent < ViewComponent::Base
    include PathResolver

    def initialize(
      title: "Conoce más sobre nuestros programas",
      programs: default_programs
    )
      @title = title
      @programs = programs
    end

    private

    def default_programs
      [
        {
          icon: "shield",
          title: "Programa Kids",
          description: "Un ambiente seguro y divertido donde los más pequeños cultivan su carácter y confianza mientras crean amistades para toda la vida.",
          cta_text: "¡Quiero conocer más!",
          cta_href: "kids_program_path"
        },
        {
          icon: "swords",
          title: "Programas para Adultos",
          description: "Descubre todas las disciplinas que ofrecemos, desde Jiu-Jitsu (Gi & No-Gi) y Boxeo hasta MMA.",
          cta_text: "Explorar Programas",
          cta_href: "programs_path"
        }
      ]
    end
  end
end
