class User < ActiveRecord::Base
  belongs_to :table

  attr_accessor :remember_token
  attr_accessor :activation_token
  attr_accessor :view_as_guest
  
  before_save do 
  	self.email = email.downcase if !email.nil?
  	self.email = nil if (!email.nil? && email.empty?)
    self.address = nil if (!address.nil? && address.empty?)
  	self.username = (last_name.gsub(/[^0-9a-z]/i, '')+"."+first_name.gsub(/[^0-9a-z]/i, '')).downcase
  end
  
  before_create :create_activation_digest
  
  after_create do 
  	self.username = (last_name.gsub(/[^0-9a-z]/i, '')+"."+first_name.gsub(/[^0-9a-z]/i, '')).downcase
  end
  
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    allow_blank: true

  validates :address, length: { maximum: 255 }, allow_blank: true
                   
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  def has_default_pass?
  	return self.authenticate('password') == self
  end
  
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  # Activates an account.
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end
  
  # Deactivates an account.
  def deactivate
    update_attribute(:activated, false)
    update_attribute(:activated_at, Time.zone.now)
    self.password = "password"
    self.password_confirmation = "password"
    self.save
    
  end

  def increment_login
    if !self.last_login? || self.last_login < Date.today
       increment!(:logins)
       update_attribute(:last_login, Date.today)
    end
  end

  def get_answered_questions_count
    GuessWhoUserAnswer.where(:user_id => self.id).count
  end

  def get_guess_who_right_answers_count
    GuessWhoUserAnswer.where(:user_id => self.id).joins("JOIN guess_who_questions ON guess_who_questions.id = guess_who_user_answers.guess_who_question_id AND guess_who_questions.answer = guess_who_user_answers.answer").count
  end
  
  def set_is_adult
    update_attribute(:is_adult, true)
  end
  
  def set_is_not_adult
    update_attribute(:is_adult, false)
  end

  def untable 
    update_attribute(:table_id, nil)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  
  def view_as_guest?
	  if self.view_as_guest.nil?
		self.view_as_guest = true
	  end
	  return self.view_as_guest
  end
  
  def set_view_as_guest(option)
  	self.view_as_guest = option
  end
  
  def get_table
    if self.table
       self.table.number
    end
  end  	
  private
	
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase unless email.nil?
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
  
end
