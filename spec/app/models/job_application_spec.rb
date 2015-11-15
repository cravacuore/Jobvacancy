require 'spec_helper'
require_relative '../../../app/exceptions/wrong_email_adress_error'
require_relative '../../../app/exceptions/empty_fields_error'

describe JobApplication do

  let(:email){'applicant@test.com'}
  let(:name){'Mr. Foo'}
  let(:cv_link){'http://link-to-my-cv.html'}

  describe 'model' do
    subject { @job_offer = JobApplication.new }

    it { should respond_to( :applicant_email ) }
    it { should respond_to( :applicant_name ) }
    it { should respond_to( :applicant_cv_link ) }
    it { should respond_to( :job_offer) }
  end


  describe 'create_for' do
    it 'should set job_offer' do
      ja = JobApplication.create_for(email, name, cv_link, JobOffer.new)
      ja.applicant_email.should eq email
      ja.applicant_name.should eq name
      ja.applicant_cv_link.should eq cv_link
    end

    it 'should raise "All fields are mandatory"' do
      offer = JobOffer.new
      expect{ JobApplication.create_for(email, '', '', offer) }.
          to raise_error(EmptyFieldsError)
    end

    it 'should raise "Wrong email adress"' do
      offer = JobOffer.new
      expect{ JobApplication.create_for('wrong email', name, cv_link, offer) }.
          to raise_error(WrongEmailAdressError)

      expect{ JobApplication.create_for('wrong@email', name, cv_link, offer) }.
          to raise_error(WrongEmailAdressError)
    end
  end


  describe 'process' do
    let(:job_application) { JobApplication.new }

    it 'should deliver contact info notification' do
      ja = JobApplication.create_for(email, name, cv_link ,JobOffer.new)
      JobVacancy::App.should_receive(:deliver).with(:notification, :contact_info_email, ja)
      ja.process
    end
  end

  describe 'strong password' do
    it 'password with one letter uppercase, lowercase, one number and length >= 6 its ok' do
      expect(JobApplication.correctPasswd('Itsok1')).to eq true
    end

    it 'password with one letter uppercase, lowercase, one number and length < 6 fail' do
      expect(JobApplication.correctPasswd('Dont1')).to eq false
    end

    it 'password with one letter uppercase, lowercase, zero number and length >= 6 fail' do
      expect(JobApplication.correctPasswd('Itsbad')).to eq false
    end

    it 'password with one letter uppercase, without lowercase, one number and length >= 6 fail' do
      expect(JobApplication.correctPasswd('1WRONG')).to eq false
    end

    it 'password without uppercase, with lowercase, one number and length >= 6 fail' do
      expect(JobApplication.correctPasswd('isb3ad')).to eq false
    end

    it 'password without uppercase, lowercase, with numbers and length >= 6 fail' do
      expect(JobApplication.correctPasswd('123456')).to eq false
    end
    
    it 'password without uppercase, with lowercase, without numbers and length >= 6 fail' do
      expect(JobApplication.correctPasswd('itsbad')).to eq false
    end

    it 'password with uppercase, without lowercase, without numbers and length >= 6 fail' do
      expect(JobApplication.correctPasswd('ITSBAD')).to eq false
    end

    it 'password empty fail' do
      expect(JobApplication.correctPasswd('')).to eq false
    end

    it 'password with only spaces fails' do
      expect(JobApplication.correctPasswd('      ')).to eq false
    end
  end

end
