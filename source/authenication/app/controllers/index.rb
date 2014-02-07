get '/' do
  # render home page
 #TODO: Show all users if user is signed in
 	@users = User.all
 	@user = User.last
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
  redirect "/"
end

delete '/sessions/:id' do
  # sign-out -- invoked 
  redirect "/"
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  user = params[:user]
  pass = user.delete(:password)
  @user = User.new(user)
  @user.password = pass
  if @user.save
  	redirect "/"
  else
  	redirect back
  end
end
