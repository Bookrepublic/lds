class Book < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates :title, :number, :description, :isbn, presence: true
  validates :number, :isbn, uniqueness: true

  belongs_to :collection
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  has_many :book_videos, dependent: :destroy
  has_many :videos, through: :book_videos
  has_attached_file :cover, :styles => { :thumb => "125x188", :medium => "300x450" }, :convert_options => { :medium => "-quality 90 -strip" }
  validates_attachment_content_type :cover, content_type: /\Aimage/

  scope :published, -> {
    where(public: true).order("number desc")
  }

  scope :latest, -> {
    where(public: true).order("number desc").limit(6)
  }

  def slug_candidates
    [
      :title
    ]
  end

end
