require "test_helper"

class Explore::ProgramsPromoComponentTest < ViewComponent::TestCase
  def test_renders_programs_promo_with_default_values
    render_inline(Explore::ProgramsPromoComponent.new)

    assert_selector ".programs-promo-section"
    assert_selector ".programs-promo-header"
    assert_selector ".promo-section-title", text: "Info sobre nuestros programas"
    assert_selector ".programs-promo-grid"
    assert_selector ".program-card", count: 2
  end

  def test_renders_custom_title
    render_inline(Explore::ProgramsPromoComponent.new(title: "Nuestros Programas"))

    assert_selector ".promo-section-title", text: "Nuestros Programas"
  end

  def test_renders_program_cards_with_correct_content
    render_inline(Explore::ProgramsPromoComponent.new)

    # Kids Program
    assert_selector ".program-card", count: 2
    assert_selector ".program-card-title", text: "Programa Kids"
    assert_selector ".program-card-text", text: /ambiente seguro y divertido/
    assert_selector ".program-card-icon svg"

    # Adults Program
    assert_selector ".program-card-title", text: "Programas para Adultos"
    assert_selector ".program-card-text", text: /Jiu-Jitsu.*Boxeo.*MMA/
  end

  def test_renders_custom_programs
    custom_programs = [
      {
        icon: "heart",
        title: "Programa Especial",
        description: "Descripción personalizada del programa.",
        cta_text: "Más información",
        cta_href: "special_program_path"
      }
    ]

    render_inline(Explore::ProgramsPromoComponent.new(programs: custom_programs))

    assert_selector ".program-card", count: 1
    assert_selector ".program-card-title", text: "Programa Especial"
    assert_selector ".program-card-text", text: "Descripción personalizada del programa."
    assert_selector "a", text: "Más información"
  end

  def test_renders_buttons_with_correct_links
    render_inline(Explore::ProgramsPromoComponent.new)

    # Check that buttons are rendered
    assert_selector "a", text: "¡Quiero conocer más!"
    assert_selector "a", text: "Explorar Programas"
  end

  def test_renders_with_semantic_html
    render_inline(Explore::ProgramsPromoComponent.new)

    assert_selector "section[aria-labelledby='programs-promo-title']"
    assert_selector "h2[id='programs-promo-title']"
    assert_selector "article[aria-labelledby='program-title-0']"
    assert_selector "article[aria-labelledby='program-title-1']"
    assert_selector "h3[id='program-title-0']"
    assert_selector "h3[id='program-title-1']"
  end

  def test_renders_icons_with_lucide
    render_inline(Explore::ProgramsPromoComponent.new)

    # Check that icons are rendered with correct classes
    assert_selector ".program-card-icon svg"
  end

  def test_renders_with_accessibility_features
    render_inline(Explore::ProgramsPromoComponent.new)

    # Check for proper heading structure
    assert_selector "h2"
    assert_selector "h3", count: 2

    # Check for proper ARIA labels
    assert_selector "[aria-labelledby]"
  end

  def test_renders_with_button_component
    render_inline(Explore::ProgramsPromoComponent.new)

    # Check that ButtonComponent is used
    assert_selector ".btn--primary", count: 2
  end

  def test_handles_missing_paths_gracefully
    # Test that the component doesn't crash with invalid paths
    custom_programs = [
      {
        icon: "star",
        title: "Test Program",
        description: "Test description",
        cta_text: "Test CTA",
        cta_href: "nonexistent_path"
      }
    ]

    render_inline(Explore::ProgramsPromoComponent.new(programs: custom_programs))

    # Should still render without crashing
    assert_selector ".program-card"
    assert_selector ".program-card-title", text: "Test Program"
  end

  def test_path_resolver_works_correctly
    # Test that the PathResolver correctly converts path strings to actual URLs
    render_inline(Explore::ProgramsPromoComponent.new)

    # The Kids Program CTA should have the correct resolved path
    assert_selector "a[href='/programas/kids']", text: "¡Quiero conocer más!"

    # The Adults Program CTA should have the correct resolved path
    assert_selector "a[href='/programas']", text: "Explorar Programas"
  end

  def test_path_resolver_fallback_for_paths_ending_with_path
    # Test that paths ending with _path get "#" as fallback
    custom_programs = [
      {
        icon: "star",
        title: "Test Program",
        description: "Test description",
        cta_text: "Test CTA",
        cta_href: "fake_page_path" # This ends with _path but doesn't exist
      }
    ]

    render_inline(Explore::ProgramsPromoComponent.new(programs: custom_programs))

    # Should use "#" as fallback for paths ending with _path
    assert_selector "a[href='#']", text: "Test CTA"
  end

  def test_path_resolver_preserves_external_urls
    # Test that external URLs are preserved
    custom_programs = [
      {
        icon: "star",
        title: "Test Program",
        description: "Test description",
        cta_text: "External Link",
        cta_href: "https://example.com"
      }
    ]

    render_inline(Explore::ProgramsPromoComponent.new(programs: custom_programs))

    # Should preserve external URLs
    assert_selector "a[href='https://example.com']", text: "External Link"
  end

  def test_path_resolver_preserves_mailto_links
    # Test that mailto links are preserved
    custom_programs = [
      {
        icon: "mail",
        title: "Test Program",
        description: "Test description",
        cta_text: "Send Email",
        cta_href: "mailto:test@example.com"
      }
    ]

    render_inline(Explore::ProgramsPromoComponent.new(programs: custom_programs))

    # Should preserve mailto links
    assert_selector "a[href='mailto:test@example.com']", text: "Send Email"
  end

  def test_path_resolver_preserves_tel_links
    # Test that tel links are preserved
    custom_programs = [
      {
        icon: "phone",
        title: "Test Program",
        description: "Test description",
        cta_text: "Call Us",
        cta_href: "tel:+1234567890"
      }
    ]

    render_inline(Explore::ProgramsPromoComponent.new(programs: custom_programs))

    # Should preserve tel links
    assert_selector "a[href='tel:+1234567890']", text: "Call Us"
  end

  def test_path_resolver_fallback_for_arbitrary_strings
    # Test that arbitrary strings get "#" as fallback
    custom_programs = [
      {
        icon: "star",
        title: "Test Program",
        description: "Test description",
        cta_text: "Test CTA",
        cta_href: "random_string" # This doesn't end with _path
      }
    ]

    render_inline(Explore::ProgramsPromoComponent.new(programs: custom_programs))

    # Should use "#" as fallback for arbitrary strings
    assert_selector "a[href='#']", text: "Test CTA"
  end

  def test_renders_with_correct_css_classes
    render_inline(Explore::ProgramsPromoComponent.new)

    assert_selector ".programs-promo-section"
    assert_selector ".programs-promo-header"
    assert_selector ".promo-section-title"
    assert_selector ".programs-promo-grid"
    assert_selector ".program-card"
    assert_selector ".program-card-icon"
    assert_selector ".program-card-title"
    assert_selector ".program-card-text"
  end

  def test_renders_with_proper_structure
    render_inline(Explore::ProgramsPromoComponent.new)

    # Check that the structure is correct
    assert_selector ".programs-promo-section .programs-promo-header"
    assert_selector ".programs-promo-section .programs-promo-grid"
    assert_selector ".programs-promo-grid .program-card"
    assert_selector ".program-card .program-card-icon"
    assert_selector ".program-card .program-card-title"
    assert_selector ".program-card .program-card-text"
  end
end
