import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["details"]

  toggle(event) {
    const isOpen = this.detailsTarget.open
    this.detailsTarget.open = !isOpen
    
    // Update aria-expanded on the button
    const button = event.currentTarget
    button.setAttribute("aria-expanded", !isOpen)
  }
}
