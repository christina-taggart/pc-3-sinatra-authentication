enable :sessions
require 'bcrypt'

get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password] #check with the encryption
    session[:id] = @user.id
    redirect '/'
  else
    print "wrong password"
    p params
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked
  session[:id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  @user = User.new(params[:user])
  @user.password = params[:user][:password]
  @user.save!
  redirect '/'
end





