class Report

  # This method looks in the data base for offers finalized by reason.
  def self.offers_finalized_by(reason)
    JobOffer.all(:reason => reason).size
  end

end
