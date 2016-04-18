class Group < ActiveRecord::Base
  has_many :users, through: :user_groups
  has_many :user_groups, dependent: :destroy
  belongs_to :admin, class_name: "User"

   accepts_nested_attributes_for :user_groups, allow_destroy: :true
end