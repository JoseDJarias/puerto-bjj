class PagesController < ApplicationController
  allow_unauthenticated_access
  def explore
    @carousel_items = MediaItem.where(category: "home").with_attached_file
  end

  def about
  end

  def horarios
  end

  def gallery
  end
end
