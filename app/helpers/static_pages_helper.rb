module StaticPagesHelper
  
  def get_days_left
    today = Date.today
    wedding_date = Date.new(2015,7,30)
    days = (wedding_date - today).to_i
    "#{days} days until We Become One!!!"
  end

end
