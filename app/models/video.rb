class Video < ActiveRecord::Base

  has_many :book_videos
  has_many :books, through: :book_videos
  has_many :author_videos
  has_many :authors, through: :author_videos
  has_many :video_tags
  has_many :tags, through: :video_tags
  has_many :sponsor_videos
  has_many :sponsors, through: :sponsor_videos
  has_many :video_pubblications
  has_many :pubblications, through: :video_pubblications

end
