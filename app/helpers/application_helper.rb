module ApplicationHelper

  def full_title(page_title = '')
    base_title = "OnSen!"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def current_user?(user)
    user == current_user
  end

  def header_link_item(name, path)
    class_name = "nav-item"
    class_name << " active" if current_page?(path)

    content_tag :li, class: class_name do
      link_to name, path, class: "nav-link"
    end
  end
end
