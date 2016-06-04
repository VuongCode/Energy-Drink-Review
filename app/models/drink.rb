class Drink < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  mount_uploader :avatar, AvatarUploader

  def average_rating
    ratings = []
    reviews = Review.where("drink_id = ?", id)
    reviews.each do |review|
      ratings << review.rating
    end

    total = 0
    if ratings == []
      return 0
    end

    ratings.each do |rating|
      total += rating.to_f
    end

    (total/ratings.length).round(1)
  end

  def self.search(search)
    where("Name LIKE ?", "%#{search}%")
  end
end
