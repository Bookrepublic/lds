class Post < ActiveRecord::Base

  validates :title, :article, presence: true

  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags

  scope :published, -> {
     where(status: true)
  }
end
