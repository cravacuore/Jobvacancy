class LockedAccountError < RuntimeError
  
  def initialize(msg = 'Account has been locked for 24 hours')
    super(msg)
  end

end