class ChildPitch < ActiveRecord::Base
  belongs_to :pitch
  has_many :orders
end
