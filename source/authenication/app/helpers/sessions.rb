helpers do
	def current_user
        return false unless session[:id]
        User.find(session[:id])
    end
end
