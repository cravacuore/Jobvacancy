class WrongEmailAdressError < RuntimeError
  
  def initialize(msg = 'Wrong email adress')
    super(msg)
  end

end