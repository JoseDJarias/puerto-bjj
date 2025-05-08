import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.startScrolling()
  }

  startScrolling() {
    const content = this.element.querySelector(".scrolling-content")
    let position = this.getInitialPosition() // Obtener la posición inicial basada en el ancho de la pantalla

    const animate = () => {
      position -= 1 // Velocidad del desplazamiento
      content.style.transform = `translateX(${position}px)`

      // Cuando el texto desaparezca completamente, lo reiniciamos
      if (Math.abs(position) >= content.offsetWidth) {
        position = this.element.offsetWidth
      }

      requestAnimationFrame(animate)
    }

    animate()
  }

  getInitialPosition() {
    const screenWidth = window.innerWidth

    if (screenWidth < 768) {
      return 250 // Para móviles, más cerca de la izquierda
    } else if (screenWidth >= 768 && screenWidth < 1024) {
      return 400 // Para tablets
    } else {
      return 500 // Para pantallas grandes
    }
  }
}
