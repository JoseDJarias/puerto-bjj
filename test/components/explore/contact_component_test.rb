require "test_helper"

class Explore::ContactComponentTest < ViewComponent::TestCase
  def test_renders_contact_with_default_values
    render_inline(Explore::ContactComponent.new)

    assert_selector ".contact-container"
    assert_selector ".contact-header"
    assert_selector ".contact-title", text: "Contáctanos"
    assert_selector ".contact-subtitle", text: /Responderemos todos tus consultas/
    assert_selector ".contact-content"
    assert_selector ".contact-info"
    assert_selector ".contact-feedback-cta"
  end

  def test_renders_custom_title_and_subtitle
    render_inline(Explore::ContactComponent.new(
      title: "Título Personalizado",
      subtitle: "Subtítulo personalizado"
    ))

    assert_selector ".contact-title", text: "Título Personalizado"
    assert_selector ".contact-subtitle", text: "Subtítulo personalizado"
  end

  def test_renders_contact_cards_with_correct_content
    render_inline(Explore::ContactComponent.new)

    # Check for all 4 contact cards
    assert_selector ".contact-card", count: 4

    # Location card
    assert_selector ".contact-card-title", text: "Ubicación"
    assert_selector ".contact-card-text", text: "Gimnasio In Line, Puntarenas, Costa Rica"
    assert_selector "a", text: "Ver en Google Maps"

    # WhatsApp card
    assert_selector ".contact-card-title", text: "WhatsApp"
    assert_selector ".contact-card-text", text: "+506 7202-6863"
    assert_selector "a", text: "Chatear en WhatsApp"

    # Email card
    assert_selector ".contact-card-title", text: "Email"
    assert_selector ".contact-card-text", text: "infopuertobjj@gmail.com"
    assert_selector "a", text: "Enviar email"

    # Hours card
    assert_selector ".contact-card-title", text: "Horario de Atención"
    assert_selector ".contact-card-text", text: "Lunes a Viernes: 8:00 AM - 9:00 PM"
    assert_selector ".contact-card-text-secondary", text: "Sábados: 9:00 AM - 5:00 PM"
  end

  def test_renders_contact_cards_with_icons
    render_inline(Explore::ContactComponent.new)

    # Check that icons are rendered
    assert_selector ".contact-card-icon svg", count: 4
  end

  def test_renders_contact_cards_with_security_attributes
    render_inline(Explore::ContactComponent.new)

    # Check for security attributes on external links
    assert_selector "a[target='_blank']", count: 2 # Google Maps and WhatsApp
    assert_selector "a[rel='noopener noreferrer']", count: 2
  end

  def test_renders_feedback_cta_section
    render_inline(Explore::ContactComponent.new)

    assert_selector ".contact-feedback-cta"
    assert_selector ".feedback-cta-content"
    assert_selector ".feedback-cta-icon svg"
    assert_selector ".feedback-cta-title", text: "¿Tienes algo que decirnos?"
    assert_selector ".feedback-cta-description", text: /Tu opinión es muy importante/
    assert_selector "a", text: "Enviar Feedback"
  end

  def test_renders_custom_contact_info
    custom_info = [
      {
        icon: "star",
        title: "Información Personalizada",
        text: "Texto personalizado",
        cta_text: "Acción personalizada",
        cta_href: "https://example.com",
        cta_icon: "external-link",
        target: "_blank",
        rel: "noopener noreferrer"
      }
    ]

    render_inline(Explore::ContactComponent.new(contact_info: custom_info))

    assert_selector ".contact-card", count: 1
    assert_selector ".contact-card-title", text: "Información Personalizada"
    assert_selector ".contact-card-text", text: "Texto personalizado"
    assert_selector "a", text: "Acción personalizada"
    assert_selector "a[href='https://example.com']"
  end

  def test_renders_custom_feedback_cta
    custom_feedback = {
      icon: "heart",
      title: "Título personalizado",
      text: "Descripción personalizada",
      cta_text: "CTA personalizado",
      cta_href: "https://example.com",
      cta_icon: "arrow-right"
    }

    render_inline(Explore::ContactComponent.new(feedback_cta: custom_feedback))

    assert_selector ".feedback-cta-title", text: "Título personalizado"
    assert_selector ".feedback-cta-description", text: "Descripción personalizada"
    assert_selector "a", text: "CTA personalizado"
    assert_selector "a[href='https://example.com']"
  end

  def test_renders_with_semantic_html_structure
    render_inline(Explore::ContactComponent.new)

    # Main structure
    assert_selector "section[aria-labelledby='contact-title']"
    assert_selector "header.contact-header"
    assert_selector "h2[id='contact-title']"

    # Contact info structure
    assert_selector "div[role='region']"
    assert_selector "h3[id*='contact']"
    assert_selector "article[role='article']", count: 4
    assert_selector "h4[id*='contact-card']", count: 4

    # Feedback structure
    assert_selector "aside[role='complementary']"
    assert_selector "h3[id*='feedback']"
    assert_selector "h4.feedback-cta-title"
  end

  def test_renders_with_proper_aria_labels
    render_inline(Explore::ContactComponent.new)

    # Check for proper ARIA relationships
    assert_selector "[aria-labelledby]"
    assert_selector "h2[id='contact-title']"
    assert_selector "h3[id*='contact']"
    assert_selector "h3[id*='feedback']"
    assert_selector "h4[id*='contact-card']"
  end

  def test_renders_with_visually_hidden_elements
    render_inline(Explore::ContactComponent.new)

    # Check for visually hidden titles
    assert_selector ".visually-hidden", text: "Información de contacto"
    assert_selector ".visually-hidden", text: "Sección de feedback"
  end

  def test_renders_with_button_component
    render_inline(Explore::ContactComponent.new)

    # Check that ButtonComponent is used
    assert_selector ".btn--plain", count: 3 # Location, WhatsApp, Email
    assert_selector ".btn--primary", count: 1 # Feedback
  end

  def test_renders_with_accessibility_features
    render_inline(Explore::ContactComponent.new)

    # Check for proper heading structure
    assert_selector "h2"
    assert_selector "h3", count: 2
    assert_selector "h4", count: 5 # 4 contact cards + 1 feedback title

    # Check for semantic roles
    assert_selector "[role='region']"
    assert_selector "[role='complementary']"
    assert_selector "[role='article']"
  end

  def test_renders_with_correct_css_classes
    render_inline(Explore::ContactComponent.new)

    assert_selector ".contact-container"
    assert_selector ".contact-header"
    assert_selector ".contact-title"
    assert_selector ".contact-subtitle"
    assert_selector ".contact-content"
    assert_selector ".contact-info"
    assert_selector ".contact-cards-grid"
    assert_selector ".contact-card"
    assert_selector ".contact-card-header"
    assert_selector ".contact-card-icon"
    assert_selector ".contact-card-title"
    assert_selector ".contact-card-content"
    assert_selector ".contact-card-text"
    assert_selector ".contact-card-cta"
    assert_selector ".contact-feedback-cta"
    assert_selector ".feedback-cta-content"
    assert_selector ".feedback-cta-icon"
    assert_selector ".feedback-cta-text"
    assert_selector ".feedback-cta-title"
    assert_selector ".feedback-cta-description"
    assert_selector ".feedback-cta-button"
  end

  def test_renders_with_proper_structure
    render_inline(Explore::ContactComponent.new)

    # Check that the structure is correct
    assert_selector ".contact-container .contact-header"
    assert_selector ".contact-container .contact-content"
    assert_selector ".contact-content .contact-info"
    assert_selector ".contact-content .contact-feedback-cta"
    assert_selector ".contact-info .contact-cards-grid"
    assert_selector ".contact-cards-grid .contact-card"
    assert_selector ".contact-card .contact-card-header"
    assert_selector ".contact-card .contact-card-content"
    assert_selector ".contact-card-header .contact-card-icon"
    assert_selector ".contact-card-header .contact-card-title"
    assert_selector ".contact-card-content .contact-card-text"
    assert_selector ".contact-feedback-cta .feedback-cta-content"
    assert_selector ".feedback-cta-content .feedback-cta-icon"
    assert_selector ".feedback-cta-content .feedback-cta-text"
    assert_selector ".feedback-cta-content .feedback-cta-button"
  end

  def test_renders_with_unique_ids
    render_inline(Explore::ContactComponent.new)

    # Check that IDs are unique and properly formatted
    assert_selector "h3[id*='contact']"
    assert_selector "h3[id*='feedback']"
    assert_selector "h4[id*='contact-card']"
  end

  def test_handles_missing_paths_gracefully
    # Test that the component doesn't crash with invalid paths
    custom_feedback = {
      icon: "star",
      title: "Test Title",
      text: "Test description",
      cta_text: "Test CTA",
      cta_href: "nonexistent_path",
      cta_icon: "arrow-right"
    }

    render_inline(Explore::ContactComponent.new(feedback_cta: custom_feedback))

    # Should still render without crashing
    assert_selector ".contact-feedback-cta"
    assert_selector ".feedback-cta-title", text: "Test Title"
  end

  def test_path_resolver_works_correctly
    # Test that the PathResolver correctly converts feedback_path to /feedback
    render_inline(Explore::ContactComponent.new)

    # The feedback CTA should have the correct resolved path
    assert_selector "a[href='/feedback']", text: "Enviar Feedback"
  end

  def test_path_resolver_fallback_for_paths_ending_with_path
    # Test that paths ending with _path get "#" as fallback
    custom_feedback = {
      icon: "star",
      title: "Test Title",
      text: "Test description",
      cta_text: "Test CTA",
      cta_href: "fake_page_path", # This ends with _path but doesn't exist
      cta_icon: "arrow-right"
    }

    render_inline(Explore::ContactComponent.new(feedback_cta: custom_feedback))

    # Should use "#" as fallback for paths ending with _path
    assert_selector "a[href='#']", text: "Test CTA"
  end

  def test_path_resolver_preserves_external_urls
    # Test that external URLs are preserved
    custom_feedback = {
      icon: "star",
      title: "Test Title",
      text: "Test description",
      cta_text: "External Link",
      cta_href: "https://example.com",
      cta_icon: "external-link"
    }

    render_inline(Explore::ContactComponent.new(feedback_cta: custom_feedback))

    # Should preserve external URLs
    assert_selector "a[href='https://example.com']", text: "External Link"
  end

  def test_path_resolver_preserves_mailto_links
    # Test that mailto links are preserved
    custom_feedback = {
      icon: "mail",
      title: "Test Title",
      text: "Test description",
      cta_text: "Send Email",
      cta_href: "mailto:test@example.com",
      cta_icon: "mail"
    }

    render_inline(Explore::ContactComponent.new(feedback_cta: custom_feedback))

    # Should preserve mailto links
    assert_selector "a[href='mailto:test@example.com']", text: "Send Email"
  end

  def test_path_resolver_preserves_tel_links
    # Test that tel links are preserved
    custom_feedback = {
      icon: "phone",
      title: "Test Title",
      text: "Test description",
      cta_text: "Call Us",
      cta_href: "tel:+1234567890",
      cta_icon: "phone"
    }

    render_inline(Explore::ContactComponent.new(feedback_cta: custom_feedback))

    # Should preserve tel links
    assert_selector "a[href='tel:+1234567890']", text: "Call Us"
  end

  def test_path_resolver_fallback_for_arbitrary_strings
    # Test that arbitrary strings get "#" as fallback
    custom_feedback = {
      icon: "star",
      title: "Test Title",
      text: "Test description",
      cta_text: "Test CTA",
      cta_href: "random_string", # This doesn't end with _path
      cta_icon: "arrow-right"
    }

    render_inline(Explore::ContactComponent.new(feedback_cta: custom_feedback))

    # Should use "#" as fallback for arbitrary strings
    assert_selector "a[href='#']", text: "Test CTA"
  end

  def test_renders_conditional_elements_correctly
    render_inline(Explore::ContactComponent.new)

    # Check that text_secondary is rendered for hours card
    assert_selector ".contact-card-text-secondary", text: "Sábados: 9:00 AM - 5:00 PM"

    # Check that CTA buttons are rendered for cards that have them
    assert_selector ".contact-card-cta", count: 3 # Location, WhatsApp, Email (not Hours)
  end

  def test_renders_with_grid_layout
    render_inline(Explore::ContactComponent.new)

    # Check that contact cards are displayed in a grid
    assert_selector ".contact-cards-grid"
    assert_selector ".contact-card", count: 4
  end

  def test_renders_with_feedback_layout
    render_inline(Explore::ContactComponent.new)

    # Check that feedback section has proper layout
    assert_selector ".contact-feedback-cta"
    assert_selector ".feedback-cta-content"
    assert_selector ".feedback-cta-icon"
    assert_selector ".feedback-cta-text"
    assert_selector ".feedback-cta-button"
  end
end
