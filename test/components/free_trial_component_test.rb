require "test_helper"

class FreeTrialComponentTest < ViewComponent::TestCase
  def test_renders_free_trial_with_default_values
    render_inline(UI::FreeTrialComponent.new)

    assert_selector ".free-trial-cta"
    assert_selector ".free-trial-header"
    assert_selector ".free-trial-title", text: "¿Listos para empezar tu aventura?"
    assert_selector ".free-trial-subtitle", text: /La primera clase es totalmente gratis/
    assert_selector ".free-trial-action"
    assert_selector ".free-trial-button"
    assert_selector "a", text: "¡Quiero mi clase de prueba!"
  end

  def test_renders_custom_content
    render_inline(UI::FreeTrialComponent.new(
      title: "¡Únete a nosotros!",
      subtitle: "Descubre el poder del Jiu-Jitsu",
      cta_text: "Comenzar ahora"
    ))

    assert_selector ".free-trial-title", text: "¡Únete a nosotros!"
    assert_selector ".free-trial-subtitle", text: "Descubre el poder del Jiu-Jitsu"
    assert_selector "a", text: "Comenzar ahora"
  end

  def test_renders_with_custom_whatsapp_message
    render_inline(UI::FreeTrialComponent.new(
      whatsapp_message: "Hola, quiero información"
    ))

    # Should generate WhatsApp URL with text parameter
    assert_selector "a[href*='wa.me/50672026863']"
    assert_selector "a[href*='text=']"
  end

  def test_renders_with_secondary_variant
    render_inline(UI::FreeTrialComponent.new(variant: :secondary))

    assert_selector ".free-trial-cta--secondary"
  end


  def test_renders_with_semantic_html_structure
    render_inline(UI::FreeTrialComponent.new)

    # Check for proper semantic structure
    assert_selector "section[aria-labelledby]"
    assert_selector "header.free-trial-header"
    assert_selector "h2.free-trial-title"
    assert_selector "div.free-trial-action"
  end

  def test_renders_with_proper_aria_labels
    render_inline(UI::FreeTrialComponent.new)

    # Check for proper ARIA relationships
    assert_selector "[aria-labelledby]"
    assert_selector "h2[id*='free-trial']"
    assert_selector "a[aria-label*='WhatsApp']"
  end

  def test_renders_with_security_attributes
    render_inline(UI::FreeTrialComponent.new)

    # Check for security attributes on external link
    assert_selector "a[target='_blank']"
    assert_selector "a[rel='noopener noreferrer']"
  end

  def test_renders_with_icon_component
    render_inline(UI::FreeTrialComponent.new)

    # Check that IconComponent is used
    assert_selector "svg"
  end

  def test_renders_with_correct_css_classes
    render_inline(UI::FreeTrialComponent.new)

    assert_selector ".free-trial-cta"
    assert_selector ".free-trial-header"
    assert_selector ".free-trial-title"
    assert_selector ".free-trial-subtitle"
    assert_selector ".free-trial-action"
    assert_selector ".free-trial-button"
    assert_selector ".free-trial-button-text"
  end

  def test_renders_with_proper_structure
    render_inline(UI::FreeTrialComponent.new)

    # Check that the structure is correct
    assert_selector ".free-trial-cta .free-trial-header"
    assert_selector ".free-trial-cta .free-trial-action"
    assert_selector ".free-trial-header .free-trial-title"
    assert_selector ".free-trial-header .free-trial-subtitle"
    assert_selector ".free-trial-action .free-trial-button"
    assert_selector ".free-trial-button .free-trial-button-text"
  end

  def test_renders_with_unique_ids
    render_inline(UI::FreeTrialComponent.new)

    # Check that IDs are unique and properly formatted
    assert_selector "h2[id*='free-trial']"
  end

  def test_renders_with_whatsapp_url
    render_inline(UI::FreeTrialComponent.new)

    # Check that WhatsApp URL is properly formatted
    assert_selector "a[href*='wa.me/50672026863']"
    assert_selector "a[href*='text=']"
  end

  def test_renders_with_button_styling
    render_inline(UI::FreeTrialComponent.new)

    # Check that button has proper styling classes
    assert_selector ".free-trial-button.btn"
    assert_selector ".free-trial-button.btn--primary"
  end

  def test_renders_with_accessibility_features
    render_inline(UI::FreeTrialComponent.new)

    # Check for proper heading structure
    assert_selector "h2"

    # Check for semantic roles
    assert_selector "section"
    assert_selector "header"
  end

  def test_renders_with_flexible_configuration
    render_inline(UI::FreeTrialComponent.new(
      title: "Test Title",
      subtitle: "Test Subtitle",
      cta_text: "Test CTA",
      whatsapp_message: "Test Message",
      variant: :secondary
    ))

    assert_selector ".free-trial-title", text: "Test Title"
    assert_selector ".free-trial-subtitle", text: "Test Subtitle"
    assert_selector "a", text: "Test CTA"
    assert_selector ".free-trial-cta--secondary"
  end
end
