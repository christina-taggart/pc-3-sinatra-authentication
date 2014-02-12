get '/' do
 users = User.all
 @user_names = users.map do |user|
    user.name
  end
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user.password == params[:password]
    puts "SETTING"
    session[:id] = @user.id
  end
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
  @user = User.new(params[:user])
  @user.save!
  redirect '/'
end
