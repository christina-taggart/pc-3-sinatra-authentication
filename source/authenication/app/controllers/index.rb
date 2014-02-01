enable :sessions

get '/' do
  if signed_in?
    @users = User.all
  else
    @users = []
  end
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  redirect_to_proper_page
end

delete '/sessions/:id' do
  sign_out
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  user = User.new(params[:user])
end
