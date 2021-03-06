JobVacancy::App.controllers :job_offers do
  
  get :my do
    @offers = JobOffer.find_by_owner(current_user)
    render 'job_offers/my_offers'
  end    

  get :index do
    @offers = JobOffer.all_active
    render 'job_offers/list'
  end  

  get :new do
    @job_offer = JobOffer.duplicate(session[:job_offer]) || JobOffer.new
    session[:job_offer] = nil
    render 'job_offers/new'
  end

  get :latest do
    @offers = JobOffer.all_active
    render 'job_offers/list'
  end

  get :edit, :with =>:offer_id  do
    @job_offer = JobOffer.get(params[:offer_id])
    # TODO: validate the current user is the owner of the offer
    render 'job_offers/edit'
  end

  get :apply, :with =>:offer_id  do
    @job_offer = JobOffer.get(params[:offer_id])
    @job_application = JobApplication.new
    # TODO: validate the current user is the owner of the offer
    render 'job_offers/apply'
  end

  post :search do
    @offers = JobOffer.all_contains("%#{params[:q]}%")
    render 'job_offers/list'
  end

  post :apply, :with => :offer_id do
    @job_offer = JobOffer.get(params[:offer_id])

    email = params[:job_application][:applicant_email]
    name = params[:job_application][:applicant_name]
    cv_link = params[:job_application][:applicant_cv_link]    
    
    begin    
      @job_application = JobApplication.create_for(email, name, cv_link, @job_offer)

    rescue EmptyFieldsError => e  
      # TODO: Extract to a method
      session[:previous_url] = request.fullpath
      flash[:error] = e.message
      redirect_to session[:previous_url]        
    
    rescue WrongEmailAdressError => e  

      session[:previous_url] = request.fullpath
      flash[:error] = e.message
      redirect_to session[:previous_url]        
    end
    
    @job_application.process

    flash[:success] = 'Contact information sent.'
    redirect '/job_offers'
  end

  post :create do
    @job_offer = JobOffer.new(params[:job_offer])
    @job_offer.owner = current_user
    if @job_offer.save
      if params['create_and_twit']
        TwitterClient.publish(@job_offer)
      end
      flash[:success] = 'Offer created'
      redirect '/job_offers/my'
    else
      flash.now[:error] = 'Title is mandatory'
      render 'job_offers/new'
    end  
  end

  post :update, :with => :offer_id do
    @job_offer = JobOffer.get(params[:offer_id])
    @job_offer.update(params[:job_offer])
    if @job_offer.save
      flash[:success] = 'Offer updated'
      redirect '/job_offers/my'
    else
      flash.now[:error] = 'Title is mandatory'
      render 'job_offers/edit'
    end  
  end

  get :finalize, :with =>:offer_id  do
    @job_offer = JobOffer.find_by_id(params[:offer_id])
    render 'job_offers/finalize'
  end

  put :finalize, :with => :offer_id do
    @job_offer = JobOffer.get(params[:offer_id])
    @job_offer.deactivate
    @job_offer.reason = params[:reason]
    if @job_offer.save
      flash[:success] = 'Offer finalized with ' + params[:reason]
      redirect '/job_offers/my'
    else
      flash.now[:error] = 'Operation failed'
      redirect '/job_offers/my'
    end
  end

  delete :destroy do
    @job_offer = JobOffer.get(params[:offer_id])
    if @job_offer.destroy
      flash[:success] = 'Offer deleted'
    else
      flash.now[:error] = 'Title is mandatory'
    end
    redirect 'job_offers/my'
  end

  get :duplicate do
    session[:job_offer] = JobOffer.find_by_id(params[:offer_id])
    redirect 'job_offers/new'
  end

  get :report do
    @report = Report.new
    render 'job_offers/report'
  end
  
end
