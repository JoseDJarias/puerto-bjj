class PagesController < ApplicationController
  allow_unauthenticated_access

  def explore
    @programs = Program.all
  end

  def about_us
    @instructors = Program.find(:kids).instructors
  end

  def programs
    @programs = Program.all
  end

  def program
    @program = Program.find(params[:id])
  end
end
