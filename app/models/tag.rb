class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags
  has_many :video_tags
  has_many :videos, through: :video_tags
end
