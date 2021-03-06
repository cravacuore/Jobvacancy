require 'spec_helper'

describe JobOffer do

    describe 'model' do

      subject { @job_offer = JobOffer.new }

      it { should respond_to( :id) }
      it { should respond_to( :title ) }
      it { should respond_to( :location) }
      it { should respond_to( :description ) }
      it { should respond_to( :benefits ) }
      it { should respond_to( :owner ) }
      it { should respond_to( :owner= ) }
      it { should respond_to( :created_on) }
      it { should respond_to( :updated_on ) }
      it { should respond_to( :is_active) }

    end

    describe 'valid?' do

      let(:job_offer) { JobOffer.new }

      it 'should be false when title is blank' do
        puts job_offer.owner
        expect(job_offer.valid?).to eq false
      end

    end

    describe 'deactive_old_offers' do

      let(:today_offer) do
        today_offer = JobOffer.new
        today_offer.updated_on = Date.today
        today_offer
      end

      let(:thirty_day_offer) do
        thirty_day_offer = JobOffer.new
        thirty_day_offer.updated_on = Date.today - 45
        thirty_day_offer
      end

      it 'should deactivate offers updated 45 days ago' do
        JobOffer.should_receive(:all).and_return([thirty_day_offer])
        JobOffer.deactivate_old_offers
        expect(thirty_day_offer.is_active).to eq false
      end

      it 'should not deactivate offers created today' do
        JobOffer.should_receive(:all).and_return([today_offer])
        JobOffer.deactivate_old_offers
        expect(today_offer.is_active).to eq true
      end
    end

	describe 'search all fields' do

		let(:offer) do
			offer = JobOffer.new
			offer.title = "Programmer Ruby"
			offer.location = "Quilmes"
			offer.description = "Good ambient job"
			offer
		end
		
	  it 'should search for Location, show the job offer with Location Quilmes' do
	  	JobOffer.should_receive(:all_contains).and_return([offer])
			offers = JobOffer.all_contains("Quilmes")
			expect(offers.include? offer).to eq true
	  end

	  it 'should search for Location, show the job offer with Location Quilmes' do
	  	JobOffer.should_receive(:all_contains).and_return([offer])
			offers = JobOffer.all_contains("Ruby")
			expect(offers.include? offer).to eq true
	  end

	  it 'should search for Location, show the job offer with Location Quilmes' do
	  	JobOffer.should_receive(:all_contains).and_return([offer])
			offers = JobOffer.all_contains("ambient")
			expect(offers.include? offer).to eq true
	  end

	end

  describe 'offer finalized' do

    let(:offer) do
      offer = JobOffer.new
      offer.title = "Java development"
      offer.location = "La Plata"
      offer
    end

    it 'should finalize the offer with deactivate, offer.is_active? --> false' do
      offer.deactivate
      expect(offer.is_active).to eq false
    end

    it 'should finalize the offer for open position' do
      offer.deactivate
      offer.set_reason('open position')
      expect(offer.reason).to eq 'open position'
    end
  end

  describe 'duplicate' do

    let(:offer) do
      offer = JobOffer.new
      offer.title = "Java development"
      offer.location = "La Plata"
      offer.benefits = "Gym"
      offer.description = ""
      offer
    end
    
    it 'should return a copy when job_offer is not nil' do
      expect(JobOffer.duplicate(offer)).to eq offer
    end

    it 'should return nil when job_offer is nil' do
      expect(JobOffer.duplicate(nil)).to eq false
    end
  end

end
