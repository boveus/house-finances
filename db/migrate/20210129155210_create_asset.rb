class CreateAsset < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.belongs_to :representative, index: true, foreign_key: true
      t.string :name, null: false
      t.string :date, null: false
      t.string :transaction_type
      t.string :ownership
      t.string :dollar_amount, null: false
      t.string :reference, null: false
    end
  end
end