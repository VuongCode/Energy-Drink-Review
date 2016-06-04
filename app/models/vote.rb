class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :user, presence: true
  validates :upvote, presence: true
  validates :user, uniqueness: { scope: :review }
end
