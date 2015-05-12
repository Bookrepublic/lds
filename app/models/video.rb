class Video < ActiveRecord::Base
  validates :video, presence: true

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
  has_many :video_writers
  has_many :writers, through: :video_writers

  accepts_nested_attributes_for :tags, allow_destroy: true
  accepts_nested_attributes_for :pubblications, allow_destroy: true
  accepts_nested_attributes_for :writers, allow_destroy: true

  scope :published, -> {
    where(public: true).order("created_at desc")
  }

  scope :home_video, -> {
    where(public: true).order("RANDOM()").limit(1)
  }

  def filter_list
    tags.map(&:slug).join(" ") + " " + pubblications.map(&:slug).join(" ") + " " + writers.map(&:slug).join(" ") + " " + sponsors.map(&:slug).join(" ")
  end
end
