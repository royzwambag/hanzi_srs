class CreatePhrases < ActiveRecord::Migration[6.1]
  def change
    create_table :phrases do |t|
      t.string :value
      t.string :pinyin
      t.string :english_translation

      t.timestamps
    end

    create_table :characters_phrases, id: false do |t|
      t.belongs_to :character
      t.belongs_to :phrase
    end
  end
end
