class BlockedAccountError < RuntimeError
  
  def initialize(msg = 'Account has been blocked for 24 hours')
    super(msg)
  end

end