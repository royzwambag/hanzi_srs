class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end
    
    create_table :reviews do |t|
      t.string :name
      t.belongs_to :user
      t.belongs_to :character
      t.belongs_to :phrase
      
      t.datetime :last_review
      t.datetime :next_review
      t.integer :correct_repetitions
      t.decimal :easiness_factor

      t.timestamps
    end
  end
end
