require 'spec_helper'

describe Report do

  describe '#offers_finalized_by(reason)' do

    it 'should return 0 when looking for "Hiring open"' do
      Report.should_receive(:offers_finalized_by).with('Hiring open').and_return(0)

      expect(Report.offers_finalized_by('Hiring open')).to eq 0
    end

    it 'should return 0 when looking for "Hiring in this site"' do
      Report.should_receive(:offers_finalized_by).with('Hiring in this site').and_return(0)

      expect(Report.offers_finalized_by('Hiring in this site')).to eq 0
    end

    it 'should return 0 when looking for "Hiring in other site"' do
      Report.should_receive(:offers_finalized_by).with('Hiring in other site').and_return(0)

      expect(Report.offers_finalized_by('Hiring in other site')).to eq 0
    end
  end

end
