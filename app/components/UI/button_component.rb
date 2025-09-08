class UI::ButtonComponent < ViewComponent::Base
  def initialize(
    variant: :primary,
    text: "",
    href: nil,
    icon: nil,
    loading: false,
    disabled: false,
    **options
  )
    @variant = variant
    @text = text
    @href = href
    @icon = icon
    @disabled = disabled
    @options = options
  end

  erb_template <<~ERB
    <% if @href.present? %>
      <%= link_to @href, class: button_classes, disabled: @disabled, **@options do %>
      <%= render_icon %>
        <%= @text %>
      <% end %>
    <% else %>
      <%= button_tag type: @options[:type] || 'button',
                     class: button_classes,
                     disabled: @disabled,
                     **@options do %>
        <%= render_icon %>
        <%= @text %>
      <% end %>
    <% end %>
  ERB

  private

  def button_classes
    classes = [
      "btn",
      variant_classes,
    ].compact.join(" ")

    if @disabled
      classes += " opacity-50 cursor-not-allowed"
    end
    classes
  end

  def variant_classes
    case @variant
    when :primary then "btn--primary"
    when :secondary then "btn--secondary"
    when :positive then "btn--positive"
    when :negative, :danger then "btn--negative"
    when :plain then "btn--plain"
    when :borderless then "btn--borderless"
    else "btn--secondary"
    end
  end

  def render_icon
    return unless @icon
      render(IconComponent.new(
        name: @icon,
      ))
  end

  def render_spinner
    content_tag :svg, class: "animate-spin",
                xmlns: "http://www.w3.org/2000/svg", fill: "none", viewBox: "0 0 24 24" do
      content_tag(:circle, nil, class: "opacity-25", cx: "12", cy: "12", r: "10",
                  stroke: "currentColor", "stroke-width": "3") +
      content_tag(:path, nil, class: "opacity-75", fill: "currentColor",
                  d: "M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z")
    end
  end
end
