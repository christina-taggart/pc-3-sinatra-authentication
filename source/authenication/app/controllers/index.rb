enable :sessions


before do
	current_user ? true : false
 end


get '/' do
  if session[:id]
  @user = User.find(session[:id])
  @users = User.all 
	end
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  p params
  p params[:password]
  if @user.password == params[:password]
  	puts "Success!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  	session[:id] = @user.id
  else
  	session[:id] = nil
  	puts "ERORRRRR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  end
  redirect '/'
end

delete '/sessions/:id' do
  session[:id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
    @user = User.new(name: params[:user][:name], email: params[:user][:email] )
    @user.password = params[:user][:password]
    @user.save
    redirect 'sessions/new'
end
