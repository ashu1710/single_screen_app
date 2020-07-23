class UserAttendance < ApplicationRecord
  
  ##relationship
 
  belongs_to :user
  has_one_attached :avatar
end
