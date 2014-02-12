
#----------- SESSIONS -----------

enable :sessions

get '/' do
 @users = User.all
 erb :index
end

get '/sessions/new' do 
  erb :sign_in
end

post '/sessions' do 
  @user = User.find_by_email(params[:email])
  if session[:id] = @user.id 
     session[:logged_in] = true
  redirect '/'
  end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end


post '/users' do
  @user = User.create(name: params[:name], email: params[:email], password_hash: BCrypt::Password.create(params[:password],cost: 5))
  session[:id] = @user.id
  redirect '/'
end
end
