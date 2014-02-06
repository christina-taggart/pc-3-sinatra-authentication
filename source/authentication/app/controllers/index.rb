

#----------- SESSIONS -----------

enable :sessions

get '/' do
 @users = User.all
 erb :index
end

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
  session[:logged_in] = true
  session[:user_name] = params[:email]
  redirect '/'
end

post '/sessions' do 
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    session[:logged_in] = true
    session[:user_name] = params[:email]
  end
  redirect '/'
end

delete '/sessions/:id' do
  # sign-out -- invoked
  session[:logged_in] = false 
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  User.create(params[:user])
  redirect '/'
end



