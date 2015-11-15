class JobApplication

  attr_accessor :applicant_email, :applicant_name, :applicant_cv_link
  attr_accessor :job_offer

  def self.create_for(*args, offer)
    app = JobApplication.new
    app.check_fields(args[0], args[1], args[2])
    app.check_email(args[0])

    app.applicant_email = args[0]
    app.applicant_name = args[1]
    app.applicant_cv_link = args[2]
    app.job_offer = offer
    app
  end

  def process
    JobVacancy::App.deliver(:notification, :contact_info_email, self)
  end

  def check_fields(*args)
    raise EmptyFieldsError if some_empty_field(args[0], args[1], args[2])
  end

  def some_empty_field(*args)
    args[0].empty? || args[1].empty? || args[2].empty?
  end

  def check_email(email)
    raise WrongEmailAdressError unless right_email email
  end

  def right_email(email)
    (email.include? "@") && (email.include? ".com")
  end

end
