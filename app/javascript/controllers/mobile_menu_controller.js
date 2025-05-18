import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["trigger"]

  connect() {
    this.menu = document.getElementById(this.triggerTarget.dataset.menuId)
  }

  toggle() {
    this.menu.classList.toggle("hidden")
  }

  close() {
    this.menu.classList.add("hidden")
  }
}
