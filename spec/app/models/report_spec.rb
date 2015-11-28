require 'spec_helper'

describe Report do

  let(:report) { Report.new }

  #['Hiring open', 'Hiring in this site', 'Hiring in other site']
  describe '#offers_finalized_by("Hiring open") ' do
   
    it 'should NO SE QUE IRA ACA' do
      expect(report.offers_finalized_by("Hiring open")).to eq 0
    end
  end

end
