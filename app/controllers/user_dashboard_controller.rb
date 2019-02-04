class UserDashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		@heading = "Its users dashboard"
	end
end
