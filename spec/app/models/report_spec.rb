require 'spec_helper'

describe Report do

  describe 'count finalized offers' do
    
    let(:jo1) {JobOffer.new(:reason => 'Hiring open')}
    let(:jo2) {JobOffer.new(:reason => 'Hiring open')}
    let(:jo3) {JobOffer.new(:reason => 'Hiring in this site')}
    let(:jo4) {JobOffer.new(:reason => 'Hiring in other site')}

    let (:report) { Report.new }

    it 'When ask for offers finalized without candidates should return 2' do
      report.should_receive(:count_finalized_without_candidate).and_return(2)

      expect(report.count_finalized_without_candidate).to eq 2
    end

    it 'When ask for offers finalized with candidates from the site should return 1' do
      report.should_receive(:count_finalized_with_site_candidate).and_return(1)

      expect(report.count_finalized_with_site_candidate).to eq 1
    end

    it 'When ask for offers finalized with candidates from other site should return 1' do
      report.should_receive(:count_finalized_with_other_site_candidate).and_return(1)

      expect(report.count_finalized_with_other_site_candidate).to eq 1
    end

  end

end
