get '/' do
  # render home page
 #TODO: Show all users if user is signed in
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
  erb :sign_in
end
