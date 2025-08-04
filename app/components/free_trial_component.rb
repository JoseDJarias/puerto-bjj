# FreeTrialComponent - A reusable component for free trial call-to-action sections
#
# This component provides a consistent way to display free trial CTAs across the application
# with proper accessibility, semantic HTML, and flexible configuration.
#
# @example Basic usage
#   <%= render(FreeTrialComponent.new) %>
#
# @example With custom content
#   <%= render(FreeTrialComponent.new(
#     title: "¡Únete a nosotros!",
#     subtitle: "Descubre el poder del Jiu-Jitsu",
#     cta_text: "Comenzar ahora",
#     whatsapp_message: "Hola, quiero información"
#   )) %>
#
# @example With custom styling
#   <%= render(FreeTrialComponent.new(
#     variant: :secondary,
#     size: :large
#   )) %>
class FreeTrialComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :cta_text, :whatsapp_message, :variant, :size

  def initialize(
    title: "¿Listos para empezar tu aventura?",
    subtitle: "La primera clase es totalmente gratis. ¡No hay nada que perder!",
    cta_text: "¡Quiero mi clase de prueba!",
    whatsapp_message: "Hola, me gustaría obtener información sobre las clases de Puerto Jiu Jitsu.",
    variant: :primary,
    size: :medium
  )
    @title = title
    @subtitle = subtitle
    @cta_text = cta_text
    @whatsapp_message = whatsapp_message
    @variant = variant
    @size = size
  end

  private

  def whatsapp_url
    encoded_message = CGI.escape(@whatsapp_message)
    "https://wa.me/50672026863?text=#{encoded_message}"
  end

  def component_id
    @component_id ||= "free-trial-#{SecureRandom.hex(4)}"
  end

  def container_classes
    [
      "free-trial-cta",
      "free-trial-cta--#{@variant}",
      "free-trial-cta--#{@size}"
    ].compact.join(" ")
  end

  def button_classes
    [
      "free-trial-button",
      "btn",
      "btn--#{@variant}",
      "btn--#{@size}"
    ].compact.join(" ")
  end
end
