class HomeController < ActionController::Base
	layout 'standard'
	before_filter :initialize

	def initialize
		@root = '/'
	end

	def home()
	end

end