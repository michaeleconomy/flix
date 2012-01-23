module ApplicationHelper
  def h1_title(t)
    content_tag(:h1, @title = t)
  end
  
  def link_to_ar(ar, options = {})
    link_to ar.display_name, ar, options
  end
end
