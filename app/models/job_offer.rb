class JobOffer
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :title, String
  property :location, String
  property :description, String
  property :benefits, String
  property :created_on, Date
  property :updated_on, Date

  property :reason, String

  property :is_active, Boolean, :default => true
  belongs_to :user

  validates_presence_of :title

  def owner
    user
  end

  def owner=(a_user)
    self.user = a_user
  end

  def self.all_active
    JobOffer.all(:is_active => true)
  end

  def self.all_contains(query)
    return JobOffer.all(:title.like => query) | JobOffer.all(:location.like => query) | JobOffer.all(:description.like => query)
  end

  def self.find_by_owner(user)
    JobOffer.all(:user => user)
  end

  def self.deactivate_old_offers
    active_offers = JobOffer.all(:is_active => true)

    active_offers.each do | offer |
      if (Date.today - offer.updated_on) >= 30
        offer.deactivate
        offer.save
      end
    end
  end

  def self.duplicate(offer)
    return false unless offer 

    job_offer = JobOffer.new
    job_offer.title = offer.title
    job_offer.location = offer.location
    job_offer.description = offer.description
    job_offer.benefits = offer.benefits
    job_offer
  end

  def activate
    self.is_active = true
    self.set_reason("")
  end

  def deactivate
    self.is_active = false
  end

  def set_reason(r)
    self.reason = r
  end

end
