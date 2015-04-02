class Author < ActiveRecord::Base

  has_many :author_books
  has_many :books, through: :author_books
    has_attached_file :avatar
    validates_attachment_content_type :avatar, content_type: /\Aimage/

  validates :first_name, :last_name, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end

end
