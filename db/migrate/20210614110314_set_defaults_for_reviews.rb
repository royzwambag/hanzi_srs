class SetDefaultsForReviews < ActiveRecord::Migration[6.1]
  def change
    change_column_default :reviews, :correct_repetitions, from: nil, to: 0
    change_column_default :reviews, :easiness_factor, from: nil, to: 1
  end
end
