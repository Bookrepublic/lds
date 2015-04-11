class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :first_name
      t.string :last_name
      t.text :biography

      t.timestamps null: false
    end
  end
end
