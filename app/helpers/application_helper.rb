module ApplicationHelper
  def user_login_password
    a = '2230959583'

    a
  end

  def icon(icon_text)
    content_tag(:i, "", class:"#{icon_text}")
  end
end
