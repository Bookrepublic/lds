class Author < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: [:slugged, :finders]

  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books
  has_many :author_videos, dependent: :destroy
  has_many :videos, through: :author_videos
  has_attached_file :avatar, :styles => { :thumb => "125x125#", :medium => "300x300#" }, :convert_options => { :medium => "-quality 90 -strip" }
  validates_attachment_content_type :avatar, content_type: /\Aimage/

  validates :first_name, :last_name, presence: true

  scope :published, -> {
    where(public: true)
  }

  scope :random, -> {
    where(public: true).limit(6).order("RANDOM()")
  }

  def to_s
    "#{first_name} #{last_name}"
  end

  def full_name
    [first_name, last_name].join(" ")
  end

  def avatar_url
    read_attribute(:avatar_file_name).present? ? avatar.url : "http://placehold.it/140x100"
  end

end
