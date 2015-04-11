class Video < ActiveRecord::Base

  has_many :book_videos
  has_many :books, through: :book_videos
  has_many :author_videos
  has_many :authors, through: :author_videos

end
