# 📚 Guía de Refactorización de Vistas a ViewComponents - Puerto BJJ

## 🎯 Propósito
Esta documentación sirve como guía para refactorizar vistas ERB existentes en ViewComponents modulares, manteniendo la consistencia de diseño y facilitando el trabajo incremental. **Especialmente útil para LLMs y desarrolladores que trabajen en la aplicación.**

---

## 🚀 Estructura de Refactorización Recomendada

### 1. Enfoque Incremental (Recomendado)
```
✅ PASO 1: Crear estructura de directorios
✅ PASO 2: Refactorizar componente por componente
✅ PASO 3: Migrar CSS gradualmente
✅ PASO 4: Actualizar tests
✅ PASO 5: Verificar funcionalidad
```

### 2. Estructura de Directorios Estándar
```
app/
├── components/
│   └── [view_name]/
│       ├── [component_name]_component.rb
│       ├── [component_name]_component.html.erb
│       └── _[component_name].html.erb (si es sub-componente)
├── assets/stylesheets/components/
│   └── [view_name]/
│       ├── [component_name].css
│       └── index.css (estilos principales)
└── test/components/
    └── [view_name]/
        ├── [component_name]_component_test.rb
        └── [component_name]_test.rb (si es sub-componente)
```

---

## 🔧 Proceso de Refactorización Paso a Paso

### PASO 1: Análisis de la Vista Actual
```ruby
# 1. Identificar secciones lógicas en la vista
# 2. Mapear clases CSS existentes
# 3. Identificar dependencias (helpers, partials, etc.)
# 4. Documentar funcionalidad específica
```

### PASO 2: Crear Estructura Base
```bash
# Crear directorios
mkdir -p app/components/[view_name]
mkdir -p app/assets/stylesheets/components/[view_name]
mkdir -p test/components/[view_name]

# Crear componente principal
touch app/components/[view_name]/index_component.rb
touch app/components/[view_name]/index_component.html.erb
```

### PASO 3: Refactorización Incremental
```ruby
# NO refactorizar todo de una vez
# Empezar con 1-2 componentes simples
# Verificar que funcionen antes de continuar
# Mantener tests pasando en cada paso
```

---

## 🎨 Estrategia de Migración CSS

### Opción A: Migración Gradual (Recomendada)
```css
/* 1. Mantener CSS original funcionando */
/* 2. Crear nuevo CSS con variables base.css */
/* 3. Migrar componente por componente */
/* 4. Eliminar CSS obsoleto solo al final */
```

### Opción B: Migración Completa
```css
/* Solo usar si tienes tiempo para testing completo */
/* Riesgo: Puede romper funcionalidad existente */
```

