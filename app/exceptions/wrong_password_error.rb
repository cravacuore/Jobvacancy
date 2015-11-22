class WrongPasswordError < RuntimeError
  
  def initialize(attemps)
    super('Wrong password. You have ' + attemps + ' attemps more')
  end

end