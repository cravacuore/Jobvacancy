class EmptyFieldsError < RuntimeError
  
  def initialize(msg = 'All fields are mandatory')
    super(msg)
  end

end