### Variables CSS-Zero Disponibles
```css
/* Colores Base - Fundación Minimalista */
--color-bg: #ffffff                    /* Fondo blanco puro */
--color-bg-secondary: #f8f9fa          /* Gris muy claro para secciones */
--color-bg-tertiary: #f1f3f4           /* Gris claro para tarjetas */
--color-bg-dark: #1a1a1a               /* Fondo oscuro para contraste */
--color-bg-gray: #bfc3cb               /* Gris de fondo */

/* Colores de Texto - Contraste Perfecto */
--color-text: #000000                  /* Negro puro para texto principal */
--color-text-secondary: #374151        /* Gris oscuro para texto secundario */
--color-text-muted: #6b7280            /* Gris medio para texto atenuado */
--color-text-reversed: #ffffff         /* Texto blanco en fondos oscuros */

/* Colores Primarios de Marca - Negro y Blanco */
--color-primary: #000000               /* Negro puro del logo */
--color-primary-light: #f5f5f4         /* Gris cálido sutil para fondos */
--color-primary-dark: #000000          /* Para énfasis */

/* Colores de Acento - Uso Mínimo de Rojo */
--color-accent: #dc2626                /* Rojo principal */
--color-accent-light: #ef4444          /* Rojo más claro para hover */
--color-accent-dark: #b91c1c           /* Rojo más oscuro para énfasis */

/* Colores Cálidos - Para CTAs Importantes */
--color-warm: #f59e0b                  /* Naranja cálido para CTAs importantes */
--color-warm-light: #fbbf24            /* Cálido claro para hover */
--color-warm-dark: #d97706             /* Cálido oscuro para énfasis */
--color-warm-subtle: #fef3c7           /* Cálido muy claro para fondos */

/* Colores Neutrales - Grises para UI */
--color-neutral: #374151               /* Gris oscuro para elementos secundarios */
--color-neutral-light: #6b7280         /* Gris medio para elementos terciarios */
--color-neutral-subtle: #f3f4f6        /* Gris muy claro para fondos */

/* Sistema de Bordes - Limpio y Sutil */
--color-border-light: #f3f4f6          /* Bordes muy claros */
--color-border: #e5e7eb                /* Bordes estándar */
--color-border-dark: #d1d5db           /* Bordes más oscuros */
--color-border-focus: #dc2626          /* Estado de foco */
--color-border-focus-light: #d7caca    /* Estado de foco claro */

/* Estados Interactivos */
--color-selected: #fef2f2              /* Fondo rojo muy claro */
--color-selected-light: #fecaca        /* Fondo rojo claro para estados de foco */
--color-hover: #f9fafb                 /* Estado hover sutil */

/* Colores Semánticos */
--color-success: #059669               /* Verde para éxito */
--color-warning: #d97706               /* Naranja para advertencias */
--color-error: #dc2626                 /* Rojo para errores */
--color-info: #2563eb                  /* Azul para información */
--color-muted: #6b7280                 /* Gris atenuado */

/* Colores de Medallas - Mantener existentes */
--color-gold: #fbbf24                  /* Dorado */
--color-silver: #9ca3af                /* Plateado */
--color-bronze: #d97706                /* Bronce */

/* Espaciado */
--section-spacing-xs: 1rem
--section-spacing-sm: 2rem
--section-spacing-md: 3rem
--section-spacing-lg: 4rem
--section-spacing-xl: 6rem
--section-spacing-2xl: 8rem
--section-spacing-3xl: 10rem

/* Tamaños */
--size-1: 0.25rem
--size-2: 0.5rem
--size-3: 0.75rem
--size-4: 1rem
--size-5: 1.25rem
--size-6: 1.5rem
--size-8: 2rem
--size-10: 2.5rem
--size-12: 3rem
--size-16: 4rem
--size-20: 5rem
--size-24: 6rem
--size-32: 8rem
--size-40: 10rem
--size-48: 12rem
--size-56: 14rem
--size-64: 16rem
--size-80: 20rem
--size-96: 24rem
--size-full: 100%

/* Tipografía */
--text-xs: 0.75rem
--text-sm: 0.875rem
--text-base: 1rem
--text-lg: 1.125rem
--text-xl: 1.25rem
--text-2xl: 1.5rem
--text-3xl: 1.875rem
--text-4xl: 2.25rem

/* Pesos de Fuente */
--font-light: 300
--font-normal: 400
--font-medium: 500
--font-semibold: 600
--font-bold: 700

/* Alturas de Línea */
--line-height-tight: 1.2
--line-height-normal: 1.5
--line-height-relaxed: 1.75

/* Bordes */
--rounded-sm: 0.125rem
--rounded-md: 0.375rem
--rounded-lg: 0.5rem
--rounded-xl: 0.75rem

/* Sombras */
--shadow-xs: 0 1px 2px 0 rgb(0 0 0 / 0.05)
--shadow-sm: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1)
--shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)
--shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1)

/* Breakpoints */
--breakpoint-sm: 640px
--breakpoint-md: 768px
--breakpoint-lg: 1024px
--breakpoint-xl: 1280px
--breakpoint-2xl: 1536px

/* Opacidad */
--opacity-0: 0
--opacity-25: 0.25
--opacity-50: 0.5
--opacity-75: 0.75
--opacity-100: 1
```

---

## 📋 Checklist de Refactorización

### ✅ Preparación
- [ ] Analizar vista actual y mapear secciones
- [ ] Crear estructura de directorios
- [ ] Identificar dependencias y helpers
- [ ] Planificar orden de refactorización

### ✅ Implementación
- [ ] Crear componente principal (index)
- [ ] Refactorizar componente por componente
- [ ] Migrar CSS gradualmente
- [ ] Mantener funcionalidad existente

### ✅ Testing
- [ ] Crear tests para cada componente
- [ ] Verificar que tests pasen
- [ ] Testear funcionalidad en navegador
- [ ] Verificar responsive design

### ✅ Finalización
- [ ] Eliminar CSS obsoleto
- [ ] Documentar cambios
- [ ] Commit y deploy

