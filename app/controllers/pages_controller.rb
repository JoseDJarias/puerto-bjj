class PagesController < ApplicationController
  allow_unauthenticated_access
  def explore
    puts "🚀 Hello World from - #{Rails.env} environment"
  end

  def about
  end

  def kids
    @page_title = "Programa de Jiu-Jitsu para Niños"
    @page_description = "Descubre nuestro programa de Jiu-Jitsu para niños en Puntarenas. Fomentamos la confianza, disciplina y respeto en un ambiente seguro y divertido."
  end

  def programs
    @page_title = "Programas de Nuestra Academia"
    @page_description = "Explora todos nuestros programas de artes marciales en Puntarenas: Jiu-Jitsu Brasileño (Gi & No-Gi), Boxeo, y MMA para todas las edades y niveles."
  end
end
