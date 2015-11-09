class JobApplication

  attr_accessor :applicant_email, :applicant_name, :applicant_cv_link
  attr_accessor :job_offer

  def self.create_for(*args, offer)
    app = JobApplication.new
    
    raise 'All fields are mandatory' if args[0].empty? || args[1].empty? || args[2].empty?
    raise 'Wrong email adress' unless args[0].include? "@" && ".com"
    
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
