class Character < ApplicationRecord
  has_and_belongs_to_many :phrases
  has_many :reviews
end
