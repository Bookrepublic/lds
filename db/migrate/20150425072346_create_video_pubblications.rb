class CreateVideoPubblications < ActiveRecord::Migration
  def change
    create_table :video_pubblications do |t|
      t.references :video, index: true, foreign_key: true
      t.references :pubblication, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
