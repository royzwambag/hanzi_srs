class Review < ApplicationRecord
  belongs_to :user
  belongs_to :character, optional: true
  belongs_to :phrase, optional: true

  validates_presence_of :character, if: Proc.new { |review| review.phrase.blank? }
  validates_presence_of :phrase, if: Proc.new { |review| review.character.blank? }
end
