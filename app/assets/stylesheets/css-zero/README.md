# CSS-Zero Design System

Sistema de diseño basado en CSS-Zero (Laxaro Nixon) para Puerto BJJ.

## 🎨 Variables del Sistema

### Colores Base
```css
--color-bg: white                    /* Fondo principal */
--color-text: black                 /* Texto principal */
--color-text-reversed: white        /* Texto sobre fondos oscuros */
--color-text-subtle: var(--zinc-500) /* Texto secundario */
```

### Colores de Acento
```css
--color-primary: var(--zinc-900)    /* Color principal */
--color-secondary: var(--zinc-100)  /* Color secundario */
--color-positive: var(--green-600)  /* Éxito */
--color-negative: var(--red-600)    /* Error */
```

### Tipografía
```css
--text-xs: 0.75rem    /* 12px */
--text-sm: 0.875rem   /* 14px */
--text-base: 1rem     /* 16px */
--text-lg: 1.125rem   /* 18px */
--text-xl: 1.25rem    /* 20px */
--text-2xl: 1.5rem    /* 24px */
--text-3xl: 1.875rem  /* 30px */
--text-4xl: 2.25rem   /* 36px */
```

### Espaciado
```css
--size-1: 0.25rem     /* 4px */
--size-2: 0.5rem      /* 8px */
--size-3: 0.75rem     /* 12px */
--size-4: 1rem        /* 16px */
--size-5: 1.25rem     /* 20px */
--size-6: 1.5rem      /* 24px */
--size-8: 2rem        /* 32px */
--size-10: 2.5rem     /* 40px */
--size-12: 3rem       /* 48px */
--size-16: 4rem       /* 64px */
--size-20: 5rem       /* 80px */
--size-24: 6rem       /* 96px */
--size-32: 8rem       /* 128px */
--size-40: 10rem      /* 160px */
--size-48: 12rem      /* 192px */
--size-56: 14rem      /* 224px */
--size-64: 16rem      /* 256px */
--size-80: 20rem      /* 320px */
--size-96: 24rem      /* 384px */
--size-full: 100%     /* 100% */
```

### Bordes y Sombras
```css
--rounded-sm: 0.125rem  /* 2px */
--rounded-md: 0.375rem  /* 6px */
--rounded-lg: 0.5rem    /* 8px */
--rounded-xl: 0.75rem   /* 12px */

--shadow-xs: 0 1px 2px 0 rgb(0 0 0 / 0.05)
--shadow-sm: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1)
--shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)
--shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1)
```

## 🧩 Componentes

### Botones
```html
<!-- Variantes -->
<button class="btn btn--primary">Primary</button>
<button class="btn btn--secondary">Secondary</button>
<button class="btn btn--positive">Success</button>
<button class="btn btn--negative">Danger</button>
<button class="btn btn--plain">Plain</button>

<!-- Tamaños -->
<button class="btn btn--primary btn--sm">Small</button>
<button class="btn btn--primary">Default</button>
<button class="btn btn--primary btn--lg">Large</button>
<button class="btn btn--primary btn--xl">Extra Large</button>

<!-- Estados -->
<button class="btn btn--primary btn--animated">Animated</button>
<button class="btn btn--primary" disabled>Disabled</button>
```

### Inputs
```html
<!-- Básico -->
<input type="text" class="input" placeholder="Enter text">

<!-- Tamaños -->
<input type="text" class="input input--sm" placeholder="Small">
<input type="text" class="input" placeholder="Default">
<input type="text" class="input input--lg" placeholder="Large">

<!-- Estados -->
<input type="text" class="input" disabled placeholder="Disabled">
```

### Alertas
```html
<!-- Tipos -->
<div class="alert alert--positive">Success message</div>
<div class="alert alert--negative">Error message</div>
<div class="alert alert--warning">Warning message</div>
<div class="alert alert--info">Info message</div>

<!-- Tamaños -->
<div class="alert alert--positive alert--sm">Small alert</div>
<div class="alert alert--positive">Default alert</div>
<div class="alert alert--positive alert--lg">Large alert</div>

<!-- Con botón de cerrar -->
<div class="alert alert--positive alert--dismissible">
  Dismissible alert
  <button class="alert__close">×</button>
</div>
```

### Flash Messages
```html
<!-- Tipos -->
<div class="flash flash--positive">Success flash</div>
<div class="flash flash--negative">Error flash</div>
<div class="flash flash--notice">Notice flash</div>
<div class="flash flash--alert">Alert flash</div>
<div class="flash flash--warning">Warning flash</div>
<div class="flash flash--info">Info flash</div>

<!-- Duración extendida -->
<div class="flash flash--positive flash--extended">Extended flash</div>
```

## 🌙 Dark Mode

El sistema soporta dark mode automático usando `prefers-color-scheme: dark`:

```css
@media (prefers-color-scheme: dark) {
  --color-bg: var(--zinc-900);
  --color-text: var(--zinc-50);
  --color-text-reversed: var(--zinc-900);
  /* ... más variables */
}
```

## 🎯 Mejores Prácticas

1. **Usar variables CSS** en lugar de valores hardcodeados
2. **Combinar clases** para crear variantes (ej: `btn btn--primary btn--lg`)
3. **Mantener consistencia** en el naming de clases
4. **Usar ViewComponents** para encapsular lógica compleja
5. **Testear en dark mode** para asegurar contraste

## 🔧 Personalización

Para personalizar el sistema, modifica las variables en `base.css`:

```css
:root {
  --color-primary: #your-color;
  --text-base: 1.1rem;
  --rounded-md: 0.5rem;
}
```

## 📱 Responsive

El sistema es mobile-first y usa:
- `clamp()` para tipografía fluida
- Flexbox para layouts
- Media queries para breakpoints específicos
- Variables CSS para espaciado consistente 