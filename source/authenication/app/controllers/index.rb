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
  @users = User.all
  @user = User.find_by_email(params[:email])
  session[:id] = @user.id
  login
  erb :index
end

delete '/sessions/:id' do
  session[:id] = nil
  redirect "/"
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  session[:id]= User.create(params[:user]).id
  redirect '/'

end
