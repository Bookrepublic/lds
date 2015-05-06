class AddPublicToBook < ActiveRecord::Migration
  def change
    add_column :books, :public, :boolean
  end
end
