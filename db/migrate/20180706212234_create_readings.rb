class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.belongs_to :user, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
