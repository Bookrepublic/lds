class Video < ActiveRecord::Base

  has_many :book_videos
  has_many :books, through: :book_videos

end
