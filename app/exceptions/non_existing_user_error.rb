class NonExistingUserError < RuntimeError
  
  def initialize(msg = 'Invalid credentials')
    super(msg)
  end

end