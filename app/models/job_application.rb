class JobApplication

  attr_accessor :applicant_email, :applicant_name, :applicant_cv_link
  attr_accessor :job_offer

  def self.create_for(*args, offer)
    app = JobApplication.new
    app.applicant_email = args[0]
    app.applicant_name = args[1]
    app.applicant_cv_link = args[2]
    app.job_offer = offer
    app
  end

  def process
    JobVacancy::App.deliver(:notification, :contact_info_email, self)
  end

end
