class AdminsController < ApplicationController
	
	def login
		@admin = Admin.find 1
	end
	
	def new
		@admin = Admin.find 1
		@title = ""
	end
	
	
end
