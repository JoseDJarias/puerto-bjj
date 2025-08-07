import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slides"]
  static values = {
    autoSlide: { type: Boolean, default: true },
    interval: { type: Number, default: 5000 },
    id: { type: String, default: "" }
  }

  connect() {
    this.isTransitioning = false
    this.currentSlide = 0
    this.slideCount = this.slidesTarget.children.length
    
    if (this.slideCount <= 1) { 
      return 
    }

    if (this.autoSlideValue) {
      this.startAutoSlide()
    }
  }

  disconnect() {
    clearInterval(this.interval)
  }

  next() {
    if (this.isTransitioning) { return }
    this.isTransitioning = true

    // Animate to the next slide
    this.slidesTarget.style.transition = 'transform 0.5s ease-in-out'
    this.slidesTarget.style.transform = 'translateX(-100%)'

    const handleTransitionEnd = () => {
      // Move the first (now hidden) slide to the end of the list
      this.slidesTarget.appendChild(this.slidesTarget.firstElementChild)

      // Instantly reset position without animation
      this.slidesTarget.style.transition = 'none'
      this.slidesTarget.style.transform = 'translateX(0)'

      // Clean up and allow the next transition
      this.slidesTarget.removeEventListener('transitionend', handleTransitionEnd)
      this.isTransitioning = false
      
      // Update current slide index
      this.currentSlide = (this.currentSlide + 1) % this.slideCount
      this.updateIndicators()
    }

    this.slidesTarget.addEventListener('transitionend', handleTransitionEnd)
  }

  prev() {
    if (this.isTransitioning) { return }
    this.isTransitioning = true

    // To go backwards, first move the last slide to the beginning
    this.slidesTarget.insertBefore(this.slidesTarget.lastElementChild, this.slidesTarget.firstElementChild)
    
    // Instantly position it before the current slide (ready for animation)
    this.slidesTarget.style.transition = 'none'
    this.slidesTarget.style.transform = 'translateX(-100%)'

    // Force the browser to apply the style change immediately
    this.slidesTarget.offsetHeight

    // Animate it into view
    this.slidesTarget.style.transition = 'transform 0.5s ease-in-out'
    this.slidesTarget.style.transform = 'translateX(0)'

    const handleTransitionEnd = () => {
      this.slidesTarget.removeEventListener('transitionend', handleTransitionEnd)
      this.isTransitioning = false
      
      // Update current slide index
      this.currentSlide = (this.currentSlide - 1 + this.slideCount) % this.slideCount
      this.updateIndicators()
    }
    this.slidesTarget.addEventListener('transitionend', handleTransitionEnd)
  }

  goToSlide(event) {
    const targetSlide = parseInt(event.params.slide)
    if (targetSlide === this.currentSlide || this.isTransitioning) { return }
    
    this.isTransitioning = true
    
    // Calculate how many slides to move
    const slidesToMove = targetSlide - this.currentSlide
    
    if (slidesToMove > 0) {
      // Move forward
      for (let i = 0; i < slidesToMove; i++) {
        this.slidesTarget.appendChild(this.slidesTarget.firstElementChild)
      }
    } else {
      // Move backward
      for (let i = 0; i < Math.abs(slidesToMove); i++) {
        this.slidesTarget.insertBefore(this.slidesTarget.lastElementChild, this.slidesTarget.firstElementChild)
      }
    }
    
    this.currentSlide = targetSlide
    this.updateIndicators()
    this.isTransitioning = false
  }

  startAutoSlide() {
    clearInterval(this.interval)
    this.interval = setInterval(() => {
      this.next()
    }, this.intervalValue)
  }

  stopAutoSlide() {
    clearInterval(this.interval)
  }

  updateIndicators() {
    const indicators = this.element.querySelectorAll('.carousel-indicator')
    indicators.forEach((indicator, index) => {
      if (index === this.currentSlide) {
        indicator.classList.add('carousel-indicator--active')
        indicator.setAttribute('aria-selected', 'true')
      } else {
        indicator.classList.remove('carousel-indicator--active')
        indicator.setAttribute('aria-selected', 'false')
      }
    })
  }
}
