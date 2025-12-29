class PagesController < ApplicationController
  allow_unauthenticated_access

  def explore
  end

  def about_us
  end

  def programs
    @page_title = "Programas de Nuestra Academia"
    @page_description = "Explora todos nuestros programas de artes marciales en Puntarenas: Jiu-Jitsu Brasileño (Gi & No-Gi), Boxeo, y MMA para todas las edades y niveles."
  end

  VALID_PROGRAMS = %i[kids boxing jiu_jitsu no_gi mma].freeze

  def program
    @program_key = normalize_key(params[:id])
  end

  private

  def normalize_key(param)
    key = param.to_s.tr("-", "_").to_sym
    VALID_PROGRAMS.include?(key) ? key : :kids
  end
end
