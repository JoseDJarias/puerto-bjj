import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slides"]
  currentIndex = 0

  connect() {
    this.total = this.slidesTarget.children.length
    this.startAutoSlide()
  }

  disconnect() {
    clearInterval(this.interval)
  }

  next() {
    this.currentIndex = (this.currentIndex + 1) % this.total
    this.updateSlide()
  }

  prev() {
    this.currentIndex = (this.currentIndex - 1 + this.total) % this.total
    this.updateSlide()
  }

  updateSlide() {
    const offset = -this.currentIndex * 100
    this.slidesTarget.style.transform = `translateX(${offset}%)`
  }

  startAutoSlide() {
    this.interval = setInterval(() => {
      this.next()
    }, 6000) // Cambia cada 3 segundos
  }
}
