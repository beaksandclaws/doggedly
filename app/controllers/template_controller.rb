class TemplateController < ApplicationController
  def home
    @page_title = "Templates Home"
  end

  def detail
    @page_title = "Templates Detail"
  end
end
