enable :sessions
use Rack::Flash

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
  assign_user
  authorized_redirect('/', '/sessions/new')
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
  if user.valid?
    user.save
    assign_user
    sign_in
    redirect '/'
  else
    flash[:errors] = user.errors.messages
    redirect '/users/new'
  end
end
