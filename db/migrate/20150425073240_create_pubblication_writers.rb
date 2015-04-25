class CreatePubblicationWriters < ActiveRecord::Migration
  def change
    create_table :pubblication_writers do |t|
      t.references :pubblication, index: true, foreign_key: true
      t.references :writer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
