class CreatePubblicationWriters < ActiveRecord::Migration
  def change
    create_table :pubblication_writers do |t|
      t.references :pubblication, index: true
      t.references :writer, index: true

      t.timestamps null: false
    end
  end
end
