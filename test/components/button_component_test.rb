require "test_helper"

class ButtonComponentTest < ViewComponent::TestCase
  def test_renders_primary_button
    render_inline(ButtonComponent.new(variant: :primary, text: "Click me", href: "/test"))

    assert_selector "a[href='/test']", text: "Click me"
    assert_selector ".btn.btn--primary"
  end

  def test_renders_secondary_button
    render_inline(ButtonComponent.new(variant: :secondary, text: "Cancel", href: "/cancel"))

    assert_selector "a[href='/cancel']", text: "Cancel"
    assert_selector ".btn.btn--secondary"
  end

  def test_renders_button_with_icon
    render_inline(ButtonComponent.new(variant: :primary, text: "Submit", icon: "check"))

    assert_selector "button", text: "Submit"
    assert_selector "svg" # Lucide icon
  end

  def test_renders_disabled_button
    render_inline(ButtonComponent.new(variant: :primary, text: "Disabled", disabled: true))

    assert_selector "button[disabled]"
    assert_selector ".opacity-50"
  end

  def test_renders_loading_button
    render_inline(ButtonComponent.new(variant: :primary, text: "Loading", icon: "check", loading: true))

    assert_selector "button", text: "Loading"
    assert_selector "svg.animate-spin"
  end

  def test_renders_different_sizes
    render_inline(ButtonComponent.new(variant: :primary, text: "Small", size: :small))
    assert_selector ".btn--sm"

    render_inline(ButtonComponent.new(variant: :primary, text: "Large", size: :large))
    assert_selector ".btn--lg"

    render_inline(ButtonComponent.new(variant: :primary, text: "XL", size: :xl))
    assert_selector ".btn--xl"
  end

  def test_renders_full_width_button
    render_inline(ButtonComponent.new(variant: :primary, text: "Full Width", full_width: true))
    assert_selector ".btn--full"
  end

  def test_renders_animated_button
    render_inline(ButtonComponent.new(variant: :primary, text: "Animated", animated: true))
    assert_selector ".btn--animated"
  end

  def test_renders_non_animated_button
    render_inline(ButtonComponent.new(variant: :primary, text: "Not Animated", animated: false))
    assert_no_selector ".btn--animated"
  end

  def test_renders_icon_only_button
    render_inline(ButtonComponent.new(variant: :primary, icon: "settings", size: :icon))
    assert_selector ".btn--icon"
  end
end
