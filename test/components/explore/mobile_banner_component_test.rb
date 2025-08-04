require "test_helper"

class Explore::MobileBannerComponentTest < ViewComponent::TestCase
  def test_renders_mobile_banner_with_default_values
    render_inline(Explore::MobileBannerComponent.new)

    assert_selector ".mobile-banner-container"
    assert_selector "img"
    assert_selector "img[alt='Puerto Jiu-Jitsu large logo banner']"
    assert_selector "img.explore-banner-image"
  end

  def test_renders_with_custom_values
    render_inline(Explore::MobileBannerComponent.new(
      image_src: "home/logo.jpg",
      image_alt: "Custom alt text",
      image_class: "custom-class"
    ))

    assert_selector "img"
    assert_selector "img[alt='Custom alt text']"
    assert_selector "img.custom-class"
  end

  def test_renders_with_semantic_html_structure
    render_inline(Explore::MobileBannerComponent.new)

    assert_selector "section[aria-labelledby]"
    assert_selector "h2[id*='mobile_banner']"
    assert_selector ".visually-hidden"
  end

  def test_renders_with_accessibility_features
    render_inline(Explore::MobileBannerComponent.new)

    assert_selector "section[aria-labelledby]"
    assert_selector "h2[id*='mobile_banner']"
    assert_selector ".visually-hidden", text: "Banner promocional móvil"
  end

  def test_renders_with_correct_css_classes
    render_inline(Explore::MobileBannerComponent.new)

    assert_selector ".mobile-banner-container"
    assert_selector ".explore-banner-image"
  end

  def test_renders_with_unique_ids
    render_inline(Explore::MobileBannerComponent.new)

    assert_selector "h2[id*='mobile_banner']"
  end
end
