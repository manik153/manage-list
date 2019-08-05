class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.text :content
      t.boolean :is_trash, default: false
      t.integer :order, default: 1
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
