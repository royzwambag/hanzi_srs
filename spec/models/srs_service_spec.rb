require "rails_helper"

RSpec.describe SrsService do
  subject { described_class.new(last_review: DateTime.new(2012, 1, 25), correct_repetitions: 1, easiness_factor: 1.0) }

  describe "#next_review" do
    pending
  end
end
