class Team < ActiveRecord::Base
  mount_uploader :photo, PictureUploader
  belongs_to :user
  validates :user_id ,presence: true
  validates :name ,length: {maximum: 50 }, presence: true
  validates :description, length: {maximum: 200 }, presence: true
end
