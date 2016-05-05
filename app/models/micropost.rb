class Micropost < ActiveRecord::Base
  belongs_to :user
   validates :user_id, presence: true
   validates :title , presence: true, length: { maximum: 100 }
   validates :content, presence: true, length: { maximum: 5000 }
   default_scope -> { order(created_at: :desc) }
   mount_uploader :picture_micropost, PictureUploader
end
