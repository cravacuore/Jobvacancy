require 'spec_helper'
require 'byebug'
require_relative '../../../app/exceptions/non_existing_user_error'
require_relative '../../../app/exceptions/wrong_password_error'

describe User do

	describe 'model' do

		subject { @user = User.new }

		it { should respond_to( :id) }
		it { should respond_to( :name ) }
		it { should respond_to( :crypted_password) }
		it { should respond_to( :email ) }
		it { should respond_to( :job_offers ) }
		it { should respond_to( :attempts ) }

	end

	describe 'valid?' do

	  let(:user) { User.new }

	  it 'should be false when name is blank' do
	  	user.email = 'john.doe@someplace.com'
	  	user.password = 'a_secure_passWord!'
	  	expect(user.valid?).to eq false
	  end


	  it 'should be false when email is not valid' do
	  	user.name = 'John Doe'
	  	user.email = 'john'
	  	user.password = 'a_secure_passWord!'
	  	expect(user.valid?).to eq false
	  end

	  it 'should be false when password is blank' do
	  	user.name = 'John Doe'
	  	user.email = 'john.doe@someplace.com'
	  	expect(user.valid?).to eq false
	  end

	  it 'should be true when all field are valid' do
	  	user.name = 'John Doe'
	  	user.email = 'john.doe@someplace.com'
	  	user.password = 'a_secure_passWord!'
	  	expect(user.valid?).to eq true
	  end

	end

	describe 'authenticate' do

		before do
		 	@user = User.new
		 	@user.email = 'john.doe@someplace.com'
		 	@user.password = 'Passw0rd'
		end

		it 'should raise NonExistingUserError when email do not match' do
			email = 'wrong@email.com'
			User.should_receive(:find_by_email).with(email).and_return(nil)
			expect{ User.authenticate(email, 'Passw0rd') }.
          to raise_error(NonExistingUserError)
		end

		it 'should raise WrongPasswordError when password do not match' do
			email = @user.email
			password = 'wrong_password'
			User.should_receive(:find_by_email).with(email).and_return(@user)
			expect{ User.authenticate(email, password) }.
          to raise_error(WrongPasswordError)
		end

		it 'should incremenet attempts when password do not match' do
			email = @user.email
			password = 'wrong_password'
			
			User.should_receive(:find_by_email).with(email).and_return(@user)
      user = User.find_by_email(email)
      
      expect(user.attempts).to be 0
			User.should_receive(:find_by_email).with(email).and_return(@user)
			expect{ User.authenticate(email, password) }.
          to raise_error(WrongPasswordError)
      expect(user.attempts).to be 1
		end

		it 'should return the user when email and password match' do
			email = @user.email
			User.should_receive(:find_by_email).with(email).and_return(@user)
			User.authenticate(email, 'Passw0rd').should eq @user
		end

	end

end