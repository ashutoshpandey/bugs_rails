class HomeController < ActionController::Base
	before_filter :initFilter


#	layout 'standard'

	def initFilter
		@root = '/'
	end

	def home()
			render layout: "standard"
	end

end