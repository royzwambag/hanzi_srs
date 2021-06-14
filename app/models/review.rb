class Review < ApplicationRecord
  belongs_to :user
  belongs_to :character, optional: true
  belongs_to :phrase, optional: true

  validates_presence_of :character, if: Proc.new { |review| review.phrase.blank? }
  validates_presence_of :phrase, if: Proc.new { |review| review.character.blank? }

  before_update :set_next_review

  private

  def set_next_review
    self.next_review = SrsService.new(
      last_review: last_review,
      correct_repetitions: correct_repetitions,
      easiness_factor: easiness_factor
    ).next_review
  end
end
