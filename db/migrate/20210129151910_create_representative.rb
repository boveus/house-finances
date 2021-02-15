class CreateRepresentative < ActiveRecord::Migration[6.0]
  def change
    create_table :representatives do |t|
      t.string :name, null: false
      t.string :district, null: false

      t.timestamps
    end
  end
end
