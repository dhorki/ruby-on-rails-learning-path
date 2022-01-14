module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_messages', :locals => {:object => object})
  end

  def image_placeholder(image_url, size, placeholder_text = '')
    image_url && image_url.length > 0 ? image_tag(image_url, :size => size, :alt => image_url) : content_tag(:span, placeholder_text)
  end

  def user_logged_in?
    !session[:user_id].nil?
  end

end
