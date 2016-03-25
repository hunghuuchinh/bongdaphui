class Pitch < ActiveRecord::Base
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
end
