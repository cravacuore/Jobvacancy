require 'spec_helper'

describe Checker do

  describe 'strong password' do
    it 'password with one letter uppercase, lowercase, one number and length >= 6 its ok' do
      expect(Checker.correctPasswd('Itsok1')).to eq true
    end

    it 'password with one letter uppercase, lowercase, one number and length < 6 fail' do
      expect(Checker.correctPasswd('Dont1')).to eq false
    end

    it 'password with one letter uppercase, lowercase, zero number and length >= 6 fail' do
      expect(Checker.correctPasswd('Itsbad')).to eq false
    end

    it 'password with one letter uppercase, without lowercase, one number and length >= 6 fail' do
      expect(Checker.correctPasswd('1WRONG')).to eq false
    end

    it 'password without uppercase, with lowercase, one number and length >= 6 fail' do
      expect(Checker.correctPasswd('isb3ad')).to eq false
    end

    it 'password without uppercase, lowercase, with numbers and length >= 6 fail' do
      expect(Checker.correctPasswd('123456')).to eq false
    end

    it 'password without uppercase, with lowercase, without numbers and length >= 6 fail' do
      expect(Checker.correctPasswd('itsbad')).to eq false
    end

    it 'password with uppercase, without lowercase, without numbers and length >= 6 fail' do
      expect(Checker.correctPasswd('ITSBAD')).to eq false
    end

    it 'password empty fail' do
      expect(Checker.correctPasswd('')).to eq false
    end

    it 'password with only spaces fails' do
      expect(Checker.correctPasswd('      ')).to eq false
    end
  end

end
