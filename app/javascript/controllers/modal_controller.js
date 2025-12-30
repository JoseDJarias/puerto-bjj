import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]

  show() {
    this.contentTarget.show()
  }

  showModal() {
    this.contentTarget.showModal()
  }

  close() {
    this.contentTarget.close()
    this.resetIfSuccess()
  }

  closeOnClickOutside({ target }) {
    if (target.nodeName === "DIALOG") this.close()
  }

  resetIfSuccess() {
    const wrapper = this.contentTarget.querySelector('.feedback-result')
    if (wrapper) {
      const frame = this.contentTarget.querySelector('turbo-frame#feedback-form-frame')
      if (frame) {
        frame.src = '/feedback'
        frame.reload()
      }
    }
  }
}