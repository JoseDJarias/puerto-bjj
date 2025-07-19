# Puerto BJJ - Contexto del Proyecto

## 🏗️ Stack Tecnológico
- **Framework:** Rails 8.0.2
- **Build System:** Sin build (propshaft, importmap)
- **CSS:** CSS-Zero (Laxaro Nixon) - NO Tailwind
- **Deploy:** Kamal 2.5.6
- **Hosting:** Hetzner (Webhosting + Server)
- **Database:** SQLite (prod)
- **JavaScript:** Stimulus controllers
- **Icons:** Lucide Rails
- **Asset Pipeline:** Propshaft

## 🎨 Arquitectura y Diseño
- **Header:** Sticky header con hide/show on scroll (funciona en mobile, problemas en desktop)
- **CSS Variables:** Sistema personalizado en css-zero/base.css
- **JavaScript:** Stimulus controllers para interactividad
- **Icons:** Lucide Rails para iconografía consistente
- **Responsive:** Mobile-first approach

## 📋 Reglas Importantes
1. **NO usar Tailwind CSS** - Usar CSS-Zero exclusivamente
2. **CSS Variables:** Usar --color-bg, --color-text, --color-primary, --color-text-reversed
3. **Mantener consistencia** con el sistema de colores existente
4. **Stimulus:** Usar para toda interactividad JavaScript
5. **Seguir patrones de Kamal** para deploy
6. **Mobile-first:** Priorizar experiencia móvil

## 🐛 Problemas Conocidos
- **Variables CSS en modo oscuro** mal configuradas en base.css
- **Deploy con Kamal** requiere KAMAL_REGISTRY_PASSWORD configurado
- **Textos en blanco** aparecen en algunos navegadores/dispositivos

## 📁 Estructura de Archivos Clave
- `app/assets/stylesheets/css-zero/base.css` - Variables CSS principales
- `app/javascript/controllers/` - Controllers de Stimulus
- `config/deploy.yml` - Configuración Kamal
- `.kamal/secrets` - Secrets para deploy
- `app/views/shared/_header.html.erb` - Template del header

## 🚀 Deployment
- **Kamal 2.5.6** para orchestration
- **Docker** para containers
- **Hetzner** como hosting
- **Registry:** Docker Hub (daniel01ariasjaen/puerto-bjj)
- **Secrets:** Configurados en .kamal/secrets

## 🎯 Funcionalidades Implementadas
- **Sticky Header:** Hide/show on scroll (Facebook-like)
- **Responsive Design:** Mobile-first
- **Admin Panel:** Gestión de feedback y media
- **User Authentication:** Sistema de usuarios y sesiones
- **Contact Forms:** Sistema de feedback
- **Social Media Integration:** Facebook, Instagram, WhatsApp

## 🔧 Configuración de Desarrollo
- **Ruby:** 3.4.1
- **Node:** No requerido (no-build approach)
- **Database:** SQLite en desarrollo y produccion
- **Code Quality:** RuboCop, Brakeman

## 📱 Páginas Principales
- **Home/Explore:** Página principal con hero, programas, horarios
- **About:** Información de la academia
- **Programs:** Lista de programas disponibles
- **Kids Program:** Programa especializado para niños
- **Feedback:** Formulario de contacto
- **Admin:** Panel de administración

## 🎨 Sistema de Colores
```css
:root {
  --color-bg: white;
  --color-text: black;
  --color-text-reversed: white;
  --color-primary: var(--zinc-900);
  --color-primary-light: rgb(145, 223, 249);
}
```

## 🚨 Issues Críticos a Resolver
1. **CSS Variables Dark Mode:** Corregir media query en base.css
3. **Deploy Secrets:** Configurar correctamente KAMAL_REGISTRY_PASSWORD
4. **Text Contrast:** Resolver problemas de texto blanco sobre blanco

## 📈 Próximas Mejoras
- **Staging Environment:** Implementar ambiente de testing
- **Performance:** Optimizar cargas de imágenes
- **SEO:** Mejorar meta tags y structured data
- **Analytics:** Implementar tracking de usuarios 