class SrsService
  attr_reader :last_review, :correct_repetitions, :easiness_factor

  def initialize(last_review:, correct_repetitions:, easiness_factor:)
    @last_review = last_review
    @correct_repetitions = correct_repetitions
    @easiness_factor = easiness_factor
  end

  def next_review
    # TODO: calculate next review with SRS algorithm
    return DateTime.tomorrow
  end
end
