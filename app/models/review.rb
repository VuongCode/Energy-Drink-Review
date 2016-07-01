class Review < ActiveRecord::Base
  belongs_to :drink
  belongs_to :user
  has_many :votes

  validates :body, presence: true
  validates :rating, presence: true

  def score
    score = 0
    self.votes.each do |vote|
      if vote.upvote == 1
        score += 1
      elsif vote.upvote == -1
        score -= 1 unless score == 0
      end
    end
    return score
  end
end
