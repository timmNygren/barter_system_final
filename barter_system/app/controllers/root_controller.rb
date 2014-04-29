class RootController < ApplicationController
	before_action :redirect_if_not_logged_in, only: [:index]

	def index
	end

	def welcome
	end

	private

	def redirect_if_not_logged_in
		unless user_signed_in?
			redirect_to welcome_url
		end
	end

end
