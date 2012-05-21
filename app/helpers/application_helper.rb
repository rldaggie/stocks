module ApplicationHelper
  
  def close_button
    content_tag :button, 'x', :class => 'close', 'data-dismiss' => 'alert'
  end
  
  def nav_item(the_controller, &block)
    the_class = 'active' if controller.is_a?(the_controller)
    
    content_tag :li, class: the_class do
      capture(&block)
    end
  end
  
  def icon_white(css_classes)
    icon("#{css_classes} icon-white")
  end
  
  def icon(css_classes)
    content_tag :i, '', class: css_classes
  end
  
end
