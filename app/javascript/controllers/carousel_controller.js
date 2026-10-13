import { Controller } from "@hotwired/stimulus"

const SWIPE_THRESHOLD = 40

export default class extends Controller {
  static targets = ["track", "slide", "dot", "counter"]
  static values = {
    index: { type: Number, default: 0 },
    interval: { type: Number, default: 6000 },
    autoplay: { type: Boolean, default: true }
  }

  connect() {
    this.reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches
    this.render()
    this.start()
  }

  disconnect() {
    this.stop()
  }

  next() {
    this.indexValue = (this.indexValue + 1) % this.slideTargets.length
  }

  previous() {
    this.indexValue = (this.indexValue - 1 + this.slideTargets.length) % this.slideTargets.length
  }

  go({ params: { index } }) {
    this.indexValue = index
  }

  start() {
    if (!this.autoplayValue || this.reducedMotion || this.timer) return
    this.timer = setInterval(() => this.next(), this.intervalValue)
  }

  stop() {
    clearInterval(this.timer)
    this.timer = null
  }

  touchStart(event) {
    this.touchX = event.changedTouches[0].clientX
    this.stop()
  }

  touchEnd(event) {
    const delta = event.changedTouches[0].clientX - this.touchX
    if (Math.abs(delta) > SWIPE_THRESHOLD) delta < 0 ? this.next() : this.previous()
    this.start()
  }

  indexValueChanged() {
    if (this.hasTrackTarget) this.render()
  }

  render() {
    this.trackTarget.style.transform = `translateX(-${this.indexValue * 100}%)`

    this.slideTargets.forEach((slide, i) => {
      const active = i === this.indexValue
      slide.setAttribute("aria-hidden", String(!active))
      slide.inert = !active
    })

    this.dotTargets.forEach((dot, i) => {
      dot.setAttribute("aria-current", String(i === this.indexValue))
    })

    if (this.hasCounterTarget) {
      this.counterTarget.textContent = String(this.indexValue + 1).padStart(2, "0")
    }
  }
}
