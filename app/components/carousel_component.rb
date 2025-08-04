class CarouselComponent < ViewComponent::Base
  def initialize(
    images: [],
    auto_slide: true,
    interval: 5000,
    show_navigation: false,
    show_indicators: false,
    height: "auto",
    aspect_ratio: nil
  )
    @images = images
    @auto_slide = auto_slide
    @interval = interval
    @show_navigation = show_navigation
    @show_indicators = show_indicators
    @height = height
    @aspect_ratio = aspect_ratio
  end

  private

  def carousel_id
    @carousel_id ||= "carousel_#{SecureRandom.hex(4)}"
  end

  def has_multiple_slides?
    @images.length > 1
  end

  def carousel_style
    styles = []
    styles << "height: #{@height}" if @height != "auto"
    styles << "aspect-ratio: #{@aspect_ratio}" if @aspect_ratio
    styles.any? ? "style=\"#{styles.join('; ')}\"" : ""
  end

  def data_attributes
    attributes = {}

    if has_multiple_slides?
      attributes["data-controller"] = "carousel"
      attributes["data-carousel-auto-slide-value"] = @auto_slide
      attributes["data-carousel-interval-value"] = @interval
    end

    attributes
  end
end
