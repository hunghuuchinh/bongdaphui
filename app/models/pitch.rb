class Pitch < ActiveRecord::Base
  has_many :child_pitches
  mount_uploader :image, PictureUploader
  belongs_to :user
  validates :user_id ,presence: true
  validates :name ,length: {maximum: 200 }, presence: true
  validates :address, length: {maximum: 200} , presence: true
  validates :quantity, length: {minimum: 1} , numericality: true
  validates :rent_shoes , inclusion: {in: [true, false]}
  validates :rent_kit , inclusion: {in: [true, false]}
  validates :rent_ball, inclusion: {in: [true, false]}
  validates :description, presence: true
  validates :cost ,  numericality: true , presence: true

  after_create :create_child_pitches

  def create_child_pitches

    child_pitch_ids = (1..self.quantity).map do |f|
      child = ChildPitch.create
      child.id
    end
    self.update child_pitch_ids: child_pitch_ids
  end
end
