class AddPublicToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :public, :boolean
  end
end
