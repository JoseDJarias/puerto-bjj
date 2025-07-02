import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.boundHide = this.hide.bind(this)
  }

  toggle(event) {
    // Prevent the link click from firing when we just want to toggle
    event.preventDefault()
    
    if (this.menuTarget.classList.contains("hidden")) {
      this.show()
    } else {
      this.hide()
    }
  }

  show() {
    this.menuTarget.classList.remove("hidden")
    // Use a timeout to allow the menu to be visible before adding the event listener for clicks outside
    setTimeout(() => {
      document.addEventListener("click", this.boundHide, { once: true })
    }, 0)
  }

  hide() {
    this.menuTarget.classList.add("hidden")
  }
} 