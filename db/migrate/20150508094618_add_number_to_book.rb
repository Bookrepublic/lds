class AddNumberToBook < ActiveRecord::Migration
  def change
    add_column :books, :number, :integer
  end
end
