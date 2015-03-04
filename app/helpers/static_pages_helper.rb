module StaticPagesHelper
  
  def get_days_left
    today = Date.today
    wedding_date = Date.new(2015,7,30)
    days = (wedding_date - today).to_i
    "#{days} days until We Become One!!!"
  end
  
  def get_rsvp(option)
     if get_yes_options.include?(option)
        flash[:success] = "We are delighted to have you with us!"
        true
     elsif get_no_options.include?(option)
        flash[:success] = "We will definitely miss you!"
        false
     end
  end
  
  def get_yes_options
     rsvp_options = ["I'll Be There In Person :)", "I have my outfit ready :)"]
  end
  
  def get_no_options
     rsvp_options = ["I'll Be There In Spirit :(", "I broke my ankle and will miss it :("]
  end
  
  def get_options
     rsvp_options = get_yes_options
     rsvp_options.concat(get_no_options)
  end

end
