class Phrase < ApplicationRecord
  has_and_belongs_to_many :characters
  has_many :reviews
end
