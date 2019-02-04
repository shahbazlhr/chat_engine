class SuperAdminDashboardController < ApplicationController
	before_action :authenticate_super_admin!

	def index
		@heading = "Its admins dashboard"
	end
end
