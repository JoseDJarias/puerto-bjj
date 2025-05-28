import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]
  
  connect() {
    this.timeout = null
  }

  submit(event) {
    // Si el evento viene del input, solo buscar si es Enter
    if (event.type === "keydown" && event.key !== "Enter") {
      return
    }
    
    this.element.requestSubmit()
  }

  clear(event) {
    event.preventDefault()
    this.inputTarget.value = ""
    this.element.requestSubmit()
  }
} 