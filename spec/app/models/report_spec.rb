require 'spec_helper'

describe Report do

  #['Hiring open', 'Hiring in this site', 'Hiring in other site']
  describe '#offers_finalized_by(reason)' do

    it 'should return 0 when looking for "Hiring open"' do
      Report.should_receive(:offers_finalized_by).with("Hiring open").and_return(0)

      expect(Report.offers_finalized_by('Hiring open')).to eq 0
    end
  end

end
