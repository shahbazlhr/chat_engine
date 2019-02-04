class UserDashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		@heading = "Its users dashboard"
		@admins = SuperAdmin.all
		@users = User.where.not(id: current_user.id)
	end
end
