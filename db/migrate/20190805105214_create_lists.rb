class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.text :content
      t.boolean :is_trash, default: false

      t.timestamps
    end
  end
end
