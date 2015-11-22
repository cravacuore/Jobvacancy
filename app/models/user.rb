require_relative '../exceptions/non_existing_user_error'
require_relative '../exceptions/wrong_password_error'
require_relative '../exceptions/blocked_account_error'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :crypted_password, String
  property :email, String
  property :attempts, Integer, :default => 0
  property :blocked, Boolean, :default => false
  property :time_of_block, Time
  has n, :job_offers

  validates_presence_of :name
  validates_presence_of :crypted_password
  validates_presence_of :email
  validates_format_of   :email,    :with => :email_address

  def password= (password)
    self.crypted_password = ::BCrypt::Password.create(password) unless password.nil?  
  end

  def self.authenticate(email, password)
    user = User.validate_account(email)
    user.check_blocked
    user.validate_password(password)
    user.attempts = 0
    user.save
    user
  end

  def check_blocked
    if self.attempts == 3 || self.blocked
      self.blocked = true
      self.time_of_block = Time.new(Time.now.year, Time.now.month, Time.now.day)
      self.save
      raise BlockedAccountError.new 
    end
  end

  def self.validate_account(email)
    user = User.find_by_email(email)
    raise NonExistingUserError.new if user.nil?
    user 
  end

  def validate_password(password)
    wrong_password! unless has_password?(password)
  end

  def wrong_password!
    self.attempts = self.attempts + 1
    self.save
    self.check_blocked
    raise WrongPasswordError.new((3 - attempts).to_s)
  end

  def has_password?(password)
    ::BCrypt::Password.new(crypted_password) == password
  end

end