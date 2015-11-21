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
    user = User.find_by_email(email)

    raise NonExistingUserError if user.nil?
    user.has_password?(password)
  end

  def has_password?(password)
    unless ::BCrypt::Password.new(crypted_password) == password
      #attempts = attempts + 1
      raise WrongPasswordError 
    end 
    self
  end

end