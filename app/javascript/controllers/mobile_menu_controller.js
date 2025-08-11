import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["trigger"]

  connect() {
    this.menu = document.getElementById(this.triggerTarget.dataset.menuId)
    this.setupEventListeners()
  }

  disconnect() {
    this.removeEventListeners()
  }

  setupEventListeners() {
    // Cerrar menu al hacer click fuera
    document.addEventListener('click', this.handleClickOutside.bind(this))
    
    // Cerrar menu al hacer scroll
    window.addEventListener('scroll', this.handleScroll.bind(this), { passive: true })
  }

  removeEventListeners() {
    document.removeEventListener('click', this.handleClickOutside.bind(this))
    window.removeEventListener('scroll', this.handleScroll.bind(this))
  }

  handleClickOutside(event) {
    if (!this.element.contains(event.target) && !this.menu.contains(event.target)) {
      this.close()
    }
  }

  handleScroll() {
    // Cerrar menu al hacer scroll
    this.close()
  }

  toggle() {
    this.menu.classList.toggle("hidden")
  }

  close() {
    this.menu.classList.add("hidden")
  }
}
