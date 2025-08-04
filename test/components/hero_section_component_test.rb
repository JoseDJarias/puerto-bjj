require "test_helper"

class Explore::HeroSectionComponentTest < ViewComponent::TestCase
  def test_renders_hero_section_with_default_values
    render_inline(Explore::HeroSectionComponent.new)

    assert_selector "section.hero-section"
    assert_selector "h1#hero-title", text: "Puerto Jiu-Jitsu"
    assert_selector "h2.hero-subtitle", text: "Academia de Artes Marciales"
    assert_selector "p.hero-description", text: "Jiu-Jitsu, Boxeo, MMA y más."
    assert_selector "address.hero-location", text: "El Roble, Puntarenas, Costa Rica"
  end

  def test_renders_location_links
    render_inline(Explore::HeroSectionComponent.new)

    assert_selector "nav.hero-location-links", count: 1
    assert_selector "nav.hero-location-links .btn", count: 2
    assert_selector "a[href*='google.com/maps']"
    assert_selector "a[href*='waze.com']"
  end

  def test_renders_cta_button_when_href_provided
    render_inline(Explore::HeroSectionComponent.new(
      cta_text: "¡Conócenos mejor!",
      cta_href: "/about"
    ))

    assert_selector "a[href='/about']", text: "¡Conócenos mejor!"
    assert_selector ".hero-cta"
  end

  def test_does_not_render_cta_button_when_href_not_provided
    render_inline(Explore::HeroSectionComponent.new(cta_href: nil))

    assert_no_selector "a[href='/about']"
    assert_no_selector ".hero-cta"
  end

  def test_renders_custom_title_and_subtitle
    render_inline(Explore::HeroSectionComponent.new(
      title: "Custom Title",
      subtitle: "Custom Subtitle"
    ))

    assert_selector "h1#hero-title", text: "Custom Title"
    assert_selector "h2.hero-subtitle", text: "Custom Subtitle"
  end

  def test_renders_custom_description_and_location
    render_inline(Explore::HeroSectionComponent.new(
      description: "Custom Description",
      location: "Custom Location"
    ))

    assert_selector "p.hero-description", text: "Custom Description"
    assert_selector "address.hero-location", text: "Custom Location"
  end

  def test_renders_default_taglines
    render_inline(Explore::HeroSectionComponent.new)

    assert_selector "p.hero-description", text: "¡Tu batalla diaria, para forjar un gran destino!"
    assert_selector "p.hero-description", text: "Disciplina, carácter y confianza en un ambiente de respeto y valores."
  end

  def test_renders_custom_taglines
    custom_taglines = [ "Custom tagline 1", "Custom tagline 2" ]
    render_inline(Explore::HeroSectionComponent.new(taglines: custom_taglines))

    assert_selector "p.hero-description", text: "Custom tagline 1"
    assert_selector "p.hero-description", text: "Custom tagline 2"
  end

  def test_has_proper_aria_labels
    render_inline(Explore::HeroSectionComponent.new)

    assert_selector "section[aria-labelledby='hero-title']"
    assert_selector "h1[id='hero-title']"
    assert_selector "nav[role='group']"
    assert_selector "nav[aria-label='Enlaces de ubicación']"
  end

  def test_location_links_have_proper_attributes
    render_inline(Explore::HeroSectionComponent.new)

    # Google Maps link
    assert_selector "a[href*='google.com/maps'][target='_blank'][rel='noopener noreferrer'][aria-label*='Google Maps']"

    # Waze link
    assert_selector "a[href*='waze.com'][target='_blank'][rel='noopener noreferrer'][aria-label*='Waze']"
  end

  def test_uses_button_component_for_location_links
    render_inline(Explore::HeroSectionComponent.new)

    # Should use ButtonComponent with plain variant and icon size
    assert_selector ".btn.btn--plain"
  end

  def test_uses_button_component_for_cta
    render_inline(Explore::HeroSectionComponent.new(
      cta_text: "Test CTA",
      cta_href: "/test"
    ))

    # Should use ButtonComponent with primary variant and large size
    assert_selector ".btn.btn--primary"
  end

  def test_includes_structured_data
    result = render_inline(Explore::HeroSectionComponent.new)

    # Check that structured data is included in the rendered HTML
    assert_includes result.text, "SportsActivityLocation"
    assert_includes result.to_html, "application/ld+json"
  end

  def test_uses_semantic_html_elements
    render_inline(Explore::HeroSectionComponent.new)

    assert_selector "section"
    assert_selector "header"
    assert_selector "nav"
    assert_selector "address"
  end

  def test_cache_key_generation
    component = Explore::HeroSectionComponent.new(
      title: "Test Title",
      subtitle: "Test Subtitle",
      cta_href: "/test"
    )

    cache_key = component.send(:cache_key)
    assert_includes cache_key, "hero_section"
    assert_includes cache_key, "v1"
    assert_includes cache_key, "test-title"  # parameterize convierte "Test Title" a "test-title"
    assert_includes cache_key, "test-subtitle"  # parameterize convierte "Test Subtitle" a "test-subtitle"
  end

  def test_cache_exists_method
    component = Explore::HeroSectionComponent.new
    assert_respond_to component, :cache_exists?
  end
end
