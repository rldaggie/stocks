module ApplicationHelper
  
  def close_button
    content_tag :button, 'x', :class => 'close', 'data-dismiss' => 'alert'
  end
  
  def nav_item(text, path, &block)
    css_class = 'active' if current_page?(path)
    
    content_tag :li, class: css_class do
      link_to text, path
    end
  end
  
  def icon_white(css_classes)
    icon("#{css_classes} icon-white")
  end
  
  def icon(css_classes)
    content_tag :i, '', class: css_classes
  end
  
  def copyright_year
    the_year = Time.now.year
    the_year == 2012 ? the_year : "2012-#{the_year}"
  end
  
  def page_header(&block)
    content_tag :div, capture(&block), class: 'page-header'
  end
  
  def caret
    content_tag :span, '', class: 'caret'
  end
  
  def dropdown_toggle(text)
    link_to '#', class: 'dropdown-toggle', data: { toggle: 'dropdown' } do
      concat text
      concat caret
    end
  end
  
end
