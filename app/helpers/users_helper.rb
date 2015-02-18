module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.username)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
  end
  
  def full_name(user)
     user.last_name+", "+user.first_name
  end
  
  def username(user)
     (user.last_name.gsub(/[^0-9a-z]/i, '')+"."+user.first_name.gsub(/[^0-9a-z]/i, '')).downcase
  end

end
