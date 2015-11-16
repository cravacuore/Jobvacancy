class BlockedAccountError < RuntimeError
  
  def initialize(msg = 'Wrong password, you has no more attemps. Account blocked for 24 hours')
    super(msg)
  end

end