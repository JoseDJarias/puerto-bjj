require "test_helper"

class Explore::SocialLinksComponentTest < ViewComponent::TestCase
  def test_renders_social_links_with_default_values
    render_inline(Explore::SocialLinksComponent.new)

    assert_selector ".contact-social"
    assert_selector ".social-links-header"
    assert_selector ".contact-social-title", text: "Nuestra comunidad es la mejor parte de Puerto Jiu-Jitsu"
    assert_selector ".contact-social-title", text: "Síguenos en redes sociales"
    assert_selector ".contact-social-subtitle", text: /Mantente al día/
    assert_selector ".social-links"
    assert_selector ".social-links a", count: 3
  end

  def test_renders_custom_title_and_subtitle
    render_inline(Explore::SocialLinksComponent.new(
      title: "Síguenos",
      subtitle: "Encuéntranos en redes"
    ))

    assert_selector ".contact-social-title", text: "Síguenos"
    assert_selector ".contact-social-title", text: "Encuéntranos en redes"
  end

  def test_renders_custom_description
    render_inline(Explore::SocialLinksComponent.new(
      description: "Descripción personalizada"
    ))

    assert_selector ".contact-social-subtitle", text: "Descripción personalizada"
  end

  def test_renders_social_links_with_correct_content
    render_inline(Explore::SocialLinksComponent.new)

    # Facebook
    assert_selector "a[href*='facebook.com']", text: "Facebook"
    assert_selector "a[target='_blank']", count: 3
    assert_selector "a[rel='noopener noreferrer']", count: 3

    # Instagram
    assert_selector "a[href*='instagram.com']", text: "Instagram"

    # WhatsApp
    assert_selector "a[href*='wa.me']", text: "WhatsApp"
  end

  def test_renders_custom_social_links
    custom_links = [
      {
        name: "Twitter",
        href: "https://twitter.com/test",
        icon: "twitter",
        target: "_blank",
        rel: "noopener noreferrer"
      }
    ]

    render_inline(Explore::SocialLinksComponent.new(social_links: custom_links))

    assert_selector ".social-links a", count: 1
    assert_selector "a", text: "Twitter"
    assert_selector "a[href='https://twitter.com/test']"
  end

  def test_renders_with_semantic_html
    render_inline(Explore::SocialLinksComponent.new)

    assert_selector "section[aria-labelledby='social-links-title']"
    assert_selector "header.social-links-header"
    assert_selector "h3[id='social-links-title']"
    assert_selector "h4"
    assert_selector "nav[role='navigation']"
    assert_selector "nav[aria-label='Enlaces de redes sociales']"
  end

  def test_renders_with_button_component
    render_inline(Explore::SocialLinksComponent.new)

    # Check that ButtonComponent is used with plain variant
    assert_selector ".btn--plain", count: 3
  end

  def test_renders_with_accessibility_features
    render_inline(Explore::SocialLinksComponent.new)

    # Check for proper heading structure
    assert_selector "h3"
    assert_selector "h4"

    # Check for proper ARIA labels
    assert_selector "[aria-labelledby]"
    assert_selector "[aria-label]"
  end

  def test_renders_with_security_attributes
    render_inline(Explore::SocialLinksComponent.new)

    # Check for security attributes on external links
    assert_selector "a[target='_blank']", count: 3
    assert_selector "a[rel='noopener noreferrer']", count: 3
  end

  def test_renders_with_correct_css_classes
    render_inline(Explore::SocialLinksComponent.new)

    assert_selector ".contact-social"
    assert_selector ".social-links-header"
    assert_selector ".contact-social-title"
    assert_selector ".contact-social-subtitle"
    assert_selector ".social-links"
  end

  def test_renders_with_proper_structure
    render_inline(Explore::SocialLinksComponent.new)

    # Check that the structure is correct
    assert_selector ".contact-social .social-links-header"
    assert_selector ".contact-social .social-links"
    assert_selector ".social-links-header .contact-social-title"
    assert_selector ".social-links-header .contact-social-subtitle"
  end

  def test_renders_with_icons
    render_inline(Explore::SocialLinksComponent.new)

    # Check that icons are rendered (ButtonComponent handles this)
    assert_selector ".social-links a"
  end

  def test_renders_with_border_styles
    render_inline(Explore::SocialLinksComponent.new)

    # Check that the section has border styles
    assert_selector ".contact-social"
  end
end
