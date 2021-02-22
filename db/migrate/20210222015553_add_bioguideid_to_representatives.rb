class AddBioguideidToRepresentatives < ActiveRecord::Migration[6.0]
  def change
    add_column :representatives, :bioguide_id, :string
  end
end
