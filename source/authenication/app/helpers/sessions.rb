helpers do

	def current_user
        # TODO: return the current user if there is a user signed in.
        # @user = User.find_by_email(params[:email])
       if @user.password == params[:password]
       		@user.name
       	end
    end


    def create
    	@user = User.new(params[:user])
    	@user.password = params[:password]
    	@user.save!
    end

    def login
    	@user = User.find_by_email(params[:email])
    	if @user.password == params[:password]
    		give_token
    	else
    		redirect_to home_url
    	end
    end


end
