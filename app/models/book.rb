class Book < ActiveRecord::Base

  validates :title, :description, presence: true

  belongs_to :collection
  has_many :author_books
  has_many :authors, through: :author_books
  has_many :book_videos
  has_many :videos, through: :book_videos
  has_attached_file :cover
  validates_attachment_content_type :cover, content_type: /\Aimage/

  scope :published, -> {
    where(public: true)
  }

  def cover_url
    read_attribute(:cover_file_name).present? ? cover.url : "http://placehold.it/210x280"
  end

end
