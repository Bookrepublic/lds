class AddCollectionToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :collection, index: true, foreign_key: true
  end
end
