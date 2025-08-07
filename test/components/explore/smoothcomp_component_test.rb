require "test_helper"

class Explore::SmoothcompComponentTest < ViewComponent::TestCase
  def test_renders_smoothcomp_with_default_values
    render_inline(Explore::SmoothcompComponent.new)

    assert_selector ".smoothcomp-container"
    assert_selector ".smoothcomp-header"
    assert_selector ".smoothcomp-title", text: "Nuestro Perfil Competitivo"
    assert_selector ".smoothcomp-subtitle", text: /Resultados y estadísticas/
    assert_selector ".smoothcomp-card"
    assert_selector ".smoothcomp-stats"
  end

  def test_renders_custom_title_and_subtitle
    render_inline(Explore::SmoothcompComponent.new(
      title: "Título Personalizado",
      subtitle: "Subtítulo personalizado"
    ))

    assert_selector ".smoothcomp-title", text: "Título Personalizado"
    assert_selector ".smoothcomp-subtitle", text: "Subtítulo personalizado"
  end

  def test_renders_stats_with_correct_content
    render_inline(Explore::SmoothcompComponent.new)

    # Check for all 3 stats
    assert_selector ".stat-item", count: 3

    # Gold medals
    assert_selector ".stat-number", text: "13"
    assert_selector ".stat-label", text: "Oro"
    assert_selector "[class*='text-gold']"

    # Silver medals
    assert_selector ".stat-number", text: "14"
    assert_selector ".stat-label", text: "Plata"
    assert_selector "[class*='text-silver']"

    # Bronze medals
    assert_selector ".stat-number", text: "10"
    assert_selector ".stat-label", text: "Bronce"
    assert_selector "[class*='text-bronze']"

    # Check for descriptive ARIA labels
    assert_selector "[aria-label*='medallas']"
  end

  def test_renders_cta_button
    render_inline(Explore::SmoothcompComponent.new)

    assert_selector ".smoothcomp-cta"
    assert_selector "a", text: "Ver Perfil Completo en Smoothcomp"
    assert_selector "a[href*='smoothcomp.com']"
    assert_selector "a[target='_blank']"
    assert_selector "a[rel='noopener noreferrer']"
  end

  def test_renders_custom_cta
    render_inline(Explore::SmoothcompComponent.new(
      cta_text: "Ver más información",
      cta_href: "https://example.com"
    ))

    assert_selector "a", text: "Ver más información"
    assert_selector "a[href='https://example.com']"
  end

  def test_renders_custom_stats
    custom_stats = [
      {
        type: :gold,
        count: 5,
        label: "Oro",
        icon: "award",
        color_class: "gold"
      },
      {
        type: :silver,
        count: 3,
        label: "Plata",
        icon: "award",
        color_class: "silver"
      }
    ]

    render_inline(Explore::SmoothcompComponent.new(stats: custom_stats))

    assert_selector ".stat-item", count: 2
    assert_selector ".stat-number", text: "5"
    assert_selector ".stat-number", text: "3"
  end

  def test_renders_with_semantic_html_structure
    render_inline(Explore::SmoothcompComponent.new)

    # Main structure
    assert_selector "section[aria-labelledby='smoothcomp-title']"
    assert_selector "header.smoothcomp-header"
    assert_selector "h2[id='smoothcomp-title']"

    # Card structure
    assert_selector "article[role='article']"
    assert_selector "header.smoothcomp-card-header"
    assert_selector "h3[id='smoothcomp-card-title']"

    # Stats structure
    assert_selector "div[role='region']"
    assert_selector "h4[id*='smoothcomp']"
    assert_selector "div[role='listitem']", count: 3

    # Footer
    assert_selector "footer.smoothcomp-cta"
  end

  def test_renders_with_proper_aria_labels
    render_inline(Explore::SmoothcompComponent.new)

    # Check for proper ARIA relationships
    assert_selector "[aria-labelledby]"
    assert_selector "h2[id='smoothcomp-title']"
    assert_selector "h3[id='smoothcomp-card-title']"
    assert_selector "h4[id*='smoothcomp']"

    # Check for descriptive ARIA labels
    assert_selector "[aria-label*='medallas']"
  end

  def test_renders_with_icons
    render_inline(Explore::SmoothcompComponent.new)

    # Check that icons are rendered with IconComponent
    assert_selector "svg", count: 3
    assert_selector "[class*='text-gold']"
    assert_selector "[class*='text-silver']"
    assert_selector "[class*='text-bronze']"
    assert_selector "[class*='icon-effect--medal']", count: 3
  end

  def test_renders_with_visually_hidden_elements
    render_inline(Explore::SmoothcompComponent.new)

    # Check for visually hidden titles
    assert_selector ".visually-hidden", text: "Estadísticas de medallas"
    assert_selector ".visually-hidden", text: "Medallas obtenidas"
  end

  def test_renders_with_button_component
    render_inline(Explore::SmoothcompComponent.new)

    # Check that ButtonComponent is used with secondary variant
    assert_selector ".btn--primary"
  end

  def test_renders_with_accessibility_features
    render_inline(Explore::SmoothcompComponent.new)

    # Check for proper heading structure
    assert_selector "h2"
    assert_selector "h3"
    assert_selector "h4"

    # Check for semantic roles
    assert_selector "[role='article']"
    assert_selector "[role='region']"
    assert_selector "[role='listitem']"
  end

  def test_renders_with_security_attributes
    render_inline(Explore::SmoothcompComponent.new)

    # Check for security attributes on external link
    assert_selector "a[target='_blank']"
    assert_selector "a[rel='noopener noreferrer']"
  end

  def test_renders_with_correct_css_classes
    render_inline(Explore::SmoothcompComponent.new)

    assert_selector ".smoothcomp-container"
    assert_selector ".smoothcomp-header"
    assert_selector ".smoothcomp-title"
    assert_selector ".smoothcomp-subtitle"
    assert_selector ".smoothcomp-card"
    assert_selector ".smoothcomp-card-header"
    assert_selector ".smoothcomp-stats"
    assert_selector ".stats-grid"
    assert_selector ".stat-item"
    assert_selector ".stat-icon-wrapper"
    assert_selector ".stat-content"
    assert_selector ".stat-number"
    assert_selector ".stat-label"
    assert_selector ".smoothcomp-cta"
  end

  def test_renders_with_proper_structure
    render_inline(Explore::SmoothcompComponent.new)

    # Check that the structure is correct
    assert_selector ".smoothcomp-container .smoothcomp-header"
    assert_selector ".smoothcomp-container .smoothcomp-card"
    assert_selector ".smoothcomp-card .smoothcomp-card-header"
    assert_selector ".smoothcomp-card .smoothcomp-stats"
    assert_selector ".smoothcomp-card .smoothcomp-cta"
    assert_selector ".smoothcomp-stats .stats-grid"
    assert_selector ".stats-grid .stat-item"
    assert_selector ".stat-item .stat-icon-wrapper"
    assert_selector ".stat-item .stat-content"
    assert_selector ".stat-content .stat-number"
    assert_selector ".stat-content .stat-label"
  end

  def test_renders_with_unique_ids
    render_inline(Explore::SmoothcompComponent.new)

    # Check that IDs are unique and properly formatted
    assert_selector "h4[id*='smoothcomp']"
  end

  def test_renders_with_grid_layout
    render_inline(Explore::SmoothcompComponent.new)

    # Check that stats are displayed in a grid
    assert_selector ".stats-grid"
    assert_selector ".stat-item", count: 3
  end
end
