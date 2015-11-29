require_relative '../exceptions/non_existing_user_error'
require_relative '../exceptions/wrong_password_error'
require_relative '../exceptions/locked_account_error'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :crypted_password, String
  property :email, String
  property :attempts, Integer, :default => 0
  property :date_of_lock, DateTime

  property :is_admin, Boolean, :default => false

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
    user.check_locked
    user.validate_password(password)

    user.set_admin(email, password)
    
    user.attempts = 0
    user.save
    user
  end

  def self.validate_account(email)
    user = User.find_by_email(email)
    raise NonExistingUserError.new if user.nil?
    user
  end

  def check_locked
    unlock if self.attempts == 3 && needUnlock?
    raise LockedAccountError.new if self.attempts == 3 && !needUnlock?
  end

  def needUnlock?
    DateTime.now >= self.date_of_lock.next_day
  end

  def unlock
    self.attempts = 0
  end

  def validate_password(password)
    wrong_password! unless has_password?(password)
  end

  def has_password?(password)
    ::BCrypt::Password.new(crypted_password) == password
  end

  def wrong_password!
    self.attempts = self.attempts + 1
    self.lockAccount?
    self.save
    raise WrongPasswordError.new((3 - attempts).to_s)
  end

  def lockAccount?
    if self.attempts == 3
      self.date_of_lock = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day)
      self.save
      raise LockedAccountError.new 
    end
  end

  def set_admin(email, password)
    if (email == 'admin@admin.com')&&(password == 'Admin123')
      self.is_admin = true
    end
  end

end