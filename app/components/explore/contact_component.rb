module Explore
  class ContactComponent < ViewComponent::Base
    def initialize(
      title: "Contáctanos",
      subtitle: "Responderemos todos tus consultas e inquietudes, escucharemos tus comentarios. Estamos aca para servirte y ser parte de tu crecimiento personal.",
      contact_info: default_contact_info,
      feedback_cta: default_feedback_cta
    )
      @title = title
      @subtitle = subtitle
      @contact_info = contact_info
      @feedback_cta = feedback_cta
    end

    private

    def default_contact_info
      [
        {
          icon: "map-pin",
          title: "Ubicación",
          text: "Gimnasio In Line, Puntarenas, Costa Rica",
          cta_text: "Ver en Google Maps",
          cta_href: "https://www.google.com/maps/place/Gimnasio+In+Line/@9.9831961,-84.7348988,17z/data=!3m1!4b1!4m6!3m5!1s0x8fa031a7c3d77b43:0x934fb6fd5800c8dc!8m2!3d9.9831908!4d-84.7323239!16s%2Fg%2F11g6nbwflh?entry=ttu",
          cta_icon: "map",
          target: "_blank",
          rel: "noopener noreferrer"
        },
        {
          icon: "phone",
          title: "WhatsApp",
          text: "+506 7202-6863",
          cta_text: "Chatear en WhatsApp",
          cta_href: "https://wa.me/50672026863?text=Hola,%20me%20gustaría%20obtener%20información%20sobre%20las%20clases%20de%20Jiu-Jitsu",
          cta_icon: "message-circle",
          target: "_blank",
          rel: "noopener noreferrer"
        },
        {
          icon: "mail",
          title: "Email",
          text: "infopuertobjj@gmail.com",
          cta_text: "Enviar email",
          cta_href: "mailto:infopuertobjj@gmail.com",
          cta_icon: "mail"
        },
        {
          icon: "clock",
          title: "Horario de Atención",
          text: "Lunes a Viernes: 8:00 AM - 9:00 PM",
          text_secondary: "Sábados: 9:00 AM - 5:00 PM"
        }
      ]
    end

    def default_feedback_cta
      {
        icon: "message-square",
        title: "¿Tienes algo que decirnos?",
        text: "Tu opinión es muy importante para nosotros. Comparte tus comentarios, sugerencias o preguntas a través de nuestro formulario de feedback.",
        cta_text: "Enviar Feedback",
        cta_href: "feedback_path",
        cta_icon: "send"
      }
    end

    def contact_id
      @contact_id ||= "contact_#{SecureRandom.hex(4)}"
    end

    def contact_info_id
      "#{contact_id}_info"
    end

    def feedback_cta_id
      "#{contact_id}_feedback"
    end

    def resolve_path(path_string)
      # Convert string path to actual Rails path helper
      case path_string
      when "feedback_path"
        feedback_path
      else
        path_string
      end
    rescue NoMethodError
      "#" # Fallback if path doesn't exist
    end
  end
end
