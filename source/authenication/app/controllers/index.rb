get '/' do
  @users= User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  redirect '/'
end

delete '/sessions/:id' do
  # sign-out -- invoked
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  User.create(name: params[:name], email: params[:email], password_hash: BCrypt::Password.create(params[:password],cost: 5))
  erb :sign_in
end
