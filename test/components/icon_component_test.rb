require "test_helper"

class IconComponentTest < ViewComponent::TestCase
  def test_renders_icon_with_default_values
    render_inline(IconComponent.new(name: "heart"))

    assert_selector "svg"
    assert_selector "[class*='w-6 h-6']" # Default medium size
  end

  def test_renders_icon_with_custom_name
    render_inline(IconComponent.new(name: "star"))

    assert_selector "svg"
  end

  def test_renders_icon_with_xs_size
    render_inline(IconComponent.new(name: "heart", size: :xs))

    assert_selector "[class*='w-4 h-4']"
  end

  def test_renders_icon_with_small_size
    render_inline(IconComponent.new(name: "heart", size: :small))

    assert_selector "[class*='w-5 h-5']"
  end

  def test_renders_icon_with_medium_size
    render_inline(IconComponent.new(name: "heart", size: :medium))

    assert_selector "[class*='w-6 h-6']"
  end

  def test_renders_icon_with_large_size
    render_inline(IconComponent.new(name: "heart", size: :large))

    assert_selector "[class*='w-8 h-8']"
  end

  def test_renders_icon_with_xl_size
    render_inline(IconComponent.new(name: "heart", size: :xl))

    assert_selector "[class*='w-10 h-10']"
  end

  def test_renders_icon_with_xxl_size
    render_inline(IconComponent.new(name: "heart", size: :xxl))

    assert_selector "[class*='w-12 h-12']"
  end

  def test_renders_icon_with_primary_color
    render_inline(IconComponent.new(name: "heart", color: :primary))

    assert_selector "[class*='text-primary']"
  end

  def test_renders_icon_with_secondary_color
    render_inline(IconComponent.new(name: "heart", color: :secondary))

    assert_selector "[class*='text-secondary']"
  end

  def test_renders_icon_with_success_color
    render_inline(IconComponent.new(name: "heart", color: :success))

    assert_selector "[class*='text-success']"
  end

  def test_renders_icon_with_warning_color
    render_inline(IconComponent.new(name: "heart", color: :warning))

    assert_selector "[class*='text-warning']"
  end

  def test_renders_icon_with_error_color
    render_inline(IconComponent.new(name: "heart", color: :error))

    assert_selector "[class*='text-error']"
  end

  def test_renders_icon_with_muted_color
    render_inline(IconComponent.new(name: "heart", color: :muted))

    assert_selector "[class*='text-muted']"
  end

  def test_renders_icon_with_current_color
    render_inline(IconComponent.new(name: "heart", color: :current))

    assert_selector "[class*='text-current']"
  end

  def test_renders_icon_with_custom_color_string
    render_inline(IconComponent.new(name: "heart", color: "text-blue-500"))

    assert_selector "[class*='text-blue-500']"
  end

  def test_renders_icon_with_custom_class_name
    render_inline(IconComponent.new(name: "heart", class_name: "custom-class"))

    assert_selector "[class*='custom-class']"
  end

  def test_renders_icon_with_aria_label
    render_inline(IconComponent.new(name: "heart", aria_label: "Like button"))

    assert_selector "[aria-label='Like button']"
    assert_selector "[role='img']"
  end

  def test_renders_icon_without_aria_label
    render_inline(IconComponent.new(name: "heart"))

    assert_no_selector "[aria-label]"
    assert_no_selector "[role='img']"
  end

  def test_renders_icon_with_custom_size_and_color
    render_inline(IconComponent.new(
      name: "star",
      size: :large,
      color: :primary,
      class_name: "mr-2"
    ))

    assert_selector "[class*='w-8 h-8']"
    assert_selector "[class*='text-primary']"
    assert_selector "[class*='mr-2']"
  end

  def test_renders_icon_with_custom_size_class
    render_inline(IconComponent.new(
      name: "heart",
      size: :custom,
      class_name: "w-16 h-16"
    ))

    assert_selector "[class*='w-16 h-16']"
  end

  def test_renders_icon_with_invalid_size_falls_back_to_medium
    render_inline(IconComponent.new(name: "heart", size: :invalid))

    assert_selector "[class*='w-6 h-6']" # Falls back to medium
  end

  def test_renders_icon_with_invalid_color_has_no_color_class
    render_inline(IconComponent.new(name: "heart", color: :invalid))

    assert_no_selector "[class*='text-invalid']"
  end

  def test_renders_icon_with_all_attributes
    render_inline(IconComponent.new(
      name: "check",
      size: :xl,
      color: :success,
      class_name: "inline-block mr-2",
      aria_label: "Success indicator"
    ))

    assert_selector "[class*='w-10 h-10']"
    assert_selector "[class*='text-success']"
    assert_selector "[class*='inline-block']"
    assert_selector "[class*='mr-2']"
    assert_selector "[aria-label='Success indicator']"
    assert_selector "[role='img']"
  end

  def test_renders_icon_with_lucide_icon_helper
    render_inline(IconComponent.new(name: "heart"))

    # Should use the lucide_icon helper
    assert_selector "svg"
  end
end
