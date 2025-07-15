import { Controller } from "@hotwired/stimulus"

// StickyHideHeaderController
// Hides the header when scrolling down, shows it when scrolling up
// Clean, future-proof, and easy to extend
export default class extends Controller {
  static targets = ["header"]

  connect() {
    // Initial state
    this.lastScrollY = window.scrollY
    this.ticking = false
    this.isHidden = false

    // Bind the handler for performance
    this.handleScroll = this.handleScroll.bind(this)
    window.addEventListener("scroll", this.handleScroll, { passive: true })
  }

  disconnect() {
    window.removeEventListener("scroll", this.handleScroll)
  }

  handleScroll() {
    // Throttle with requestAnimationFrame for performance
    if (!this.ticking) {
      window.requestAnimationFrame(() => {
        this.updateHeaderVisibility()
        this.ticking = false
      })
      this.ticking = true
    }
  }

  updateHeaderVisibility() {
    const currentScrollY = window.scrollY
    const threshold = 40 // px before header starts hiding

    // Always show header at the very top
    if (currentScrollY <= threshold) {
      this.showHeader()
    } else if (currentScrollY > this.lastScrollY) {
      // Scrolling down
      this.hideHeader()
    } else if (currentScrollY < this.lastScrollY) {
      // Scrolling up (even a single pixel)
      this.showHeader()
    }
    this.lastScrollY = currentScrollY
  }

  showHeader() {
    if (this.isHidden) {
      this.headerTarget.classList.remove("header--hidden")
      this.isHidden = false
    }
  }

  hideHeader() {
    if (!this.isHidden) {
      this.headerTarget.classList.add("header--hidden")
      this.isHidden = true
    }
  }
} 