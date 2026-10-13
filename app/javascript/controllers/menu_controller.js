import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel", "button", "openIcon", "closeIcon"]

  toggle() {
    this.panelTarget.hidden ? this.show() : this.hide()
  }

  show() {
    this.#render(true)
  }

  hide() {
    this.#render(false)
  }

  #render(open) {
    this.panelTarget.hidden = !open
    this.openIconTarget.hidden = open
    this.closeIconTarget.hidden = !open
    this.buttonTarget.setAttribute("aria-expanded", String(open))
  }
}
