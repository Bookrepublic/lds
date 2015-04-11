class CreateAuthorVideos < ActiveRecord::Migration
  def change
    create_table :author_videos do |t|
      t.references :author, index: true, foreign_key: true
      t.references :video, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
