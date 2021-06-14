class ReviewsController < ApplicationController
  def index
    # TODO: Scope on user
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    correct_repetitions = quiz_correct? ? @review.correct_repetitions + 1 : @review.correct_repetitions - 1

    @review.update(correct_repetitions: correct_repetitions, last_review: DateTime.now)
  end

  private

  def quiz_correct?
    params[:review][:quiz_correct] == "true"
  end
end
