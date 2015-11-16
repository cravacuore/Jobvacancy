JobVacancy::App.controllers :sessions do
  
  get :login, :map => '/login' do
    @user = User.new
    render 'sessions/new'
  end

  post :create do
    email = params[:user][:email]
    password = params[:user][:password]
    begin
      @user = User.authenticate(email, password)          

    rescue RuntimeError => e 
      @user = User.new
      flash[:error] = e.message
      redirect '/login'
    end
    sign_in @user
    redirect '/'
  end

  get :destroy, :map => '/logout' do 
    sign_out
    redirect '/'          
  end

end
