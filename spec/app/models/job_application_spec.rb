require 'spec_helper'

describe JobApplication do

  describe 'model' do

    subject { @job_offer = JobApplication.new }

    it { should respond_to( :applicant_email ) }
    it { should respond_to( :applicant_name ) }
    it { should respond_to( :applicant_cv_link ) }
    it { should respond_to( :job_offer) }

  end


  describe 'create_for' do

    it 'should set applicant_email, name, and cv_link' do
      email = 'applicant@test.com'
      name = 'Mr. Foo'
      cv_link = 'http://link-to-my-cv.html'
      ja = JobApplication.create_for(email, name, cv_link, JobOffer.new)
      ja.applicant_email.should eq email
      ja.applicant_name.should eq name
      ja.applicant_cv_link.should eq cv_link
    end

    it 'should set job_offer' do
      offer = JobOffer.new
      ja = JobApplication.create_for('applicant@test.com', offer)
      ja.job_offer.should eq offer
    end

  end


  describe 'process' do

    let(:job_application) { JobApplication.new }

    it 'should deliver contact info notification' do
      ja = JobApplication.create_for('applicant@test.com', JobOffer.new)
      JobVacancy::App.should_receive(:deliver).with(:notification, :contact_info_email, ja)
      ja.process
    end

  end

end
