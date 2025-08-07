require "test_helper"

class CarouselComponentTest < ViewComponent::TestCase
  def test_renders_carousel_with_images
    images = [
      { src: "home/jiujitsu-gi.jpeg", alt: "Test Image 1" },
      { src: "home/jiujitsu-nogi.jpeg", alt: "Test Image 2" }
    ]

    render_inline(CarouselComponent.new(images: images))

    assert_selector ".carousel-container"
    assert_selector ".carousel-track"
    assert_selector ".carousel-slide", count: 2
    assert_selector "img[src*='jiujitsu-gi']"
    assert_selector "img[src*='jiujitsu-nogi']"
    assert_selector "img[alt='Test Image 1']"
    assert_selector "img[alt='Test Image 2']"
  end

  def test_renders_single_image_without_carousel_functionality
    images = [ { src: "home/jiujitsu-gi.jpeg", alt: "Single Image" } ]

    render_inline(CarouselComponent.new(images: images))

    assert_selector ".carousel-container"
    assert_selector ".carousel-slide", count: 1
    assert_no_selector "[data-controller='carousel']"
  end

  def test_renders_navigation_buttons_when_enabled
    images = [
      { src: "home/jiujitsu-gi.jpeg", alt: "Test 1" },
      { src: "home/jiujitsu-nogi.jpeg", alt: "Test 2" }
    ]

    render_inline(CarouselComponent.new(
      images: images,
      show_navigation: true
    ))

    assert_selector ".carousel-nav--prev"
    assert_selector ".carousel-nav--next"
    assert_selector "button[aria-label='Previous slide']"
    assert_selector "button[aria-label='Next slide']"
  end

  def test_renders_indicators_when_enabled
    images = [
      { src: "home/jiujitsu-gi.jpeg", alt: "Test 1" },
      { src: "home/jiujitsu-nogi.jpeg", alt: "Test 2" },
      { src: "home/brazilian-jiujitsu.jpeg", alt: "Test 3" }
    ]

    render_inline(CarouselComponent.new(
      images: images,
      show_indicators: true
    ))

    assert_selector ".carousel-indicators"
    assert_selector ".carousel-indicator", count: 3
    assert_selector ".carousel-indicator--active", count: 1
    assert_selector "button[aria-label='Go to slide 1']"
    assert_selector "button[aria-label='Go to slide 2']"
    assert_selector "button[aria-label='Go to slide 3']"
  end

  def test_does_not_render_navigation_for_single_image
    images = [ { src: "home/jiujitsu-gi.jpeg", alt: "Single" } ]

    render_inline(CarouselComponent.new(
      images: images,
      show_navigation: true
    ))

    assert_no_selector ".carousel-nav"
  end

  def test_does_not_render_indicators_for_single_image
    images = [ { src: "home/jiujitsu-gi.jpeg", alt: "Single" } ]

    render_inline(CarouselComponent.new(
      images: images,
      show_indicators: true
    ))

    assert_no_selector ".carousel-indicators"
  end

  def test_renders_with_custom_height
    images = [ { src: "home/jiujitsu-gi.jpeg", alt: "Test" } ]

    render_inline(CarouselComponent.new(
      images: images,
      height: "400px"
    ))

    assert_selector ".carousel-container[style*='height: 400px']"
  end

  def test_renders_with_aspect_ratio
    images = [ { src: "home/jiujitsu-gi.jpeg", alt: "Test" } ]

    render_inline(CarouselComponent.new(
      images: images,
      aspect_ratio: "16/9"
    ))

    assert_selector ".carousel-container[style*='aspect-ratio: 16/9']"
  end

  def test_renders_with_stimulus_attributes
    images = [
      { src: "home/jiujitsu-gi.jpeg", alt: "Test 1" },
      { src: "home/jiujitsu-nogi.jpeg", alt: "Test 2" }
    ]

    render_inline(CarouselComponent.new(
      images: images,
      auto_slide: false,
      interval: 3000
    ))

    assert_selector "[data-controller='carousel']"
    assert_selector "[data-carousel-auto-slide-value='false']"
    assert_selector "[data-carousel-interval-value='3000']"
  end

  def test_renders_with_lazy_loading
    images = [ { src: "home/jiujitsu-gi.jpeg", alt: "Test" } ]

    render_inline(CarouselComponent.new(images: images))

    assert_selector "img[loading='lazy']"
  end

  def test_renders_with_default_alt_text
    images = [ { src: "home/jiujitsu-gi.jpeg" } ]

    render_inline(CarouselComponent.new(images: images))

    assert_selector "img[alt='Carousel image']"
  end

  def test_renders_with_accessibility_attributes
    images = [
      { src: "home/jiujitsu-gi.jpeg", alt: "Test 1" },
      { src: "home/jiujitsu-nogi.jpeg", alt: "Test 2" }
    ]

    render_inline(CarouselComponent.new(
      images: images,
      show_indicators: true
    ))

    assert_selector ".carousel-indicators[role='tablist']"
    assert_selector ".carousel-indicators[aria-label='Carousel slides']"
    assert_selector ".carousel-indicator[role='tab']"
    assert_selector ".carousel-indicator[aria-selected='true']"
    assert_selector ".carousel-indicator[aria-selected='false']"
  end
end
