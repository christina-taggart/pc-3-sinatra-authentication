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
  erb :sign_in
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
    new_user = User.new(name: params[:name], email: params[:email],
                      password: params[:password])
  if new_user.save
    @user_created = true
    erb :index
  else
    @signup_error = true
    erb :signup
  end

end
