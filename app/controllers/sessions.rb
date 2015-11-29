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
      flash[:error] = e.message
      redirect '/login'
    end
    sign_in @user
    if @user.is_admin
      flash[:success] = 'User administrator'
      redirect '/'
    else
      redirect '/'
    end
  end

  get :destroy, :map => '/logout' do 
    sign_out
    redirect '/'          
  end

end
