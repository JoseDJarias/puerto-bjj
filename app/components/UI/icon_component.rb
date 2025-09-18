# IconComponent - A reusable component for rendering Lucide icons
#
# This component provides a consistent way to render icons across the application
# with standardized sizes, colors, and accessibility features.
#
# @example Basic usage
#   <%= render(UI::IconComponent.new(name: "heart")) %>
#
# @example With custom size and color
#   <%= render(UI::IconComponent.new(
#     name: "star",
#     size: :large,
#     color: :primary
#   )) %>
#
# @example With accessibility
#   <%= render(UI::IconComponent.new(
#     name: "check",
#     aria_label: "Success indicator"
#   )) %>
#
# @example With custom classes
#   <%= render(UI::IconComponent.new(
#     name: "arrow-right",
#     class_name: "mr-2 inline-block"
#   )) %>
#
# @example With medal colors and effects
#   <%= render(UI::IconComponent.new(
#     name: "award",
#     color: :gold,
#     effects: :medal
#   )) %>
#
# Available sizes: :xs, :small, :medium, :large, :xl, :xxl, :custom
# Available colors: :primary, :secondary, :success, :warning, :error, :muted, :current, :gold, :silver, :bronze
# Available effects: :medal (for award icons with hover effects)
# Or pass any CSS class string for custom colors
class UI::IconComponent < ViewComponent::Base
  attr_reader :name, :size, :color, :class_name, :aria_label, :effects

  def initialize(name:, size: :medium, color: nil, class_name: nil, aria_label: nil, effects: nil)
    @name = name
    @size = size
    @color = color
    @class_name = class_name
    @aria_label = aria_label
    @effects = effects
  end

   erb_template <<~ERB
    <%= helpers.lucide_icon @name, class: icon_classes, **aria_attributes %>#{' '}
   ERB

  private

  def icon_classes
    [
      size_classes,
      color_classes,
      effects_classes,
      @class_name
    ].compact.join(" ")
  end

  def size_classes
    case @size
    when :xs then "w-4 h-4"
    when :small then "w-5 h-5"
    when :medium then "w-6 h-6"
    when :large then "w-8 h-8"
    when :xl then "w-10 h-10"
    when :xxl then "w-12 h-12"
    when :custom then custom_size_class
    else "w-6 h-6"
    end
  end

  def custom_size_class
    # If class_name contains size classes, don't add default
    if @class_name&.match(/w-\d+ h-\d+/)
      ""
    elsif @class_name&.match(/w-\[.*\] h-\[.*\]/)
      ""
    else
      "w-6 h-6"
    end
  end

  def color_classes
    return @color if @color.is_a?(String)

    case @color
    when :primary then "text-primary"
    when :secondary then "text-secondary"
    when :success then "text-success"
    when :warning then "text-warning"
    when :error then "text-error"
    when :muted then "text-muted"
    when :current then "text-current"
    when :gold then "text-gold"
    when :silver then "text-silver"
    when :bronze then "text-bronze"
    else nil
    end
  end

  def effects_classes
    return nil unless @effects

    case @effects
    when :medal then "icon-effect--medal"
    else nil
    end
  end

  def aria_attributes
    return {} unless @aria_label

    { "aria-label" => @aria_label, role: "img" }
  end
end
