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
  
end
