class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def user_location
		geo_location = Geocoder.search([params[:latitude], params[:longitude]]).try(:first).try(:data)
		@my_location = geo_location["address"] rescue nil
		@full_address = geo_location["display_name"] if geo_location.present?
	end

	def show
		@user = User.find_by id: params[:id]
		redirect_to new_user_path, error: 'User not found' unless @user.present?
	end

	def create
		user = User.find_by(email: params[:user][:email])
		unless user.present?
			user = User.create(user_params)
		end
		if user.user_attendances.last.try(:present_date) == Date.today
			flash[:error] = "Your Attendance is Recorded for today.Now Record your Attendance at tomorrow!!!"
			redirect_to new_user_path
		else
			user_attendance = user.user_attendances.new(picture: params["image"],present_date: Date.today)
			if user_attendance.save
				flash[:success] = "Attendance Recorded."
				redirect_to user_path(user)
			else
				flash[:error] = "Issue facing during Attendance.Please try again after some time!!!"
				redirect_to new_user_path
			end
		end
	end


	def user_params
		params.require(:user).permit(:email, :address, :area, :state, :country, :pincode, :latitude, :longitude)
	end
end
