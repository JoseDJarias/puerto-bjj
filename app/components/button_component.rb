class ButtonComponent < ViewComponent::Base
  def initialize(
    variant: :primary,
    size: :medium,
    text: nil,
    href: nil,
    icon: nil,
    loading: false,
    disabled: false,
    animated: true,
    full_width: false,
    custom_classes: nil,
    **options
  )
    @variant = variant
    @size = size
    @text = text
    @href = href
    @icon = icon
    @loading = loading
    @disabled = disabled
    @animated = animated
    @full_width = full_width
    @custom_classes = custom_classes
    @options = options
  end

  private

  def button_classes
    classes = [
      base_classes,
      variant_classes,
      size_classes,
      width_classes,
      animation_classes,
      @custom_classes
    ].compact.join(" ")

    if @disabled
      classes += " opacity-50 cursor-not-allowed"
    end
    classes
  end

  def base_classes
    "btn inline-flex items-center justify-center transition-all duration-200 focus:outline-none"
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

  def size_classes
    case @size
    when :small then "btn--sm"
    when :medium then "" # Default size
    when :large then "btn--lg"
    when :xl then "btn--xl"
    when :icon then "btn--icon"
    else "" # Default size
    end
  end

  def width_classes
    @full_width ? "btn--full" : ""
  end

  def animation_classes
    return "" unless @animated && !@disabled
    "btn--animated"
  end

  def icon_classes
    case @size
    when :small then "w-4 h-4"
    when :medium, :large then "w-5 h-5"
    when :xl then "w-6 h-6"
    when :icon then "w-5 h-5"
    else "w-5 h-5"
    end
  end

  def icon_margin
    case @size
    when :small then "mr-1.5"
    when :medium, :large then "mr-2"
    when :xl then "mr-3"
    when :icon then ""
    else "mr-2"
    end
  end

  def render_icon
    return unless @icon
    if @loading
      render_spinner
    else
      helpers.lucide_icon(@icon, class: "#{icon_classes} #{icon_margin}")
    end
  end

  def render_spinner
    content_tag :svg, class: "animate-spin #{icon_classes} #{icon_margin}",
                xmlns: "http://www.w3.org/2000/svg", fill: "none", viewBox: "0 0 24 24" do
      content_tag(:circle, nil, class: "opacity-25", cx: "12", cy: "12", r: "10",
                  stroke: "currentColor", "stroke-width": "3") +
      content_tag(:path, nil, class: "opacity-75", fill: "currentColor",
                  d: "M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z")
    end
  end
end
