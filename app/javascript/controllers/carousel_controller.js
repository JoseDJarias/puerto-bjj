import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slides"]

  connect() {
    this.isTransitioning = false
    this.slideCount = this.slidesTarget.children.length
    if (this.slideCount <= 1) { return }

    this.startAutoSlide()
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
    }
    this.slidesTarget.addEventListener('transitionend', handleTransitionEnd)
  }

  startAutoSlide() {
    clearInterval(this.interval)
    this.interval = setInterval(() => {
      this.next()
    }, 5000) // Cambia cada 5 segundos
  }
}
