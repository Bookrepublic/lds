class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :subtitle
      t.text :excerpt
      t.text :article
      t.date :date
      t.boolean :status

      t.timestamps null: false
    end
  end
end
