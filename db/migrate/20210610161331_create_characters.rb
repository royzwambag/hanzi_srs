class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :value
      t.string :pinyin
      t.string :english_translation

      t.timestamps
    end
  end
end
