class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags
  has_many :video_tags, dependent: :destroy
  has_many :videos, through: :video_tags

  validates :tag, uniqueness: true

  def to_s
    "#{tag}"
  end
end
