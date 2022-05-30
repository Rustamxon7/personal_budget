class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.string :money, null: false
      t.string :icon, null: false
      t.integer :persons_array, array: true, default: []
      t.integer :person_id, null: false
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
