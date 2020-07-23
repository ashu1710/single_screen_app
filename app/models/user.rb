class User < ApplicationRecord

	##relationships
	has_many :user_attendances, dependent: :destroy


	def get_full_address
		"#{self.address}, #{self.area}, #{self.state}, #{self.country}, #{self.pincode}" 
	end
end