---

## 🎯 Patrones de Componentes Comunes

### Componente Principal (Index)
```ruby
module [ViewName]
  class IndexComponent < ViewComponent::Base
    def initialize(current_user: nil)
      @current_user = current_user
    end

    private

    attr_reader :current_user
  end
end
```

### Sub-Componente
```ruby
module [ViewName]
  class [ComponentName]Component < ViewComponent::Base
    # Lógica específica del componente
  end
end
```

### Template Principal
```erb
<section class="[view-name]-container" aria-labelledby="[view-name]-title">
  <header class="[view-name]-header">
    <h2 id="[view-name]-title" class="[view-name]-title"><%= @title %></h2>
  </header>
  
  <%= render([ViewName]::[ComponentName]Component.new) %>
  <%= render([ViewName]::[AnotherComponent]Component.new) %>
</section>
```

---

## 🧪 Guía de Testing

### Test Base para ViewComponent
```ruby
require "test_helper"

class [ViewName]::[ComponentName]ComponentTest < ViewComponent::TestCase
  include Rails.application.routes.url_helpers

  def test_renders_component_structure
    render_inline([ViewName]::[ComponentName]Component.new)
    
    assert_selector ".[component-name]"
    # Más assertions específicos
  end
end
```

### Tests Importantes a Incluir
- [ ] Estructura HTML básica
- [ ] Clases CSS principales
- [ ] Contenido dinámico
- [ ] Accesibilidad (ARIA, roles)
- [ ] Responsive behavior
- [ ] Integración con otros componentes

---

## 🚨 Errores Comunes y Soluciones

### Error: "Couldn't find a template file"
```bash
# Solución: Los archivos deben tener nombres exactos
# INCORRECTO: _component_name.html.erb
# CORRECTO: component_name_component.html.erb

```

### Error: Tests fallan por clases CSS-Zero
```ruby
# Solución: No testear clases con @ directamente
# INCORRECTO: assert_selector ".show@md"
# CORRECTO: assert_selector ".flex-grow.text-center.text-xl"
```

---

## 📱 Consideraciones de Responsive Design

### Breakpoints Estándar
```css
/* Mobile First */
@media (min-width: 390px) { /* iPhone Plus */ }
@media (min-width: 768px) { /* Tablet */ }
@media (min-width: 1024px) { /* Laptop */ }
@media (min-width: 1280px) { /* Desktop */ }
@media (min-width: 1440px) { /* Large Desktop */ }
@media (min-width: 1920px) { /* 4K */ }
```

### Clases CSS-Zero para Responsive
```css
/* Mostrar/ocultar por breakpoint */
.show@md    /* Mostrar en md y superior */
.hide@lg    /* Ocultar en lg y superior */
```

---

## 🔍 Verificación de Calidad

### Checklist de Verificación
- [ ] Componente renderiza correctamente
- [ ] CSS se aplica sin conflictos
- [ ] Responsive design funciona
- [ ] Tests pasan (0 failures, 0 errors)
- [ ] Accesibilidad mantenida
- [ ] Performance no degradada

### Comandos de Verificación
```bash
# Ejecutar tests del componente
bin/rails test test/components/[view_name]/

# Ejecutar todos los tests
bin/rails test

# Verificar servidor arranca
bin/rails server -p 3000 -d
```

---

## 📚 Recursos y Referencias

### Archivos Importantes
- `app/assets/stylesheets/css-zero/base.css` - Variables CSS-Zero
- `app/javascript/controllers/` - Stimulus controllers
- `app/views/shared/` - Componentes compartidos

### Patrones de Diseño
- Mobile-first responsive design
- CSS-Zero spacing system
- Semantic HTML structure
- Accessibility-first approach

---

## 🎉 Conclusión

**Recuerda: La refactorización debe ser incremental y cuidadosa.**
- ✅ Un componente a la vez
- ✅ Tests pasando en cada paso
- ✅ Funcionalidad verificada antes de continuar
- ✅ CSS migrado gradualmente
- ✅ Documentación actualizada

Esta guía te ayudará a mantener la consistencia y calidad durante todo el proceso de refactorización.

---

*Última actualización: <%= Date.current.strftime("%B %d, %Y") %>*
*Versión: 1.0*
*Mantenido por: Equipo Puerto BJJ* 