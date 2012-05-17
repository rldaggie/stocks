module ApplicationHelper
  
  def close_button
    content_tag :button, 'x', :class => 'close', 'data-dismiss' => 'alert'
  end
  
end
