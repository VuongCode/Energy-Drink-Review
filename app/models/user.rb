class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :drinks
  has_many :reviews
  has_many :votes

  mount_uploader :avatar, AvatarUploader

  def admin?
    role == "admin"
  end

end
