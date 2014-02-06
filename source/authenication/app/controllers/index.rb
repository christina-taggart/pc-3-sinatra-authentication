require 'debugger'
require 'sinatra/flash'

enable :session

before do
  if session[:id]
    @current_user = User.find(session[:id])
  else
    @current_user = nil
  end
end

get '/' do
  @users = User.all if session[:id]
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do

  if session[:id] == nil
    @login_error = flash[:errors]
    @email = params[:email]
    erb :sign_in
  else
    redirect '/'
  end
end

post '/sessions' do
  @password = Digest::SHA256.hexdigest(params[:password])
  if User.validate(params, @password)
    session[:id] = User.find_by_email(params[:email]).id
    redirect '/'
  else
    flash[:errors] = "Your email or passsword was incorrect"
    redirect '/sessions/new?email=' + params[:email]
  end

end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  if session[:id] == nil
    @errors = flash[:errors]
    @name = flash[:name] #params[:name]
    @email = flash[:email] #params[:email]
    erb :sign_up
  else
    redirect '/'
  end
end

post '/users' do
  @user = User.new(name: params[:name], email: params[:email], password_hash: params[:password])
  if @user.save
    session[:id] = @user.id
    @current_user = User.find(session[:id])
    redirect '/'
  else
    flash[:errors] = @user.errors.full_messages
    flash[:name] = params[:name]
    flash[:email] = params[:email]
    redirect '/users/new'
    # redirect '/users/new?name=' + params[:name] + '&email=' + params[:email]
  end
end
