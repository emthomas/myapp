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
  
  def table_url(table = nil)
    unless table.nil?
     pic = Picture.where("pictures.table_id=#{table.id} AND theme=#{current_user.theme}").first
	 unless pic.nil?
	    pic.url
     end
	end
  end
  
  def table_name(table = nil)
    unless table.nil?
     pic = Picture.where("pictures.table_id=#{table.id} AND theme=#{current_user.theme}").first
	 unless pic.nil?
	    pic.name
     end
	end
  end
  
  def get_theme(id = 0)
    id == 0 ? "beach" : "destination"
  end

  def guess_who_questions_count
     GuessWhoQuestion.count
  end
  
  def user_available_tables(tables = nil, user = nil)
    unless user.nil?
      tables.where("id != #{user}")
	end
	tables
  end
  
  def all_available_tables
    Table.joins("LEFT OUTER JOIN users on users.table_id = tables.id").group(:number).having("count(*)<max(capacity)")
  end
  
  def time_to_request
    start_time = Time.now
    end_time = (start_time + 1.day).beginning_of_day()
    
    seconds_diff = (start_time - end_time).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff

    #"#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
	"tomorrow"
  end
  
  def get_pretax_total(count=0, amount=0)
	 number_with_precision(count*amount, :precision => 2, :delimiter => ',')
  end
  
  def adult_cost
	70
  end
  
  def child_vendor_cost
	45
  end
  
  def adult_count
     User.where(is_coming: true).where(is_adult: true).count
  end
  
  def child_count
	User.where(is_coming: true).where(is_adult: false).count - vendor_count
  end
  
  def vendor_count
	4
  end
  
  def adult_total_cost
	adult_count*adult_cost
  end
  
  def child_total_cost
	child_count*child_vendor_cost
  end
  
  def vendor_total_cost
	vendor_count*child_vendor_cost
  end
  
  def subtotal
	adult_total_cost+child_total_cost+vendor_total_cost
  end
  
  def tax_amount
	subtotal * 0.08625
  end
  
  def after_tax_total
	subtotal + tax_amount
  end
  
  def deposit
	5000
  end
  
  def current_check
	11472.98
  end
  
  def balance
	after_tax_total - deposit - current_check
  end
  
  def format(amount=0)
    number_with_precision(amount, :precision => 2, :delimiter => ',')
  end
  
end
