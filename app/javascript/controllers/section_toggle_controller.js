import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "buttonText", "buttonIcon", "teaserBadge", "closeButtonWrapper"]
  static values = {
    open: { type: Boolean, default: false },
    openText: String,
    closeText: String
  }

  connect() {
    this.syncState()
  }

  toggle() {
    this.openValue = !this.openValue
    this.syncState()
  }

  syncState() {
    // On desktop (lg and above), always show content
    const isMobile = window.innerWidth < 1024

    if (!isMobile) {
      this.contentTarget.classList.remove("hidden")
      if (this.hasCloseButtonWrapperTarget) this.closeButtonWrapperTarget.classList.add("hidden")
      if (this.hasTeaserBadgeTarget) this.teaserBadgeTarget.classList.add("hidden")
      return
    }

    if (this.openValue) {
      this.contentTarget.classList.remove("hidden")
      if (this.hasCloseButtonWrapperTarget) this.closeButtonWrapperTarget.classList.remove("hidden")
      if (this.hasButtonTextTarget) this.buttonTextTarget.textContent = this.closeTextValue
      if (this.hasTeaserBadgeTarget) {
        this.teaserBadgeTarget.classList.add("hidden")
        const btn = this.teaserBadgeTarget.querySelector("button")
        if (btn) btn.setAttribute("aria-expanded", "true")
      }
    } else {
      this.contentTarget.classList.add("hidden")
      if (this.hasCloseButtonWrapperTarget) this.closeButtonWrapperTarget.classList.add("hidden")
      if (this.hasButtonTextTarget) this.buttonTextTarget.textContent = this.openTextValue
      if (this.hasTeaserBadgeTarget) {
        this.teaserBadgeTarget.classList.remove("hidden")
        const btn = this.teaserBadgeTarget.querySelector("button")
        if (btn) btn.setAttribute("aria-expanded", "false")
      }
    }
  }
}
