class CreatePubblications < ActiveRecord::Migration
  def change
    create_table :pubblications do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
