class WrongPasswordError < RuntimeError
  
  def initialize(msg = 'Wrong password')
    super(msg)
  end

end