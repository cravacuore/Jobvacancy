require 'spec_helper'
require_relative '../../../app/exceptions/non_existing_user_error'
require_relative '../../../app/exceptions/wrong_password_error'
require_relative '../../../app/exceptions/blocked_account_error'

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
      @user = User.new(:email => 'john.doe@someplace.com', :password => 'Passw0rd')
    end

    it 'should raise NonExistingUserError when email do not match' do
      email = 'wrong@email.com'
      User.should_receive(:find_by_email).with(email).and_return(nil)
      expect{ User.authenticate(email, 'Passw0rd') }.to raise_error(NonExistingUserError)
    end

    it 'should raise WrongPasswordError when password do not match' do
      password = 'wrong_password'
      User.should_receive(:find_by_email).with(@user.email).and_return(@user)
      expect{ User.authenticate(@user.email, password) }.to raise_error(WrongPasswordError)
    end

    it 'should increments attempts when password do not match' do
      password = 'wrong_password'
      User.should_receive(:find_by_email).with(@user.email).and_return(@user)
      expect(@user.attempts).to be 0

      expect{ User.authenticate(@user.email, password) }.to raise_error(WrongPasswordError)
      expect(@user.attempts).to be 1
    end

    it 'should raise BlockedAccountError when password do not match 3 times consecutives' do
      password = 'wrong_password'

      User.should_receive(:find_by_email).with(@user.email).and_return(@user)
      expect{ User.authenticate(@user.email, password) }.to raise_error(WrongPasswordError)
      expect(@user.attempts).to be 1

      User.should_receive(:find_by_email).with(@user.email).and_return(@user)
      expect{ User.authenticate(@user.email, password) }.to raise_error(WrongPasswordError)
      expect(@user.attempts).to be 2

      User.should_receive(:find_by_email).with(@user.email).and_return(@user)
      expect{ User.authenticate(@user.email, password) }.to raise_error(BlockedAccountError)
      expect(@user.attempts).to be 3
    end

    it 'should return the user when email and password match' do
      User.should_receive(:find_by_email).with(@user.email).and_return(@user)
      User.authenticate(@user.email, 'Passw0rd').should eq @user
    end

    it 'should restart attempts when email and password match' do
      password = 'wrong_password'
      expect(@user.attempts).to be 0

      User.should_receive(:find_by_email).with(@user.email).and_return(@user)
      expect{ User.authenticate(@user.email, password) }.to raise_error(WrongPasswordError)
      expect(@user.attempts).to be 1

      User.should_receive(:find_by_email).with(@user.email).and_return(@user)
      User.authenticate(@user.email, 'Passw0rd').should eq @user
      expect(@user.attempts).to be 0
    end

    it 'should raise BlockedAccountError when trying singin after block account' do
      # TODO
    end
  end

end