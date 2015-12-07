class Report

  # This method looks in the db for offers finalized.
  def offers_finalized
    JobOffer.all
  end

  # This method counts the number of offers finalized by reason.
  def count(reason)
    offers_finalized.count(:reason => reason)
  end

  def count_finalized_without_candidate
    count('Hiring open')
  end

  def count_finalized_with_site_candidate
    count('Hiring in this site')
  end

  def count_finalized_with_other_site_candidate
    count('Hiring in other site')
  end

end