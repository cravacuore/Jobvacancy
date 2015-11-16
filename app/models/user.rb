require_relative '../../app/exceptions/non_existing_user_error'
require_relative '../../app/exceptions/wrong_password_error'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :crypted_password, String
  property :email, String
  property :attempts, Integer, :default => 0
  has n, :job_offers

  validates_presence_of :name
  validates_presence_of :crypted_password
  validates_presence_of :email
  validates_format_of   :email,    :with => :email_address

  def password= (password)
    self.crypted_password = ::BCrypt::Password.create(password) unless password.nil?  
  end

  def self.authenticate(email, password)
    User.is_blocked?(email)
    user = User.authenticate_account(email)
    user.authenticate_password(password, user)  
  end

  def self.authenticate_account(email)
    user = User.find_by_email(email)
    raise NonExistingUserError.new if user.nil?
    user
  end

  def self.is_blocked?(email)
    self.attempts.primitive == 3
  end

  def has_password?(password)
    ::BCrypt::Password.new(crypted_password) == password
  end

  def authenticate_password(password, user)
    user = has_password?(password)? user : nil
    invalid_password if user.nil?
    user
  end

  def invalid_password
    self.attempts = self.attempts + 1

    raise WrongPasswordError.new
  end

end
