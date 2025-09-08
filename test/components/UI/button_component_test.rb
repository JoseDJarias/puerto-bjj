require "test_helper"

class ButtonComponentTest < ViewComponent::TestCase
  def test_renders_primary_button
    render_inline(UI::ButtonComponent.new(variant: :primary, text: "Click me", href: "/test"))

    assert_selector "a[href='/test']", text: "Click me"
    assert_selector ".btn.btn--primary"
  end

  def test_renders_secondary_button
    render_inline(UI::ButtonComponent.new(variant: :secondary, text: "Cancel", href: "/cancel"))

    assert_selector "a[href='/cancel']", text: "Cancel"
    assert_selector ".btn.btn--secondary"
  end

  def test_renders_button_with_icon
    render_inline(UI::ButtonComponent.new(variant: :primary, text: "Submit", icon: "check"))

    assert_selector "button", text: "Submit"
    assert_selector "svg" # Lucide icon
  end

  def test_renders_disabled_button
    render_inline(UI::ButtonComponent.new(variant: :primary, text: "Disabled", disabled: true))

    assert_selector "button[disabled]"
    assert_selector ".opacity-50"
  end
end
