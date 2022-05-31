class CreateFunds < ActiveRecord::Migration[6.1]
  def change
    create_table :funds do |t|
      t.string :title
      t.integer :amount
      t.string :type_operation
      t.datetime :date
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
