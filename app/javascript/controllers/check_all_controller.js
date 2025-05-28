import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "dependant", 
    "dependee", 
    "submitButton", 
    "batchActions", 
    "selectionCount",
    "selectAllGlobal",
    "globalActions",
    "globalSelectionCount",
    "globalSubmitButton",
    "form"
  ]

  connect() {
    this.updateSelectionCount()
  }

  check() {
    const dependants = this.dependantTargets
    const dependee = this.dependeeTarget

    if (this.hasDependeeTarget && event.target === dependee) {
      dependants.forEach(dependant => {
        dependant.checked = dependee.checked
      })
    } else {
      dependee.checked = dependants.every(dependant => dependant.checked)
    }

    this.updateSelectionCount()
  }

  selectAllGlobal() {
    const isChecked = this.selectAllGlobalTarget.checked
    
    if (isChecked) {
      // Cuando se selecciona "Seleccionar todos los registros"
      this.globalActionsTarget.style.display = "flex"
      this.globalSelectionCountTarget.textContent = "Todos los registros seleccionados"
      this.globalSubmitButtonTarget.textContent = "Eliminar"
      
      // Desactivar la selección de página
      this.dependeeTarget.disabled = true
      this.dependantTargets.forEach(checkbox => checkbox.disabled = true)
      this.batchActionsTarget.style.display = "none"

      // Agregar un campo oculto para indicar selección global
      let hiddenInput = this.formTarget.querySelector('input[name="select_all_global"]')
      if (!hiddenInput) {
        hiddenInput = document.createElement('input')
        hiddenInput.type = 'hidden'
        hiddenInput.name = 'select_all_global'
        this.formTarget.appendChild(hiddenInput)
      }
      hiddenInput.value = 'true'
    } else {
      // Cuando se deselecciona "Seleccionar todos los registros"
      this.globalActionsTarget.style.display = "none"
      this.dependeeTarget.disabled = false
      this.dependantTargets.forEach(checkbox => checkbox.disabled = false)
      this.updateSelectionCount()

      // Actualizar el campo oculto
      const hiddenInput = this.formTarget.querySelector('input[name="select_all_global"]')
      if (hiddenInput) {
        hiddenInput.value = 'false'
      }
    }
  }

  updateSelectionCount() {
    const checkedCount = this.dependantTargets.filter(dependant => dependant.checked).length
    const totalCount = this.dependantTargets.length

    if (checkedCount > 0) {
      this.selectionCountTarget.textContent = ` ${checkedCount} de ${totalCount} seleccionados en esta página`
      this.batchActionsTarget.style.display = "flex"
      this.submitButtonTarget.textContent = `Eliminar`
    } else {
      this.batchActionsTarget.style.display = "none"
    }
  }
} 