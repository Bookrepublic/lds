class Author < ActiveRecord::Base

  has_many :author_books
  has_many :books, through: :author_books
  has_many :author_videos
  has_many :videos, through: :author_videos
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage/

  validates :first_name, :last_name, presence: true

  scope :published, -> {
    where(public: true)
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
