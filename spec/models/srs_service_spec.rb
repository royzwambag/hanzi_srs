require "rails_helper"

RSpec.describe SrsService do  
  describe "#next_review" do
    context "when this is the first correct repetition" do
      subject { described_class.new(last_review: DateTime.new(2012, 1, 25), correct_repetitions: 1, easiness_factor: 1.0) }

      before { Timecop.freeze(DateTime.tomorrow) }

      it "returns tomorrow" do
        expect(subject.next_review).to eql (DateTime.tomorrow)
      end
    end
  end
end
