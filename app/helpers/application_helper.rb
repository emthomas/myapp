module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Sam & Seb"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  def random_pic
    num = 1 + rand(12)
    "pic_#{num}.jpeg"
  end

end