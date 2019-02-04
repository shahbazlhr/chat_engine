class SuperAdminDashboardController < ApplicationController
	before_action :authenticate_super_admin!

	def index
		@heading = "Its admins dashboard"
		@admins = SuperAdmin.where.not(id: current_super_admin.id)
		@users = User.all
	end
end
