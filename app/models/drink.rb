class Drink < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  mount_uploader :avatar, AvatarUploader
end
