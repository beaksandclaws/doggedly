class PagesController < ApplicationController
  def home
    @page_title = "Home"
    logger.ap session
  end

  def error404
    show_404
  end
end
