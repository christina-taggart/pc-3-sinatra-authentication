before do
  @users = User.all
end

get '/' do
  erb :index
end

#----------- SESSIONS -----------
get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  p "---------------"
  p @user.password
  p params[:password]

  p ".................."
  if !@user.nil? && @user.check(params[:password])
    p session[:id] = @user.id
    erb :index
  else
    session.clear
    erb :index
  end
end

delete '/sessions/:id' do
  session.clear
  redirect '/'
end

post '/sessions/:id' do
end
#----------- USERS -----------
get '/users/new' do
  erb :sign_up
end

post '/users' do
  new_user = User.new(params[:user])
  p new_user.password=params[:password]
  new_user.save
  redirect '/'
end
