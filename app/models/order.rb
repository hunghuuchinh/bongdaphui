class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :child_pitch

  validates :user_id, presence: true
  validates :child_pitch, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
