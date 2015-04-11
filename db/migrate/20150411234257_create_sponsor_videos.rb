class CreateSponsorVideos < ActiveRecord::Migration
  def change
    create_table :sponsor_videos do |t|
      t.references :sponsor, index: true, foreign_key: true
      t.references :video, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
