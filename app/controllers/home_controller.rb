class HomeController < ActionController::Base

	before_filter :initialize

	def initialize
		@root = '/'
	end

	def home()
	end

end