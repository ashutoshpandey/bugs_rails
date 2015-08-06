class HomeController < ActionController::Base
	before_filter :initFilter


	layout 'standard'

	def initFilter
		@root = 'http://0.0.0.0:3000'
	end

	def home()
	end

end