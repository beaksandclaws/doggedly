module ApplicationHelper

  def page_title
    title = ['Doggedly']
    title.unshift @page_title if @page_title.present?
    title.join(' | ')
  end

  def page_description
    @page_description || 'Doggedly: A place to go to find a place to go with your dog'
  end

end
