class CreateFunds < ActiveRecord::Migration[6.1]
  def change
    create_table :funds do |t|
      t.string :title
      t.integer :amount
      t.string :type_operation
      t.string :type_declaration
      t.string :icon
      t.datetime :date
      t.text :note
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
