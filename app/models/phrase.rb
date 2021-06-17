class Phrase < ApplicationRecord
  has_and_belongs_to_many :characters
  has_many :reviews

  validates_presence_of :value
  validates_presence_of :pinyin
  validates_presence_of :english_translation

  after_create_commit { broadcast_append_to "phrases" }
  after_update_commit { broadcast_replace_to "phrases" }
  after_destroy_commit { broadcast_remove_to "phrases" }

  # TODO: Think how to link multiple values
end
