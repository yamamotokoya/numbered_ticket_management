module ApplicationHelper
  def flash_message
      flash.each do |type, message|
        content_tag(:div, message, class: "alert alert-#{type}")
      end
  end
end
