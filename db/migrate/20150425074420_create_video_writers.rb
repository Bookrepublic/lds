class CreateVideoWriters < ActiveRecord::Migration
  def change
    create_table :video_writers do |t|
      t.references :video, index: true, foreign_key: true
      t.references :writer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
