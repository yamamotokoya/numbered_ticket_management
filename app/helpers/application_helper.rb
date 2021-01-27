module ApplicationHelper
  def flash_messages
    if flash[:messages]
      flash[:messages].each do |type, msg|
        content_tag(:div, msg, class: "alert alert-#{type}")
      end
    end
  end
end

