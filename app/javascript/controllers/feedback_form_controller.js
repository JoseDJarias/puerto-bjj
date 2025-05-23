import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "email", "message", "submit", "infoMessage"]

  connect() {
    this.validate()
  }

  validate() {
    const nameValid = this.nameTarget.value.trim().length > 0 && this.nameTarget.value.length <= 50
    const emailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.emailTarget.value)
    const messageValid = this.messageTarget.value.trim().length > 0 && this.messageTarget.value.length <= 1000

    const isValid = nameValid && emailValid && messageValid
    this.submitTarget.disabled = !isValid
    
    // Controlar la visibilidad del mensaje informativo
    if (this.hasInfoMessageTarget) {
      this.infoMessageTarget.classList.toggle('hidden', isValid)
    }
  }
} 