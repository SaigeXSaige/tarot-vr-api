class CreateReadingCards < ActiveRecord::Migration[5.2]
  def change
    create_table :reading_cards do |t|
      t.belongs_to :reading, foreign_key: true
      t.belongs_to :card, foreign_key: true

      t.timestamps
    end
  end
end
