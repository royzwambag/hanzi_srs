class Character < ApplicationRecord
  has_and_belongs_to_many :phrases
  has_many :reviews

  validates_presence_of :value
  validates_presence_of :pinyin
  validates_presence_of :english_translation

  after_create_commit { broadcast_append_to "characters" }
end
