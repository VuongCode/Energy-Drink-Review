class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.drink.user.email,
      subject: "New Review for #{review.drink.name}"
    )
  end
end
