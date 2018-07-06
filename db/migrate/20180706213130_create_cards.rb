class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :meaning
      t.string :image_url
      t.string :reverse
      t.string :up
      t.text :full_meaning

      t.timestamps
    end
  end
end
