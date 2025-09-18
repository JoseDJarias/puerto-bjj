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
#   )) %>
class UI::FreeTrialComponent < ViewComponent::Base
  attr_reader :title, :subtitle, :cta_text, :whatsapp_message, :variant, :show_on

  def initialize(
    title: "¿Listos para empezar tu aventura?",
    subtitle: "La primera clase es totalmente gratis. ¡No hay nada que perder!",
    cta_text: "¡Quiero mi clase de prueba!",
    whatsapp_message: "Hola, me gustaría obtener información sobre las clases de Puerto Jiu Jitsu.",
    variant: :primary,
    show_on: :all
  )
    @title = title
    @subtitle = subtitle
    @cta_text = cta_text
    @whatsapp_message = whatsapp_message
    @variant = variant
    @show_on = show_on
  end

  erb_template <<~ERB
  <section class="<%= container_classes %>" aria-labelledby="<%= component_id %>-title">
    <header class="free-trial-header">
      <h2 id="<%= component_id %>-title" class="free-trial-title">
        <%= @title %>
      </h2>
      <p class="free-trial-subtitle">
        <%= @subtitle %>
      </p>
    </header>

    <div class="free-trial-action">
      <%= link_to whatsapp_url,
          class: button_classes,
          target: "_blank",
          rel: "noopener noreferrer",
          aria: {
            label: "Abrir WhatsApp para solicitar clase de prueba gratuita"
          } do %>
        <span class="free-trial-button-text">
          <%= @cta_text %>
        </span>
        <%= render(UI::IconComponent.new(
          name: "mouse-pointer-click",
          aria_label: "Icono de clic"
        )) %>
      <% end %>
    </div>
  </section>
  ERB

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
      "free-trial-cta--#{@size}",
      visibility_classes
    ].compact.join(" ")
  end

  def button_classes
    [
      "free-trial-button",
      "btn",
      "btn--#{@variant}"
    ].compact.join(" ")
  end

  private

  def visibility_classes
    case @show_on
    when :mobile_only
      "free-trial-cta--mobile-only"
    when :desktop_only
      "free-trial-cta--desktop-only"
    when :mobile_tablet
      "free-trial-cta--mobile-tablet"
    when :tablet_desktop
      "free-trial-cta--tablet-desktop"
    else
      "" # :all - show everywhere
    end
  end
end
