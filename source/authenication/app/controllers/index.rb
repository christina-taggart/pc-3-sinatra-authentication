enable :sessions
include BCrypt

get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  session[:message] = nil
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
	login
  # sign-in
end

delete '/sessions' do
	session[:logged_in] = false
	erb :index
  # sign-out -- invoked 
end

#----------- USERS -----------

get '/users/new' do

  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user

  def create
    @user = User.new(params[:user])
    @user.password = params[:user][:password]
    @user.save!
  end

  create

end
