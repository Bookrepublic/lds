class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :pages
      t.string :isbn
      t.date :pubblication_date
      t.string :link_bookrepublic
      t.string :link_amazon
      t.string :link_kobo
      t.string :link_apple

      t.timestamps null: false
    end
  end
end
