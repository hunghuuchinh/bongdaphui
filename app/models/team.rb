class Team < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :user
  validates :user_id ,presence: true
  validates :name ,length: {maximum: 200 }, presence: true
  validates :description, presence: true
end
