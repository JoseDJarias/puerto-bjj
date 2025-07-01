class PagesController < ApplicationController
  allow_unauthenticated_access
  def explore
  end

  def about
  end

  def kids
    @page_title = "Programa de Jiu-Jitsu para Niños"
    @page_description = "Descubre nuestro programa de Jiu-Jitsu para niños en Puntarenas. Fomentamos la confianza, disciplina y respeto en un ambiente seguro y divertido."
  end
end
