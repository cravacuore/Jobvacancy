class WrongPasswordError < RuntimeError
  
  def initialize(attempts)
    super('Wrong password. You have ' + attempts + ' attempts more')
  end

end